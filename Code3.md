# Longest Substring Without Repeating Characters
* 移动窗口法

```Java
    //beats 89.60%
    public int lengthOfLongestSubstring(String s) {
        int left=0,right=0;
        int[] cnt=new int[128];
        int res=0;
        while(right<s.length()){
            cnt[s.charAt(right)]++;
            while(cnt[s.charAt(right)]>1){
                cnt[s.charAt(left++)]--;
            }
            res=Math.max(res,right-left+1);
            right++;
        }
        return res;
    }
```