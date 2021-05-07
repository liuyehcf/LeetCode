# Substring with Concatenation of All Words

* Time limit
```java
class Solution {
    public List<Integer> findSubstring(String s, String[] words) {
        Set<Integer> res=new HashSet<Integer>();
        if(words.length==0) return new ArrayList<Integer>();
        
        int len=words[0].length();
        
        Map<String,Integer> map=new HashMap<String,Integer>();
        for(String word:words){
            if(map.containsKey(word)){
                map.put(word,map.get(word)+1);
            }
            else{
                map.put(word,1);
            }
        }
            
        
        for(int i=0;i<s.length();i++){
            if(res.contains(i))continue;
            int left=i;
            int right=left+len;
            int count=0;
            Map<String,Integer> cnt=new HashMap<String,Integer>();
            while(right<=s.length()){
                String temp=s.substring(right-len,right);
                if(!map.containsKey(temp)) break;
                
                if(cnt.containsKey(temp)){
                    cnt.put(temp,cnt.get(temp)+1);
                }   
                else{
                    cnt.put(temp,1);
                }
                count++;
                
                while(cnt.get(temp)>map.get(temp)){
                    String temp2=s.substring(left,left+len);
                    cnt.put(temp2,cnt.get(temp2)-1);
                    left+=len;
                    count--;
                }   
                if(count==words.length) {
                    res.add(left);
                }
                right+=len;
            }
        }
        return new ArrayList<Integer>(res);
    }
}
```