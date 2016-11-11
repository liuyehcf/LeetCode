# Find the Difference(两个字符串中找出不同的字符)

*没什么好说的，很常规

```Java
    //beats 86%
    public char findTheDifference(String s, String t) {
        int[] count=new int[26];
        for(char c:s.toCharArray())
            count[c-'a']++;
        for(char c:t.toCharArray())
            count[c-'a']--;
        for(int i=0;i<26;i++){
            if(count[i]!=0) return (char)(i+'a');
        }
        throw new RuntimeException();
    }
```