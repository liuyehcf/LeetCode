# IPO

```java
class Solution {
    public int findMaximizedCapital(int k, int w, int[] profits, int[] capital) {
        Queue<int[]> capitalMinQueue = new PriorityQueue<>((o1, o2) -> o1[1] - o2[1]);
        Queue<int[]> profitMaxQueue = new PriorityQueue<>((o1, o2) -> o2[0] - o1[0]);

        for (int i = 0; i < profits.length; i++) {
            capitalMinQueue.offer(new int[]{profits[i], capital[i]});
        }

        for (int i = 0; i < k; i++) {
            while (!capitalMinQueue.isEmpty() && w >= capitalMinQueue.peek()[1]) {
                profitMaxQueue.offer(capitalMinQueue.poll());
            }

            if (profitMaxQueue.isEmpty()) {
                return w;
            }

            w += profitMaxQueue.poll()[0];
        }

        return w;
    }
}
```