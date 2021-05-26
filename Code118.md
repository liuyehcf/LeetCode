# Pascal's Triangle

```java
class Solution {
    public List<List<Integer>> generate(int numRows) {
        List<List<Integer>> res = new ArrayList<>();

        for (int i = 1; i <= numRows; i++) {
            if (i == 1) {
                res.add(Arrays.asList(1));
                continue;
            }

            List<Integer> pre = res.get(res.size() - 1);

            List<Integer> cur = new ArrayList<>();

            cur.add(1);

            for (int j = 0; j < pre.size() - 1; j++) {
                cur.add(pre.get(j) + pre.get(j + 1));
            }

            cur.add(1);

            res.add(cur);
        }

        return res;
    }
}
```