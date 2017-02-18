# Guess Number Higher or Lower(猜数字)

* 没啥好说的，二分，信息论扫盲经典题


```Java
    public int guessNumber(int n) {
        int left=1,right=n;
        while(left<=right){
            int mid=left+(right-left>>1);
            int guessResult=guess(mid);
            if(guessResult==0) return mid;
            else if(guessResult<0){
                right=mid-1;
            }else{
                left=mid+1;
            }
        }
        throw new RuntimeException();
    }
```
