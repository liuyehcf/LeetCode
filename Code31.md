# Next Permutation

* 找到下一个序列的关键思路：i从右往左遍历
* 对于每个i，在i后续的数中找出比i大且最小的数，将其与i交换，然后排序i后面的序列，即结果

```Java
	//beats 27.55%
	public void nextPermutation(int[] nums) {
        for(int i=nums.length-2;i>=0;i--){
            int index=-1;
            for(int j=i+1;j<nums.length;j++){
                if(nums[j]>nums[i]){
                    if(index==-1) index=j;
                    else{
                        if(nums[j]<nums[index]) index=j;
                    }
                }
            }
            if(index!=-1){
                exchange(nums,i,index);
                sort(nums,i+1,nums.length-1);
                return ;
            }
        }
        sort(nums,0,nums.length-1);
    }
    
    private void sort(int[] nums,int p,int r){
        if(p<r){
            int q=partition(nums,p,r);
            sort(nums,p,q-1);
            sort(nums,q+1,r);
        }
    }
    
    private int partition(int[] nums,int p,int r){
        int i=p-1;
        int x=nums[r];
        for(int j=p;j<r;j++){
            if(nums[j]<x){
                exchange(nums,++i,j);
            }
        }
        exchange(nums,++i,r);
        return i;
    }
    
    private void exchange(int[] nums,int i,int j){
        int temp=nums[i];
        nums[i]=nums[j];
        nums[j]=temp;
    }
```

```Java
	//beats 8.42%
	public void nextPermutation(int[] nums) {
        for(int left=nums.length-2;left>=0;left--){//左边界，从右往左遍历，必须从右往左遍历，因为右边的数权值小
            for(int right=nums.length-1;right>left;right--){//这里也必须从右往左遍历，其实这里根本不必遍历，右边这一段一定是非递增的，否则在上一个循环中就已经退出了，因此从右往左第一个比nums[left]大的元素一定是该区间中比nums{left}大的集合中的最小值
                if(nums[right]>nums[left]){
                    exchange(nums,left,right);
                    sort(nums,left+1,nums.length-1);
                    return;
                }
            }
        }
        Arrays.sort(nums);
    }
    
    private void exchange(int[] nums,int i,int j){
        int temp=nums[i];
        nums[i]=nums[j];
        nums[j]=temp;
    }
    
    private void sort(int[] nums,int p,int r){
        if(p<r){
            int q=partition(nums,p,r);

            sort(nums,p,q-1);
            sort(nums,q+1,r);
        }
    }
    
    private int partition(int[] nums,int p,int r){
        int x=nums[r];
        int i=p-1;
        for(int j=p;j<r;j++){
            if(nums[j]<x){
                exchange(nums,++i,j);
            }
        }
        exchange(nums,++i,r);
        return i;
    }


```

* 利用右边部分有序的特点，可以用二分法来查找比nums[i]大的最小值，并且不用排序了，只需要反转一下，因为是有序的
```Java
	//beats 24.63%
	public void nextPermutation(int[] nums) {
        for(int i=nums.length-2;i>=0;i--){
            if(nums[i+1]<=nums[i]) continue;   //保证这个二分是有意义的
            int left=i+1,right=nums.length-1;   
            
            while(left<=right){
                int mid=left+(right-left>>1);
                if(nums[mid]<=nums[i]){    //在这里取等号，为什么呢
                    right=mid-1;
                }
                else{
                    left=mid+1;
                }
            }
                        
            exchange(nums,i,right);
            reverse(nums,i+1,nums.length-1);
            return;
        }
        reverse(nums,0,nums.length-1);
    }
    
    private void exchange(int[] nums,int i,int j){
        int temp=nums[i];
        nums[i]=nums[j];
        nums[j]=temp;
    }

    
    private void reverse(int[] nums,int left,int right){
        for(int i=left;i<=left+(right-left>>1);i++){
            exchange(nums,i,right-(i-left));
        }
    }
```

* 最精华版本
```Java
	//beats 33.05%
	public void nextPermutation(int[] nums) {
        for(int i=nums.length-2;i>=0;i--){
            if(nums[i]<nums[i+1]){
                int left=i+1,right=nums.length-1;
                while(left<=right){
                    int mid=left+(right-left>>1);
                    if(nums[mid]<=nums[i]){
                        right=mid-1;
                    }
                    else{
                        left=mid+1;
                    }
                }
                exchange(nums,i,right);
                reverse(nums,i+1,nums.length-1);
                return;
            }
        }
        reverse(nums,0,nums.length-1);
    }
    
    private void exchange(int[] nums,int i,int j){
        int temp=nums[i];
        nums[i]=nums[j];
        nums[j]=temp;
    }
    
    private void reverse(int[] nums,int left,int right){
        for(int i=left;i<=left+(right-left>>1);i++){
            exchange(nums,i,right-(i-left));
        }
    }
```