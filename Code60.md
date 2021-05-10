# Permutation Sequence

```java
class Solution {
    public String getPermutation(int n, int k) {
        int total[] = new int[n];

        total[0] = 1;

        for (int i = 2; i <= n; i++) {
            total[i - 1] = total[i - 1 - 1] * i;
        }

        List<Integer> candidates = new ArrayList<>();
        for (int i = 1; i <= n; i++) {
            candidates.add(i);
        }

        StringBuilder sb = new StringBuilder();

        for (int i = n; i >= 2; i--) {
            int index = (k - 1) / total[i - 1 - 1];
            sb.append(candidates.remove(index));
            k -= index * total[i - 1 - 1];
        }

        sb.append(candidates.get(0));

        return sb.toString();
    }
}
```