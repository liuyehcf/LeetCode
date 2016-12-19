# Next Permutation

* �ҵ���һ�����еĹؼ�˼·��i�����������
* ����ÿ��i����i�����������ҳ���i������С������������i������Ȼ������i��������У������

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