# Count of Smaller Numbers After Self

* ����Ҫ�뵽��
* ����֮�����ڷ�����룬�������Ա�֤��������ĳ�ڵ�ʱ�����ϵĽڵ㶼�����������֣����ͳ��ֵʱ��Ч��
* ����ά����ֵΪС�ڸýڵ�Ľڵ���Ŀ������ڸýڵ�Ľڵ���Ŀ

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
            res.add(0,x.cnt+count);   //�������ظ��ڵ�ʱ������Ҫͳ������߽ڵ����Ŀ���ؼ�
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