# Insert Interval

```java
class Solution {
    public int[][] insert(int[][] intervals, int[] newInterval) {
        List<int[]> finalIntervals = new ArrayList<>();

        for (int[] interval : intervals) {
            if (newInterval == null) {
                finalIntervals.add(interval);
            } else if (interval[1] < newInterval[0]) {
                finalIntervals.add(interval);
            } else if (newInterval[1] < interval[0]) {
                finalIntervals.add(newInterval);
                finalIntervals.add(interval);
                newInterval = null;
            } else {
                newInterval[0] = Math.min(newInterval[0], interval[0]);
                newInterval[1] = Math.max(newInterval[1], interval[1]);
            }
        }

        if (newInterval != null) {
            finalIntervals.add(newInterval);
        }

        return finalIntervals.toArray(new int[0][]);
    }
}
```