# Reverse Integer

```java
class Solution {
    public int reverse(int x) {
        long absX = Math.abs(x);

        long reverse = 0;

        while (absX != 0) {
            reverse = reverse * 10 + absX % 10;
            absX /= 10;
        }

        if (x < 0) {
            reverse *= -1;
        }

        if (reverse < Integer.MIN_VALUE || reverse > Integer.MAX_VALUE) {
            return 0;
        }
        return (int) reverse;
    }
}
```