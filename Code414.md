# Third Maximum Number

* ����˼·
```Java
    //beats 27.18%
    public int thirdMax(int[] nums) {
        Set<Integer> uniqueSet=new HashSet<Integer>();
        for(int num:nums){
            uniqueSet.add(num);
        }
        
        int[] uniqueNums=new int[uniqueSet.size()];
        int iter=0;
        for(int num:uniqueSet){
            uniqueNums[iter++]=num;
        }
        
        if(uniqueNums.length<3) return select(uniqueNums,0,uniqueNums.length-1,uniqueNums.length);
        else return select(uniqueNums,0,uniqueNums.length-1,uniqueNums.length-2);
    }
    
    private int select(int[] nums,int p,int r,int n){
        if(p==r&&n==1) return nums[p];
        
        int q=partition(nums,p,r);
        int k=q-p+1;
        if(k==n) {
            return nums[q];
        }
        else if(k<n){
            return select(nums,q+1,r,n-k);
        }
        else{
            return select(nums,p,q-1,n);
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
    
    private void exchange(int[] nums,int i,int j){
        int temp=nums[i];
        nums[i]=nums[j];
        nums[j]=temp;
    }
```

* Ӧ���и��õķ���

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