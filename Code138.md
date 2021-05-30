#  Copy List with Random Pointer

```java
class Solution {
    public Node copyRandomList(Node head) {
        if (head == null) {
            return null;
        }

        Map<Node, Node> oldNewMap = new HashMap<>();
        Node newHead = new Node(head.val);

        copyRandomList(head, newHead, oldNewMap);

        Node iter = head;
        while (iter != null) {
            Node newIter = oldNewMap.get(iter);
            Node random = iter.random;
            Node newRandom = oldNewMap.get(random);

            newIter.random = newRandom;

            iter = iter.next;
        }

        return newHead;
    }

    private void copyRandomList(Node oldNode, Node newNode, Map<Node, Node> oldNewMap) {
        if (oldNode == null) {
            return;
        }

        oldNewMap.put(oldNode, newNode);

        Node next = oldNode.next;

        if (next != null) {
            Node newNext = new Node(next.val);
            newNode.next = newNext;
            copyRandomList(next, newNext, oldNewMap);
        }
    }
}
```