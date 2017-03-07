# Count Complete Tree Nodes


```Java
//beats 53.06%
public class Solution {
    public int countNodes(TreeNode root) {
        int h=height(root);
        
        if(h==-1) return 0;
        else{
            if(height(root.right)==h-1){//�������ĸ߶ȱ���������1��˵�������һ���ڵ㲻���������У�������Ϊ����
                return 1+((1<<h)-1)+countNodes(root.right);//��һ��1Ϊroot�ڵ㣬�ڶ���(1<<h)-1Ϊ�������Ľڵ���Ŀ
            }
            else{//˵�����һ���ڵ����������У�������Ϊ����������Ϊh-2
                return 1+((1<<(h-1))-1)+countNodes(root.left);//��һ��1Ϊroot�ڵ㣬�ڶ���(1<<(h-1))-1Ϊ�������Ľڵ���Ŀ
            }
        }
    }
    
    private int height(TreeNode root){
        return root==null?-1:1+height(root.left);
    }
}
```