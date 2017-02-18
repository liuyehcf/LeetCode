# Ransom Note(判断后一个字符串是否包含前一个字符串的所有字符，顺序不重要)

* 基本思路就是酱紫

```Java
    public boolean canConstruct(String ransomNote, String magazine) {
        int[] cnt=new int[26];
        for(char c:magazine.toCharArray()){
            cnt[c-'a']++;
        }
        for(char c:ransomNote.toCharArray()){
            if(--cnt[c-'a']<0) return false;
        }
        return true;
    }
```