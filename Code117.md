# Populating Next Right Pointers in Each Node II

```java
class Solution {
    public Node connect(Node root) {
        Queue<Node> queue = new LinkedList<>();

        if (root != null) {
            queue.offer(root);
        }

        while (!queue.isEmpty()) {
            int cnt = queue.size();


            Node pre = null;
            while (cnt-- > 0) {
                Node cur = queue.poll();
                if (pre != null) {
                    pre.next = cur;
                }

                if (cur.left != null) {
                    queue.offer(cur.left);
                }

                if (cur.right != null) {
                    queue.offer(cur.right);
                }

                pre = cur;
            }
        }

        return root;
    }
}
```