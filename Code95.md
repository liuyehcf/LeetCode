# Unique Binary Search Trees II

* 这种递归会包含很多的重复，即没有备忘录
```Java
	//beats 20%
	public List<TreeNode> generateTrees(int n) {
        if(n==0) return new ArrayList<TreeNode>();
        int[] nums=new int[n];
        for(int i=0;i<n;i++){
            nums[i]=i+1;
        }
        return helper(nums,0,nums.length-1);
    }
    
    private List<TreeNode> helper(int[] nums,int start,int end){
        List<TreeNode> res=new ArrayList<TreeNode>();
        if(start>end){
            res.add(null);
            return res;
        }
        
        for(int i=start;i<=end;i++){
            List<TreeNode> leftTreeList=helper(nums,start,i-1);
            List<TreeNode> rightTreeList=helper(nums,i+1,end);
            
            for(TreeNode leftRoot:leftTreeList){
                for(TreeNode rightRoot:rightTreeList){
                    TreeNode root=new TreeNode(nums[i]);
                    root.left=leftRoot;
                    root.right=rightRoot;
                    res.add(root);
                }
            }
        }
        return res;
    }
```


* 动态规划
```Java
	//beats 85.08%
	public List<TreeNode> generateTrees(int n) {
        if(n==0) return new ArrayList<TreeNode>();
        
        int[] nums=new int[n];
        for(int i=0;i<n;i++){
            nums[i]=i+1;
        }
        
        List<TreeNode>[][] dp=new List[n][n];
        
        
        for(int len=1;len<=n;len++){
            for(int start=0;start<n-len+1;start++){
                int end=start+len-1;
                List<TreeNode> cur=new ArrayList<TreeNode>();
                for(int i=start;i<=end;i++){
                    
                    List<TreeNode> leftTree=get(dp,start,i-1);
                    List<TreeNode> rightTree=get(dp,i+1,end);
                    
                    for(TreeNode left:leftTree){
                        for(TreeNode right:rightTree){
                            TreeNode root=new TreeNode(nums[i]);
                            root.left=left;
                            root.right=right;
                            cur.add(root);
                        }
                    }
                }
                
                dp[start][end]=cur;
            }
        }
        
        return dp[0][n-1];
    }
    
    List<TreeNode> nullList=new ArrayList<TreeNode>();
    {
        nullList.add(null);
    }
    
    private List<TreeNode> get(List<TreeNode>[][] dp,int i,int j){
        int n=dp.length;
        if(i>j) return nullList;
        return dp[i][j];
    }
```