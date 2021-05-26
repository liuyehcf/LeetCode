# Pascal's Triangle II

```java
class Solution {
    public List<Integer> getRow(int rowIndex) {
        List<Integer> pre = null;

        for (int i = 1; i <= rowIndex + 1; i++) {
            if (i == 1) {
                pre = Arrays.asList(1);
                continue;
            }

            List<Integer> cur = new ArrayList<>();

            cur.add(1);

            for (int j = 0; j < pre.size() - 1; j++) {
                cur.add(pre.get(j) + pre.get(j + 1));
            }

            cur.add(1);

            pre = cur;
        }

        return pre;
    }
}
```