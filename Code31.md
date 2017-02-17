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

```Java
	//beats 8.42%
	public void nextPermutation(int[] nums) {
        for(int left=nums.length-2;left>=0;left--){//��߽磬�������������������������������Ϊ�ұߵ���ȨֵС
            for(int right=nums.length-1;right>left;right--){//����Ҳ������������������ʵ����������ر������ұ���һ��һ���Ƿǵ����ģ���������һ��ѭ���о��Ѿ��˳��ˣ���˴��������һ����nums[left]���Ԫ��һ���Ǹ������б�nums{left}��ļ����е���Сֵ
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

* �����ұ߲���������ص㣬�����ö��ַ������ұ�nums[i]�����Сֵ�����Ҳ��������ˣ�ֻ��Ҫ��תһ�£���Ϊ�������
```Java
	//beats 24.63%
	public void nextPermutation(int[] nums) {
        for(int i=nums.length-2;i>=0;i--){
            if(nums[i+1]<=nums[i]) continue;   //��֤����������������
            int left=i+1,right=nums.length-1;   
            
            while(left<=right){
                int mid=left+(right-left>>1);
                if(nums[mid]<=nums[i]){    //������ȡ�Ⱥţ�Ϊʲô��
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

* ����汾
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