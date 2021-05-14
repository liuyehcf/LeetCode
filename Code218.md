# The Skyline Problem

某一个位置的点（开始或者结束）必须同时计算，因为有可能两个分段是黏在一起的，避免算两次。等效于计算最大高度变化时的坐标

```java
class Solution {
    public List<List<Integer>> getSkyline(int[][] buildings) {
        final int LEFT = 0;
        final int RIGHT = 1;

        Map<Integer, List<int[]>> posPointMap = new TreeMap<>();
        for (int[] building : buildings) {
            if (!posPointMap.containsKey(building[0])) {
                posPointMap.put(building[0], new ArrayList<>());
            }
            posPointMap.get(building[0]).add(new int[]{building[2], LEFT});

            if (!posPointMap.containsKey(building[1])) {
                posPointMap.put(building[1], new ArrayList<>());
            }
            posPointMap.get(building[1]).add(new int[]{building[2], RIGHT});
        }

        Queue<Integer> queue = new PriorityQueue<>((obj1, obj2) -> obj2 - obj1);

        List<List<Integer>> res = new ArrayList<>();
        int preHigh = -1;
        for (Map.Entry<Integer, List<int[]>> p : posPointMap.entrySet()) {
            for (int[] point : p.getValue()) {
                if (point[1] == LEFT) {
                    queue.offer(point[0]);
                } else {
                    queue.remove(point[0]);
                }
            }
            int curHigh;
            if (queue.isEmpty()) {
                curHigh = 0;
            } else {
                curHigh = queue.peek();
            }

            if (curHigh != preHigh) {
                preHigh = curHigh;
                res.add(Arrays.asList(p.getKey(), curHigh));
            }
        }
        return res;
    }
}
```