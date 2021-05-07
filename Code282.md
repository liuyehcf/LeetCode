# Expression Add Operators


```java
//beats 83.89%
class Solution {
    public List<String> addOperators(String num, int target) {
        List<String> res=new ArrayList<String>();
        StringBuilder sb=new StringBuilder();
        helper(num,0,0,0,target,res,sb);
        return res;
    }
    
    private void helper(String num,int pos,int pre,int sum,int target,List<String> res,StringBuilder sb){
        if(pos==num.length()){
            if(sum+pre==target){
                res.add(sb.toString());
            }
            return;
        }
        
        int lenMax=10;//int最多10位，2147483647，而且还得用long来判断一下
        
        if(num.charAt(pos)=='0') {//如果点为0，那么可取得的数只能是0
            lenMax=1;
        }
        
        for(int len=1;pos+len-1<num.length()&&len<=lenMax;len++){
            Long temp=Long.parseLong(num.substring(pos,pos+len));
            if(temp>(long)Integer.MAX_VALUE) break;

            int val=temp.intValue();
            
            int sbLen=sb.length();
            if(sbLen==0){
                sb.append(val);
                helper(num,pos+len,val,sum+pre,target,res,sb);
                sb.setLength(sbLen);
            }
            else{
                sb.append("+"+val);
                helper(num,pos+len,val,sum+pre,target,res,sb);
                sb.setLength(sbLen);
                    
                sb.append("-"+val);
                helper(num,pos+len,-val,sum+pre,target,res,sb);
                sb.setLength(sbLen);
                    
                sb.append("*"+val);
                helper(num,pos+len,pre*val,sum,target,res,sb);
                sb.setLength(sbLen);
            }
        }
    }
}
```