# Reverse Vowels of a String(反转元音字符)

## 找出所有元音字符的位置，然后遍历这些位置，调转一下即可
```Java
   public String reverseVowels(String s) {
        String vowels="aeiouAEIOU";
        List<Integer> posVowels=new ArrayList<Integer>();
        for(int i=0;i<s.length();i++){
            if(vowels.indexOf(s.charAt(i))!=-1) posVowels.add(i);
        }
        char[] ary=s.toCharArray();
        for(int i=0;i<posVowels.size()/2;i++){
            int pos1=posVowels.get(i);
            int pos2=posVowels.get(posVowels.size()-1-i);
            char temp=ary[pos1];
            ary[pos1]=ary[pos2];
            ary[pos2]=temp;
        }
        return String.valueOf(ary);
    }
```

```Java
    public String reverseVowels(String s) {
        String vowels="aeiouAEIOU";
        int start=0,end=s.length()-1;
        
        char[] ary=s.toCharArray();
        while(start<=end){
            while(start<=end&&vowels.indexOf(s.charAt(start))==-1){
                start++;
            }
            while(start<=end&&vowels.indexOf(s.charAt(end))==-1){
                end--;
            }
            if(start>end) break;
            
            char temp=ary[start];
            ary[start]=ary[end];
            ary[end]=temp;
            start++;
            end--;
        }
        return String.valueOf(ary);
    }
```
