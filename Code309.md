# Best Time to Buy and Sell Stock with Cooldown(买卖最大收益，买卖之间至少间隔一天)

* 无法用之前的动态规划来计算，即buy[i]/sell[i]表示第i次买或卖的最大收益
* 用buys[i]/rests[i]/sells[i]表示前i天，最后一次交易为买，休息，卖的最大收益
```Java
	//beats 36.32%
	public int maxProfit(int[] prices) {
        if(prices.length<=1) return 0;
        //前n天，买，休，卖的最大收益，不限制第n天的具体行为,最后一次是买，休，卖
        int[] buys=new int[prices.length+1];
        int[] rests=new int[prices.length+1];
        int[] sells=new int[prices.length+1];
        buys[0]=Integer.MIN_VALUE;
        for(int i=1;i<=prices.length;i++){
            buys[i]=Math.max(buys[i-1],rests[i-1]-prices[i-1]);
            rests[i]=sells[i-1];
            sells[i]=Math.max(sells[i-1],buys[i]+prices[i-1]);
        }
        return sells[prices.length];
    }
```

* 或者干脆不要rests
```Java
	public int maxProfit(int[] prices) {
        if(prices.length<=1) return 0;
        //前n天，买，休，卖的最大收益，不限制第n天的具体行为,最后一次是买，休，卖
        int[] buys=new int[prices.length+1];
        int[] sells=new int[prices.length+1];
        buys[0]=Integer.MIN_VALUE;
        for(int i=1;i<=prices.length;i++){
            if(i>=2)
                buys[i]=Math.max(buys[i-1],sells[i-2]-prices[i-1]);
            else 
                buys[i]=Math.max(buys[i-1],0-prices[i-1]);
            sells[i]=Math.max(sells[i-1],buys[i]+prices[i-1]);
        }
        return sells[prices.length];
    }
```