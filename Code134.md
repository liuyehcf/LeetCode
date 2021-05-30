# Gas Station

```java
public class Solution {
    public int canCompleteCircuit(int[] gas, int[] cost) {
        int tank = 0, debt = 0, start = 0;

        for (int i = 0; i < gas.length; i++) {
            tank += gas[i] - cost[i];

            if (tank < 0) {
                start = i + 1;
                debt += tank;
                tank = 0;
            }
        }

        if (tank + debt >= 0) {
            return start;
        } else {
            return -1;
        }
    }
}
```