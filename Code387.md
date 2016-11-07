# First Unique Character in a String(找到第一个不重复的字符的下标，没有则返回-1)

## 一般思路

* 最开始卡壳了一下，就想用一个map来完成这道题，从Character到出现的位置或者从Character到出现的次数，都不行
* 需要增加一个数组来记录次数，或者记录位置

* 以下是从Character映射到位置
```Java
	public int firstUniqChar(String s) {
        Map<Character,Integer> mapCharToPos=new HashMap<Character,Integer>();
        int[] cnt=new int[s.length()];
        for(int i=0;i<s.length();i++){
            char c=s.charAt(i);
            if(mapCharToPos.containsKey(c)){
                cnt[mapCharToPos.get(c)]++;
            }else{
                mapCharToPos.put(c,i);
                cnt[i]++;
            }
        }
        for(int i=0;i<s.length();i++){
            if(cnt[i]==1) return i;
        }
        return -1;
    }
```

* 以下是从Character映射到次数
```Java
	public int firstUniqChar(String s) {
        Map<Character,Integer> mapCharToCount=new HashMap<Character,Integer>();
        int[] pos=new int[26];
        for(int i=0;i<s.length();i++){
            char c=s.charAt(i);
            if(mapCharToCount.containsKey(c)){
                mapCharToCount.put(c,mapCharToCount.get(c)+1);
            }else{
                pos[c-'a']=i;
                mapCharToCount.put(c,1);
            }
        }
        int res=Integer.MAX_VALUE;
        for(char c='a';c<='z';c++){
            if(mapCharToCount.containsKey(c)&&mapCharToCount.get(c)==1){
                res=Math.min(res,pos[c-'a']);
            }
        }
        return res==Integer.MAX_VALUE?-1:res;
    }
```

## 思维定式真可怕

```Java
	public int firstUniqChar(String s) {
        int[] cnt=new int[26];
        for(char c:s.toCharArray()){
            cnt[c-'a']++;
        }
        for(int i=0;i<s.length();i++){
            if(cnt[s.charAt(i)-'a']==1) return i;
        }
        return -1;
    }
```