# Longest Consecutive Sequence

```java
class Solution {
    public int longestConsecutive(int[] nums) {
        int res = 0;
        Set<Integer> set = new HashSet<>();
        for (int num : nums) {
            set.add(num);
        }
        
        for (int num : nums) {
            int right = num;

            while (set.contains(++right)) {
                set.remove(right);
            }

            int left = num;

            while (set.contains(--left)) {
                set.remove(left);
            }

            res = Math.max(res, right - 1 - (left + 1) + 1);
        }
        return res;
    }
}
```