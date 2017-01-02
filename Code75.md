# Sort Colors

```Java
	//beats 54.47%
	public void sortColors(int[] nums) {
        int[] cnt=new int[3];
        for(int num:nums){
            cnt[num]++;
        }
        
        int iter=0;
        while(--cnt[0]>=0){
            nums[iter++]=0;
        }
        while(--cnt[1]>=0){
            nums[iter++]=1;
        }
        while(--cnt[2]>=0){
            nums[iter++]=2;
        }
    }
```

* ����ʱ������
```Java
	//beats 54.47%
	public void sortColors(int[] nums) {
        int[] tempNums=new int[nums.length];
        System.arraycopy(nums,0,tempNums,0,nums.length);
        int[] cnt=new int[3];
        for(int num:nums){
            cnt[num]++;
        }
        
        for(int i=1;i<3;i++){
            cnt[i]+=cnt[i-1];
        }
        
        for(int num:tempNums){
            nums[--cnt[num]]=num;
        }
    }
```