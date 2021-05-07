# (Power of Four)判断一个数是否为4的指数次方
## 一般思路
```java
class Solution {
public boolean isPowerOfFour(int num) {
        while(num>1){
            if(num%4!=0) return false;
            num/=4;
        }
        return num==1;
   }
}
```

## 特殊思路
```java
class Solution {
public boolean isPowerOfFour(int num) {
        return Integer.toString(num,4).matches("10*");
   }
}
```
