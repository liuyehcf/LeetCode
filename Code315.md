# Count of Smaller Numbers After Self

* 首先要想到树
* 巧妙之处在于反向插入，这样可以保证，当插入某节点时，树上的节点都是右于它出现，因此统计值时有效的
* 额外维护的值为小于该节点的节点数目，与等于该节点的节点数目

```Java
    //beats 79.19%
	class TreeNode{
        int val;
        TreeNode left;
        TreeNode right;
        int cnt, repeat;
        TreeNode(int val){this.val=val;this.repeat=1;this.cnt=0;}
    }
    
    TreeNode root=null;
    
    void insert(List<Integer> res, int val){
        TreeNode y=null;
        TreeNode x=root;
        int count=0;
        while(x!=null){
            y=x;
            if(val==x.val){
                x.repeat++;
                break;
            }
            else if(val<x.val){
                x.cnt++;
                x=x.left;
            }
            else{
                count+=x.repeat+x.cnt;
                x=x.right;
            }
        }
        
        if(x!=null){
            res.add(0,x.cnt+count);   //当出现重复节点时，还需要统计其左边节点的数目，关键
        }
        else {
            TreeNode z=new TreeNode(val);
            if(y==null) root=z;
            else if(y.val>z.val){
                y.left=z;
            }
            else{
                y.right=z;
            }
            res.add(0,count);
        }
        
    }
    
    public List<Integer> countSmaller(int[] nums) {
        List<Integer> res=new LinkedList<Integer>();
        for(int i=nums.length-1;i>=0;i--){
            insert(res,nums[i]);
        }
        return res;
    }
```