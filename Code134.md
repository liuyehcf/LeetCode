# Gas Station

```java
public class Solution {
    public int canCompleteCircuit(int[] gas, int[] cost) {
        int start = 0, debt = 0, tank = 0;
        for (int i = 0; i < gas.length; i++) {
            tank = tank + gas[i] - cost[i];
            if (tank < 0) {
                start = i + 1;
                debt += tank;
                tank = 0;
            }
        }
        return (debt + tank < 0) ? -1 : start;
    }
}
```