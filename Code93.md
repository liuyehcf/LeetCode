# Restore IP Addresses

```java
class Solution {
    public List<String> restoreIpAddresses(String s) {
        List<String> res = new ArrayList<>();
        StringBuilder sb = new StringBuilder();

        restoreIpAddresses(res, sb, s, 0, 0);

        return res;
    }

    private void restoreIpAddresses(List<String> res, StringBuilder sb,
                                    String s, int start, int index) {
        if (index == 4) {
            if (start < s.length()) {
                return;
            }

            res.add(sb.substring(1));
            return;
        }
        if (start == s.length()) {
            return;
        }

        int originalLen = sb.length();

        String sub1 = s.substring(start, start + 1);
        int val1 = Integer.parseInt(sub1);
        if (val1 >= 0 && val1 <= 9) {
            sb.append('.').append(val1);
            restoreIpAddresses(res, sb, s, start + 1, index + 1);
            sb.setLength(originalLen);
        }

        if (start + 1 < s.length()) {
            String sub2 = s.substring(start, start + 2);
            int val2 = Integer.parseInt(sub2);
            if (val2 >= 10 && val2 <= 99) {
                sb.append('.').append(val2);
                restoreIpAddresses(res, sb, s, start + 2, index + 1);
                sb.setLength(originalLen);
            }
        }

        if (start + 2 < s.length()) {
            String sub3 = s.substring(start, start + 3);
            int val3 = Integer.parseInt(sub3);
            if (val3 >= 100 && val3 <= 255) {
                sb.append('.').append(val3);
                restoreIpAddresses(res, sb, s, start + 3, index + 1);
                sb.setLength(originalLen);
            }
        }
    }
}
```