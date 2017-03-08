# Generate Parentheses


```Java
//beats 60.56%
public class Solution {
    public List<String> generateParenthesis(int n) {
        List<String> res=new ArrayList<String>();
        StringBuilder sb=new StringBuilder();
        
        helper(res,sb,0,0,n);
        return res;
    }
    
    private void helper(List<String> res,StringBuilder sb,int leftCnt,int rightCnt,int n){
        if(rightCnt==n){
            res.add(sb.toString());
            return;
        }
        
        int len=sb.length();
        
        if(leftCnt==rightCnt){
            sb.append('(');
            helper(res,sb,leftCnt+1,rightCnt,n);
            sb.setLength(len);
        }
        else if(leftCnt==n){
            sb.append(')');
            helper(res,sb,leftCnt,rightCnt+1,n);
            sb.setLength(len);
        }
        else{
            sb.append('(');
            helper(res,sb,leftCnt+1,rightCnt,n);
            sb.setLength(len);
            sb.append(')');
            helper(res,sb,leftCnt,rightCnt+1,n);
            sb.setLength(len);
        }
    }
}
```