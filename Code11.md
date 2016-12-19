# Container With Most Water

* ���������
* ����leftHigh�����ұߣ���ô��Ҫ�ƶ���ߣ���������ߵ�����������Ƿ���Ҫ������Ϊ�жϣ����ǲ��Ե�
* ����leftHigh������Ƿ���Ҫ�����޹�!!!
```Java
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
```


```Java 
	//beats 73.18%
	public int maxArea(int[] height) {
        int left=0,right=height.length-1;
        int leftHigh=height[left],rightHigh=height[right];
        int res=area(left,right,leftHigh,rightHigh);
        while(left<right){
            if(leftHigh<rightHigh){
                left++;   //<Warn>:����ʼ�ŵ���if���ĺ��棬�����ˣ��ҵ�һ�����µı�ݺ󷴶�+��1
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
```