# Best Time to Buy and Sell Stock
* 注意点：buy初始化为最小值

```Java
	//beats 10.71%
	public int maxProfit(int[] prices) {
        int buy=Integer.MIN_VALUE;
        int sell=0;
        
        for(int price:prices){
            buy=Math.max(buy,-price);
            sell=Math.max(sell,buy+price);
        }
        
        return sell;
    }
```