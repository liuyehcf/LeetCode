# Group Anagrams

```Java
//beats 52.44%
public class Solution {
    public List<List<String>> groupAnagrams(String[] strs) {
        Map<String,List<String>> map=new HashMap<String,List<String>>();
        
        for(String str:strs){
            String strOrdered=getOrderedString(str);
            if(map.containsKey(strOrdered)){
                map.get(strOrdered).add(str);
            }
            else{
                map.put(strOrdered,new ArrayList<String>(Arrays.asList(str)));
            }
        }
        
        List<List<String>> res=new ArrayList<List<String>>();
        for(Map.Entry<String,List<String>> m:map.entrySet()){
            res.add(m.getValue());
        }
        return res;
    }
    
    private String getOrderedString(String s){
        char[] sary=s.toCharArray();
        Arrays.sort(sary);
        return String.valueOf(sary);
    }
}
```