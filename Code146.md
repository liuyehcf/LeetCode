# LRU Cache

```java
class LRUCache {

    private int capacity;
    private Map<Integer, Node> map = new HashMap<>();
    private Node pseudoHead = new Node(0, 0);
    private Node tail = new Node(0, 0);

    public LRUCache(int capacity) {
        this.capacity = capacity;
        pseudoHead.next = tail;
        tail.pre = pseudoHead;
    }

    public int get(int key) {
        if (map.containsKey(key)) {
            Node node = map.get(key);

            remove(node);
            visit(node);

            return node.val;
        }

        return -1;
    }

    public void put(int key, int val) {
        if (map.containsKey(key)) {
            Node node = map.get(key);
            node.val = val;

            remove(node);
            visit(node);
        } else {
            if (map.size() == capacity) {
                Node removedNode = tail.pre;
                map.remove(removedNode.key);
                remove(removedNode);
            }

            Node node = new Node(key, val);
            visit(node);
            map.put(key, node);
        }
    }

    private void remove(Node node) {
        Node pre = node.pre;
        Node next = node.next;
        pre.next = next;
        next.pre = pre;
    }

    private void visit(Node node) {
        Node head = pseudoHead.next;
        pseudoHead.next = node;
        node.pre = pseudoHead;

        node.next = head;
        head.pre = node;
    }

    private static final class Node {
        private Node pre;
        private Node next;
        private int key;
        private int val;

        public Node(int key, int val) {
            this.key = key;
            this.val = val;
        }
    }
}
```