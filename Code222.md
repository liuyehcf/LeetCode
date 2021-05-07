# Count Complete Tree Nodes


```java
//beats 53.06%
class Solution {
    public int countNodes(TreeNode root) {
        int h=height(root);
        
        if(h==-1) return 0;
        else{
            if(height(root.right)==h-1){//右子树的高度比整棵树少1，说明，最后一个节点不在左子树中，左子树为满树
                return 1+((1<<h)-1)+countNodes(root.right);//第一项1为root节点，第二项(1<<h)-1为左子树的节点数目
            }
            else{//说明最后一个节点在左子树中，右子树为满树，树高为h-2
                return 1+((1<<(h-1))-1)+countNodes(root.left);//第一项1为root节点，第二项(1<<(h-1))-1为右子树的节点数目
            }
        }
    }
    
    private int height(TreeNode root){
        return root==null?-1:1+height(root.left);
    }
}
```