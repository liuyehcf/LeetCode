# Palindrome Number

```java
class Solution {
    public boolean isPalindrome(int x) {
        if (x < 0) {
            return false;
        }

        List<Integer> nums = new ArrayList<>();

        while (x != 0) {
            int tail = x % 10;
            nums.add(tail);
            x /= 10;
        }

        for (int i = 0; i < (nums.size() >> 1); i++) {
            if (nums.get(i) != nums.get(nums.size() - i - 1)) {
                return false;
            }
        }

        return true;
    }
}
```