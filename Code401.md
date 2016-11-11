# Binary Watch(二进制手表)

##　下面代码有问题，当４个灯亮时，为什么不可能是1:00 (32+16+8+4)

```Java
   public List<String> readBinaryWatch(int num) {
        int[] minits=new int[]{480,240,120,60,32,16,8,4,2,1};
        List<String> res=new LinkedList<String>();
        helper1(minits,res,0,num,0,0);
        return res;
    }
    
    private void helper1(int[] minits,List<String> res,int curMinits,int num,int count,int start){
        if(count==num){
            if(curMinits>=720) return;
            res.add(0,helper2(curMinits));
            return ;
        }
        for(int iter=start;iter<=minits.length-(num-count);iter++){
            helper1(minits,res,curMinits+minits[iter],num,count+1,iter+1);
        }
    }
    
    private String helper2(int num){
        int hours=num/60;
        int minits=num%60;
        String res=Integer.toString(hours);
        if(minits<10)
            return res+":0"+Integer.toString(minits);
        else
            return res+":"+Integer.toString(minits);
    }
```