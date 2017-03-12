# Trapping Rain Water

```Java
	//beats 92.67%
public class Solution {
    public int trap(int[] height) {
        if(height==null||height.length==0) return 0;
        int res=0;
        int left=0,right=height.length-1;
        int leftHigh=height[left];
        int rightHigh=height[right];
        
        while(left<right){
            if(leftHigh<rightHigh){
                int curHigh=height[++left];
                if(curHigh<=leftHigh){
                    res+=leftHigh-curHigh;
                }
                else{
                    leftHigh=curHigh;
                }
            }
            else{
               int curHigh=height[--right]; 
               if(curHigh<=rightHigh){
                    res+=rightHigh-curHigh;
                }
                else{
                    rightHigh=curHigh;
                }
            }
        }
        return res;
    }
}
```