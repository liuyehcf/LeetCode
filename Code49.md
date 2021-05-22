# Group Anagrams

```java
class Solution {
    public List<List<String>> groupAnagrams(String[] strs) {
        Map<String, List<String>> anagrams=new HashMap<>();
        
        for(String str:strs) {
            String sortedStr=sortOf(str);
            
            if(!anagrams.containsKey(sortedStr)) {
                anagrams.put(sortedStr, new ArrayList<>());
            }
            
            anagrams.get(sortedStr).add(str);
        }
        
        return new ArrayList<>(anagrams.values());
    }
    
    private String sortOf(String s) {
        char[] charArrays=s.toCharArray();
        Arrays.sort(charArrays);
        return String.valueOf(charArrays);
    }
}
```