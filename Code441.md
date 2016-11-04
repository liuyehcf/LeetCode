# 从给定字符串中找出所有乱序包含模式字符串的等长字符串
## 一开始的思路
* 用pcnt记录模式串各字符的次数
* 用scnt记录目标字符串在给定区域的字符串次数
* 用curLength表示当前字符子串包含模式字符串字符的个数
## 问题
'''Java
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
'''
* 发现无法在给定长度的子串中确定是否匹配

## 另一种思路，借鉴之前有一道题，找出所有包含模式字符串的起始位置(其包含的字符串可以多余模式字符串含有的字符数)

