# Candy

```java
class Solution {
    public int candy(int[] ratings) {
        int[] candy = new int[ratings.length];

        Arrays.fill(candy, 1);

        while (true) {
            boolean canBreak = true;

            for (int i = 1; i < ratings.length; i++) {
                if (ratings[i] > ratings[i - 1] && candy[i] <= candy[i - 1]) {
                    candy[i] = candy[i - 1] + 1;
                    canBreak = false;
                }
            }

            for (int i = ratings.length - 2; i >= 0; i--) {
                if (ratings[i] > ratings[i + 1] && candy[i] <= candy[i + 1]) {
                    candy[i] = candy[i + 1] + 1;
                    canBreak = false;
                }
            }

            if (canBreak) {
                break;
            }
        }

        int sum = 0;

        for (int num : candy) {
            sum += num;
        }

        return sum;
    }
}
```