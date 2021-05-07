# Letter Combinations of a Phone Number

```java
//beats 50.42%
class Solution {
    private String[] table={
        "abc","def","ghi","jkl","mno","pqrs","tuv","wxyz"
    };
    public List<String> letterCombinations(String digits) {
        StringBuilder sb=new StringBuilder();
        List<String> res=new ArrayList<String>();
        if(digits.length()==0) return res;
        helper(digits,0,sb,res);
        return res;
    }
    private void helper(String digits,int pos,StringBuilder sb,List<String> res){
        if(pos==digits.length()){
            res.add(sb.toString());
            return;
        }
        for(char c:table[digits.charAt(pos)-'2'].toCharArray()){
            int size=sb.length();
            sb.append(c);
            helper(digits,pos+1,sb,res);
            sb.setLength(size);
        }
    }
}
```