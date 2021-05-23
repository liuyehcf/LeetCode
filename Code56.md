# Merge Intervals

```java
class Solution {
    public int[][] merge(int[][] intervals) {
        Arrays.sort(intervals, (o1, o2) -> {
            return o1[0] - o2[0];
        });


        List<int[]> mergedIntervals = new ArrayList<>();

        int[] pre = intervals[0];
        for (int i = 1; i < intervals.length; i++) {
            int[] cur = intervals[i];

            if (pre[1] >= cur[1]) {
                // do nothing
            } else if (pre[1] < cur[0]) {
                mergedIntervals.add(pre);
                pre = cur;
            } else {
                pre[1] = cur[1];
            }
        }

        mergedIntervals.add(pre);

        return mergedIntervals.toArray(new int[0][]);
    }
}
```