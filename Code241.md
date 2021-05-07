# Different Ways to Add Parentheses

```java
//beats 5.14%
class Solution {
    public List<Integer> diffWaysToCompute(String input) {
        return helper(input);
    }
    
    private static final String operations="+-*/";
    
    private List<Integer> helper(String input){
        List<Integer> operatorPos=new ArrayList<Integer>();
        for(int i=0;i<input.length();i++){
            if(operations.indexOf(input.charAt(i))!=-1){
                operatorPos.add(i);
            }
        }
        
        if(operatorPos.size()==0) return new ArrayList<Integer>(Arrays.asList(Integer.parseInt(input)));
        
        List<Integer> res=new ArrayList<Integer>();
        for(int i=0;i<operatorPos.size();i++){
            int pos=operatorPos.get(i);
            List<Integer> leftRes=helper(input.substring(0,pos));
            List<Integer> rightRes=helper(input.substring(pos+1));
            
            char sign=input.charAt(pos);
            for(int left:leftRes){
                for(int right:rightRes){
                    if(sign=='+'){
                        res.add(left+right);
                    }
                    else if(sign=='-'){
                        res.add(left-right);
                    }
                    else if(sign=='*'){
                        res.add(left*right);
                    }
                }
            }
        }
        return res;
    }
}
```

* add cache
```java
class Solution {
    public List<Integer> diffWaysToCompute(String input) {
        map=new HashMap<String,List<Integer>>();
        return helper(input);
    }
    
    private static final String operations="+-*/";
    
    private static Map<String,List<Integer>> map;
    
    private List<Integer> helper(String input){
        if(map.containsKey(input)) return map.get(input);
        List<Integer> operatorPos=new ArrayList<Integer>();
        for(int i=0;i<input.length();i++){
            if(operations.indexOf(input.charAt(i))!=-1){
                operatorPos.add(i);
            }
        }
        
        if(operatorPos.size()==0) return new ArrayList<Integer>(Arrays.asList(Integer.parseInt(input)));
        
        List<Integer> res=new ArrayList<Integer>();
        for(int i=0;i<operatorPos.size();i++){
            int pos=operatorPos.get(i);
            List<Integer> leftRes=helper(input.substring(0,pos));
            List<Integer> rightRes=helper(input.substring(pos+1));
            
            char sign=input.charAt(pos);
            for(int left:leftRes){
                for(int right:rightRes){
                    if(sign=='+'){
                        res.add(left+right);
                    }
                    else if(sign=='-'){
                        res.add(left-right);
                    }
                    else if(sign=='*'){
                        res.add(left*right);
                    }
                }
            }
        }
        map.put(input,res);
        return res;
    }
}
```