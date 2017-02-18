# Longest Palindrome(最长的回文序列)

* 很简单，如果有字符出现了奇数次那么，取出该字符放在最中间
* 其他两个两个放在旁边即可

```Java
    public int longestPalindrome(String s) {
        int[] cnt=new int[128];
        for(char c:s.toCharArray())
            cnt[c]++;
        boolean hasSingle=false;
        int res=0;
        for(char c=0;c<128;c++){
            if((cnt[c]&1)!=0) hasSingle=true;
            res+=cnt[c]/2*2;
        }
        return res+(hasSingle?1:0);
    }
```