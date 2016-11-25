# Maximum Product of Word Lengths(两个不包含相同字母的字符串的长度积)

* 一般思路:取出两个字符串，进行26个字母的比对
```Java
	//beats 16%
	public int maxProduct(String[] words) {
        if(words==null||words.length<2) return 0;
        
        int[][] cnt=new int[words.length][26];
        
        for(int i=0;i<words.length;i++)
            for(char c:words[i].toCharArray())
                cnt[i][c-'a']++;
            
    
        int res=0;
        for(int i=0;i<words.length;i++){
            for(int j=i+1;j<words.length;j++){
                if(j==i) continue;
                res=Math.max(res,helper(cnt[i],cnt[j]));
            }
        }
        return res;
    }
    
    private int helper(int[] cnt1,int[] cnt2){
        int num1=0,num2=0;
        for(int i=0;i<26;i++){
            if(cnt1[i]>0&&cnt2[i]==0) num1+=cnt1[i];
            else if(cnt1[i]==0&&cnt2[i]>0) num2+=cnt2[i];
            else if(cnt1[i]>0&&cnt2[i]>0) return 0;
        }
        return num1*num2;
    }
```

* 高级思路:用位图来进行比对，如果两个字符串不包含相同的字母，那它们的逻辑与为0

```Java
	//beats 68.84%
	public int maxProduct(String[] words) {
        if(words==null||words.length<2) return 0;
        
        int[] cnt=new int[words.length];
        
        for(int i=0;i<words.length;i++)
            for(char c:words[i].toCharArray())
                cnt[i]|=1<<c-'a';
            
    
        int res=0;
        for(int i=0;i<words.length;i++){
            for(int j=i+1;j<words.length;j++){
                if(j==i) continue;
                if((cnt[i]&cnt[j])==0)
                    res=Math.max(res,words[i].length()*words[j].length());
            }
        }
        return res;
    }
```