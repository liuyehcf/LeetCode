# 从给定字符串中找出所有乱序包含模式字符串的等长字符串
## 一开始的思路
* 用pcnt记录模式串各字符的次数
* 用scnt记录目标字符串在给定区域的字符串次数
* 用curLength表示当前字符子串包含模式字符串字符的个数
## 问题
```java
public List<Integer> findAnagrams(String s, String p) {
        List<Integer> res=new ArrayList<Integer>();
        int[] pcnt=new int[26];
        for(char c:p.toCharArray()){
            pcnt[c-'a']++;
        }
        int[] scnt=new int[26];
        int curLength=0;
        for(int i=0;i<s.length();i++){
            //first remove the invalid char
            int j=i-p.length();
            if(j>=0){
                scnt[j-'a']--;
                curLength--;
            }
            
            //offer the current char
            char c=s.charAt(i);
            int index=c-'a';
            if(scnt[index]==pcnt[index]) continue;
            scnt[index]++;
            if(++curLength==p.length()){
                res.add(j+1);
            }
        }
   }
}
```
* 发现无法在给定长度的子串中确定是否匹配
* 换句话说，当子串中某字符出现次数超过模式子串中该字符出现次数时，你无法简单地进行处理

## 另一种思路，借鉴之前有一道题，找出所有包含模式字符串的起始位置(其包含的字符串可以多余模式字符串含有的字符数)
```java
public List<Integer> findAnagrams(String s, String p) {
        List<Integer> res=new ArrayList<Integer>();
        
        int[] pcnt=new int[26];
        for(char c:p.toCharArray())
            pcnt[c-'a']++;
        
        int left=0,right=0;
        int curLength=0;//子串长度
        int activeLength=0;//有效长度
        int[] scnt=new int[26];
        
        while(right<s.length()){
            //此刻，子串的位置是[left,right-1]，不包括right这个位置哦
            if(curLength==p.length()){
                curLength--;
                activeLength--;
                scnt[s.charAt(left)-'a']--;
                left++;
            }
            char c=s.charAt(right++);
            scnt[c-'a']++;
            curLength++;
            while(scnt[c-'a']>pcnt[c-'a']){//当发现该字符出现次数多余模式串中该字符出现的次数时，循环右移其左端点，直至次数相同
                curLength--;
                activeLength--;
                scnt[s.charAt(left)-'a']--;
                left++;
            }
            if(++activeLength==p.length()){//完成上面的while循环后，递增有效长度，当有效长度等于模式串时，即匹配完成
                res.add(left);
            }
        }
        return res;
   }
}
```
* 该方法的复杂度为O(N)，常数为2，即最多遍历s两遍
* 若暴力求解:每次判断p.length()长度的子串，那么复杂度为O(MN)(M为s长度，N为p长度)
