#　H-Index II

```java
class Solution {
    public int hIndex(int[] citations) {
        int left=1,right=citations.length;
        while(left<=right){
            int mid=left+(right-left>>1);
            int h=citations.length-mid+1;
            if(citations[mid-1]>=h){//citations[mid-1]为元素值，当元素值比h大时，由于比该元素值大的元素都有h个，因此比h大的元素也至少有h个
                right=mid-1;
            }
            else{
                left=mid+1;
            }
        }
        return citations.length-(left-1);
    }
}
```