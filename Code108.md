# Convert Sorted Array to Binary Search Tree

```Java
	//beats 11.75%
	public TreeNode sortedArrayToBST(int[] nums) {
        return helper(nums,0,nums.length-1);
    }
    
    private TreeNode helper(int[] nums,int start, int end){
        if(start>end) return null;
        
        int mid=start+(end-start>>1);
        
        TreeNode root=new TreeNode(nums[mid]);
        root.left=helper(nums,start,mid-1);
        root.right=helper(nums,mid+1,end);
        return root;
    }
```