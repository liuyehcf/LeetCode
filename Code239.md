# Sliding Window Maximum

在移动的过程中保存最大值队列（依次减小），当该最大值不在窗口中时，要移出，如果只存值，那么无法知道何时该移出，因此存的是最大值的下标

```java
class Solution {
    public int[] maxSlidingWindow(int[] nums, int k) {
        int[] res = new int[nums.length - k + 1];

        LinkedList<Integer> deque = new LinkedList<>();

        for (int i = 0; i < nums.length; i++) {
            while (!deque.isEmpty() && nums[deque.getLast()] < nums[i]) {
                deque.removeLast();
            }

            deque.addLast(i);

            if (i >= k && deque.getFirst() <= i - k) {
                deque.removeFirst();
            }

            if (i >= k - 1) {
                res[i - k + 1] = nums[deque.getFirst()];
            }
        }

        return res;
    }
}
```