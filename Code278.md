# First Bad Version


```Java
//beats 37.10%
public class Solution extends VersionControl {
    public int firstBadVersion(int n) {
        int left=1,right=n;
        if(!isBadVersion(n)) throw new RuntimeException();
        
        while(left<=right){
            int mid=left+(right-left>>1);
            if(!isBadVersion(mid)){
                left=mid+1;
            }
            else{
                right=mid-1;
            }
        }
        return left;
    }
}
```