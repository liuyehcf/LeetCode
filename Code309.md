# Best Time to Buy and Sell Stock with Cooldown(����������棬����֮�����ټ��һ��)

* �޷���֮ǰ�Ķ�̬�滮�����㣬��buy[i]/sell[i]��ʾ��i����������������
* ��buys[i]/rests[i]/sells[i]��ʾǰi�죬���һ�ν���Ϊ����Ϣ�������������
```java
class Solution {
//beats 36.32%
    public int maxProfit(int[] prices) {
        if(prices.length<=1) return 0;
        //ǰn�죬���ݣ�����������棬�����Ƶ�n��ľ�����Ϊ,���һ�������ݣ���
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
}
```

* ���߸ɴ಻Ҫrests
```java
class Solution {
public int maxProfit(int[] prices) {
        if(prices.length<=1) return 0;
        //ǰn�죬���ݣ�����������棬�����Ƶ�n��ľ�����Ϊ,���һ�������ݣ���
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
}
```