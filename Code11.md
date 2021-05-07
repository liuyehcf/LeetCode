# Container With Most Water

* 错误的做法
* 假设leftHigh低于右边，那么需要移动左边，而更新左边的条件与面积是否需要更新作为判断，这是不对的
* 更新leftHigh与面积是否需要更新无关!!!
```java
class Solution {
public int maxArea(int[] height) {
        int left=0,right=height.length-1;
        int leftHigh=height[left],rightHigh=height[right];
        int res=area(left,right,leftHigh,rightHigh);
        while(left<right){
            if(leftHigh<=rightHigh){
                int tmp=0;
                if(height[++left]>leftHigh&&(tmp=area(left,right,height[left],rightHigh))>res){
                    res=tmp;
                    leftHigh=height[left];
                }
            }
            else{
                int tmp=0;
                if(height[--right]>rightHigh&&(tmp=area(left,right,leftHigh,height[right]))>res){
                    res=tmp;
                    rightHigh=height[right];
                }
            }
        }
        return res;
    }
    
    private int area(int left,int right,int leftHigh,int rightHigh){
        return (right-left)*Math.min(leftHigh,rightHigh);
   }
}
```


```java 
    //beats 73.18%
    public int maxArea(int[] height) {
        int left=0,right=height.length-1;
        int leftHigh=height[left],rightHigh=height[right];
        int res=area(left,right,leftHigh,rightHigh);
        while(left<right){
            if(leftHigh<rightHigh){
                left++;   //<Warn>:这句最开始放到了if语句的后面，导致了，找到一个更新的便捷后反而+了1
                if(height[left]>leftHigh){
                    leftHigh=height[left];
                    res=Math.max(res,area(left,right,leftHigh,rightHigh));
                }
            }
            else{
                right--;
                if(height[right]>rightHigh){
                    rightHigh=height[right];
                    res=Math.max(res,area(left,right,leftHigh,rightHigh));
                }
            }
        }
        return res;
    }
    
    private int area(int left,int right,int leftHigh,int rightHigh){
        return (right-left)*Math.min(leftHigh,rightHigh);
   }
}
```