# Remove Duplicate Letters

* ���裺��ջ
* ����ǰ��ĸ���ڶ����У�����(continue)
* ����ǰ��ĸ����ջ����ĸ������ջ����ĸ�ں������Դ��ڣ���ô���䵯����ѹ�뵱ǰԪ��

```java
class Solution {
public String removeDuplicateLetters(String s) {
        int[] cnt=new int[26];
        boolean[] isVisited=new boolean[26];
        LinkedList<Character> stack=new LinkedList<Character>();
        for(char c:s.toCharArray()){
            cnt[c-'a']++;
        }
        
        for(int i=0;i<s.length();i++){
            char c=s.charAt(i);
            if(isVisited[c-'a']) {
                cnt[c-'a']--;
                continue;
            }
            while(!stack.isEmpty()&&stack.peek()>c&&cnt[stack.peek()-'a']>0){
                isVisited[stack.pop()-'a']=false;
            }
            stack.push(c);
            isVisited[c-'a']=true;
            cnt[c-'a']--;
            
            System.out.println(stack);
        }
        
        StringBuilder sb=new StringBuilder();
        while(!stack.isEmpty()){
            sb.insert(0,stack.pop());
        }
        return sb.toString();
   }
}
```