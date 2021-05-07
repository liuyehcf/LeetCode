# Reverse String(反转字符串)

## 用Java API么好了歪
```java
class Solution {
public String reverseString(String s) {
        return new StringBuilder(s).reverse().toString();
   }
}
```
* 没啥好说的，不用这个就用一个空的StringBuilder来循环一次好了
