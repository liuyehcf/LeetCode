# 给定n找出(1+2+...+i)<=n的最大值i
```Java
public int arrangeCoins(int n) {
        long left=0,right=n;
        while(left<=right){
            long mid=left+(right-left>>1);
            long sum=mid*(mid+1)/2;
            if(sum==n) return (int)mid;
            else if(sum>n){
                right=mid-1;
            }else{
                left=mid+1;
            }
        }
        return (int)right;
    }
```
