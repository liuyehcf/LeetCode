# Longest Consecutive Sequence

```java
class Solution {
    public int longestConsecutive(int[] nums) {
        int res = 0;
        // map[i]表示起始为i或者终止为i的最大长度
        Map<Integer, Integer> map = new HashMap<>();
        for (int num : nums) {
            if (map.containsKey(num)) continue;
            int leftSize = map.getOrDefault(num - 1, 0);
            int rightSize = map.getOrDefault(num + 1, 0);
            int size = leftSize + rightSize + 1;
            map.put(num - leftSize, size);
            map.put(num, size);
            map.put(num + rightSize, size);
            res = Math.max(res, size);
        }
        return res;
    }
}
```