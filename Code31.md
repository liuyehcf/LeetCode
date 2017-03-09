# Next Permutation


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
        for(int left=nums.length-2;left>=0;left--){
            for(int right=nums.length-1;right>left;right--){
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


```Java
	//beats 24.63%
	public void nextPermutation(int[] nums) {
        for(int i=nums.length-2;i>=0;i--){
            if(nums[i+1]<=nums[i]) continue;   
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


```Java
//beats 30.1%
public class Solution {
    public void nextPermutation(int[] nums) {
        int i=nums.length-2;
        while(i>=0){
            if(nums[i]<nums[i+1]) break;
            i--;
        }
        
        reverse(nums,i+1,nums.length-1);
        
        if(i<0) return;
        
        int j=i+1;
        while(j<nums.length){
            if(nums[j]>nums[i]) break;
            j++;
        }
        
        exchange(nums,i,j);
    }
    
    private void reverse(int[] nums,int p,int r){
        int len=r-p+1;
        for(int i=0;i<len/2;i++){
            exchange(nums,p+i,r-i);
        }
    }
    
    private void exchange(int[] nums,int i,int j){
        int temp=nums[i];
        nums[i]=nums[j];
        nums[j]=temp;
    }
}
```