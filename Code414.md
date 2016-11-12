# Third Maximum Number

## 常规思路
```Java
	public int thirdMax(int[] nums) {
        Set<Integer> set=new HashSet<Integer>();
        for(int num:nums)
            set.add(num);
        int[] newNums=new int[set.size()];
        int iter=0;
        for(int num:set){
            newNums[iter++]=num;
        }
        if(newNums.length<3) return helper(newNums,0,newNums.length-1,newNums.length);
        return helper(newNums,0,newNums.length-1,newNums.length-2);
    }
    
    private int helper(int[] nums,int p,int r,int i){
        if(p==r){
        	if(i!=1) throw new RuntimeException();
            return nums[p];
        }
        int q=partition(nums,p,r);
        int k=q-p+1;
        if(k==i)
            return nums[q];
        else if(k<i)
            return helper(nums,q+1,r,i-k);
        else
            return helper(nums,p,q-1,i);
        
    }
    
    private int partition(int[] nums,int p,int r){
        int x=nums[r];
        int i=p-1;
        for(int j=p;j<r;j++){
            if(nums[j]<=x){
                exchange(nums,++i,j);
            }
        }
        exchange(nums,++i,r);
        return i;
    }
    
    private void exchange(int[] nums,int i,int j){
        int tmp=nums[i];
        nums[i]=nums[j];
        nums[j]=tmp;
    }
```

## 应该有更好的方法

```Java
	public int thirdMax(int[] nums) {
        int max, mid, small, count;
        max = mid = small = Integer.MIN_VALUE;
        count = 0;  //Count how many top elements have been found.

        for( int x: nums) {
            //Skip loop if max or mid elements are duplicate. The purpose is for avoiding right shift.
            if( x == max || x == mid ) {
                continue;
            }

            if (x > max) {
                //right shift
                small = mid;
                mid = max;

                max = x;
                count++;
            } else if( x > mid) {
                //right shift
                small = mid;

                mid = x;
                count++;
            } else if ( x >= small) { //if small duplicated, that's find, there's no shift and need to increase count.
                small = x;
                count++;
            }
        }

        //"count" is used for checking whether found top 3 maximum elements.
        if( count >= 3) { 
            return small;
        } else {
            return max;
        }
    }
```