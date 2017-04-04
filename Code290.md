# Word Pattern

```Java
public class Solution {
    public boolean wordPattern(String pattern, String str) {
        String[] words=str.split(" ");
        if(words.length!=pattern.length()) return false;
        int[] cnt=new int[128];
        Arrays.fill(cnt,-1);
        Map<String,Integer> map=new HashMap<String,Integer>();
        for(int i=0;i<pattern.length();i++){
            char c=pattern.charAt(i);
            if(cnt[c]==-1){
                if(map.containsKey(words[i])) return false;
                map.put(words[i],i);
                cnt[c]=i;
            }
            else{
                if(!map.containsKey(words[i])) return false;
                if(map.get(words[i])!=cnt[c]) return false;
                map.put(words[i],i);
                cnt[c]=i;
            }
        }
        return true;
    }
}
```