# Median of Two Sorted Arrays

```Java
	//beats 14.36%
	public double findMedianSortedArrays(int[] nums1, int[] nums2) {
        int len1=nums1.length,len2=nums2.length;
        return (find_N(nums1,0,nums2,0,(len1+len2+1)/2)+find_N(nums1,0,nums2,0,(len1+len2+2)/2))/2;
    }
    
    private double find_N(int[] nums1,int b1,int[] nums2,int b2,int n){
        if(b1==nums1.length) return nums2[b2+n-1];
        if(b2==nums2.length) return nums1[b1+n-1];
        if(n==1) return Math.min(nums1[b1],nums2[b2]);
        
        int step=n/2;
        long mid1=Long.MAX_VALUE;
        long mid2=Long.MAX_VALUE;
        if(b1+step-1<nums1.length) mid1=nums1[b1+step-1];   //<Warn>:���ﱾ���жϵ���b1+step-1,���n=2����ôstep=1,Ҳ����˵��ǰ�ڵ�Ҳ����Ҫ�жϵ�!!!�������Ҫb1+step��-1
        if(b2+step-1<nums2.length) mid2=nums2[b2+step-1];
        if(mid1<mid2) return find_N(nums1,b1+step-1+1,nums2,b2,n-step);
        else return find_N(nums1,b1,nums2,b2+step-1+1,n-step);
    }
```