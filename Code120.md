# Triangle

```java
class Solution {
    public int minimumTotal(List<List<Integer>> triangle) {
        for (int i = 1; i < triangle.size(); i++) {
            List<Integer> preLine = triangle.get(i - 1);
            List<Integer> curLine = triangle.get(i);

            curLine.set(0, curLine.get(0) + preLine.get(0));
            for (int j = 1; j < i; j++) {
                curLine.set(j, curLine.get(j) + Math.min(preLine.get(j - 1), preLine.get(j)));
            }
            curLine.set(i, curLine.get(i) + preLine.get(i - 1));
        }

        int min = Integer.MAX_VALUE;

        for (int value : triangle.get(triangle.size() - 1)) {
            if (value < min) {
                min = value;
            }
        }

        return min;
    }
}
```