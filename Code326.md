# 判断一个数是否为3的指数次方

## 第一种常规思路

```Java
    public boolean isPowerOfThree(int n) {
        while(n>1){
            if(n%3!=0) return false;
            n/=3;
        }
        return n==1;
    }
```

## 第二种

```Java
    public boolean isPowerOfThree(int n) {
        return ( n>0 &&  1162261467%n==0);
    }
```
