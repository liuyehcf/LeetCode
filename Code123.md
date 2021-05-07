# Best Time to Buy and Sell Stock III

```Java
    //beats 21.50%
    public int maxProfit(int[] prices) {
        int[] buys=new int[2];
        int[] sells=new int[2];
        Arrays.fill(buys,Integer.MIN_VALUE);
        
        for(int price:prices){
            buys[0]=Math.max(buys[0],-price);
            sells[0]=Math.max(sells[0],buys[0]+price);
            
            buys[1]=Math.max(buys[1],sells[0]-price);
            sells[1]=Math.max(sells[1],buys[1]+price);
        }
        
        return sells[1];
    }
```