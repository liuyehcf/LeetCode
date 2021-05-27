# Best Time to Buy and Sell Stock

```java
class Solution {
    public int maxProfit(int[] prices) {
        int buyPrice = Integer.MIN_VALUE;
        int sellPrice = 0;

        for (int price : prices) {
            buyPrice = Math.max(buyPrice, -price);
            sellPrice = Math.max(sellPrice, buyPrice + price);
        }

        return sellPrice;
    }
}
```