# Best Time to Buy and Sell Stock IV

```java
class Solution {
    public int maxProfit(int k, int[] prices) {
        if (prices.length == 0 || k == 0) {
            return 0;
        }

        int[] buys = new int[k];
        int[] sells = new int[k];

        Arrays.fill(buys, Integer.MIN_VALUE);
        Arrays.fill(sells, Integer.MIN_VALUE);

        for (int price : prices) {
            for (int i = 0; i < k; i++) {
                if (i == 0) {
                    buys[i] = Math.max(buys[i], -price);
                } else {
                    buys[i] = Math.max(buys[i], sells[i - 1] - price);
                }

                sells[i] = Math.max(sells[i], buys[i] + price);
            }
        }

        return sells[k - 1];
    }
}
```