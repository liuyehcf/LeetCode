# Remove Duplicate Letters

* 精髓：堆栈
* 若当前字母已在队列中，跳过(continue)
* 若当前字母大于栈顶字母，并且栈顶字母在后续中仍存在，那么将其弹出，压入当前元素

```Java
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
```