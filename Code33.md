# Search in Rotated Sorted Array

```Java
	//beats 43.93%
	public int search(int[] nums, int target) {
        for(int i=0;i<nums.length;i++){
            if(nums[i]==target) return i;
        }
        return -1;
    }
```
* ������������������ʣ����������ö��ַ���
```Java
	//beats 88.82
	public int search(int[] nums, int target) {
        for(int i=0;i<nums.length;i++){
            if(nums[i]==target) return i;
            if(i<nums.length-1&&nums[i]>nums[i+1]&&nums[i]<target) return -1;
        }
        return -1;
    }
```