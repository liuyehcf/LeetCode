# H-Index


* stupid solution
```java
//beats 1.78%
class Solution {
    public int hIndex(int[] citations) {
        for(int h=citations.length;h>=1;h--){
            int largeCnt=0;
            int smallCnt=0;
            int equalCnt=0;
            for(int citation:citations){
                if(citation>h) largeCnt++;
                else if(citation<h) smallCnt++;
                else equalCnt++;
            }
            if(largeCnt+equalCnt>=h) return h;
        }
        return 0;
    }
}
```

* better solution(dichotomy)
```java
//beats 55.63%
class Solution {
    public int hIndex(int[] citations) {
        int left=1,right=citations.length;
        while(left<=right){
            int mid=left+(right-left>>1);
            boolean flag=isHIndex(citations,mid);
            if(flag){
                left=mid+1;
            }
            else{
                right=mid-1;
            }
        }
        return left-1;
    }
    
    private boolean isHIndex(int[] citations,int h){
        int largeCnt=0;
        int smallCnt=0;
        int equalCnt=0;
        for(int citation:citations){
            if(citation>h) largeCnt++;
            else if(citation<h) smallCnt++;
            else equalCnt++;
        }
        return largeCnt+equalCnt>=h;
    }
}
```

* brilliant solution
```java
class Solution {
    public int hIndex(int[] citations) {
        int len=citations.length;
        int[] cnt=new int[len+1];
        for(int citation:citations){
            if(citation>=len) cnt[len]++;
            else cnt[citation]++;
        }
        
        int total=0;
        for(int h=len;h>=1;h--){
            total+=cnt[h];
            if(total>=h) return h;
        }
        return 0;
    }
}
```

