# Trapping Rain Water

```Java
	//beats 92.67%
	public int trap(int[] height) {
        if(height.length==0) return 0;
        int left=0,right=height.length-1;
        int trapped=0;
        int leftHigh=height[left];
        int rightHigh=height[right];
        while(left<right){
            if(leftHigh<=rightHigh){
                left++;;
                if(height[left]>leftHigh){
                    leftHigh=height[left];
                }
                else{
                    trapped+=leftHigh-height[left];
                }
            }
            else{
                right--;
                if(height[right]>rightHigh){
                    rightHigh=height[right];
                }
                else{
                    trapped+=rightHigh-height[right];
                }
            }
        }
        return trapped;
    }
```