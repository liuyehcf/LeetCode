# Best Time to Buy and Sell Stock II

```Java
    //beats 11.23%
    public int maxProfit(int[] prices) {
        int res=0;
        for(int i=1;i<prices.length;i++){
            res+=prices[i]>prices[i-1]?prices[i]-prices[i-1]:0;
        }
        return res;
    }
```