# Convert Sorted List to Binary Search Tree

```Java
	//11.68%
	public TreeNode sortedListToBST(ListNode head) {
        ListNode pseudoHead=new ListNode(0);
        pseudoHead.next=head;
        return helper(pseudoHead,null);
    }
    
    private TreeNode helper(ListNode pseudoHead,ListNode tail){
        if(pseudoHead.next==tail) return null;
        ListNode slow=pseudoHead.next,fast=pseudoHead.next;
        while(fast!=tail&&fast.next!=tail){//<Warn1>：这里最开始写成了fast!=null&&fast.next!=null
            fast=fast.next.next;
            slow=slow.next;
        }
        //while结束后，slow指向子树根节点
        
        ListNode leftPartTail=slow;
        ListNode rightPartPseudoHead=slow;
        TreeNode root=new TreeNode(slow.val);
        root.left=helper(pseudoHead,leftPartTail);
        root.right=helper(rightPartPseudoHead,tail);
        return root;
    }
```