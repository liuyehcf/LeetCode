# Clone Graph

```java
class Solution {
    public Node cloneGraph(Node node) {
        if (node == null) {
            return null;
        }

        Map<Node, Node> oldNewMap = new HashMap<>();

        Node newNode = new Node();

        cloneGraph(node, newNode, oldNewMap);

        return newNode;
    }

    private void cloneGraph(Node oldNode, Node newNode, Map<Node, Node> oldNewMap) {
        newNode.val = oldNode.val;
        oldNewMap.put(oldNode, newNode);

        if (oldNode.neighbors != null && !oldNode.neighbors.isEmpty()) {
            for (Node neighbor : oldNode.neighbors) {
                if (oldNewMap.containsKey(neighbor)) {
                    newNode.neighbors.add(oldNewMap.get(neighbor));
                } else {
                    Node newNeighbor = new Node();
                    cloneGraph(neighbor, newNeighbor, oldNewMap);
                    newNode.neighbors.add(newNeighbor);
                }
            }
        }
    }
}
```