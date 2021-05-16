# Serialize and Deserialize Binary Tree

```java
public class Codec {

    // Encodes a tree to a single string.
    public String serialize(TreeNode root) {
        StringBuilder sb = new StringBuilder();

        serialize(root, sb);

        return sb.toString();
    }

    private void serialize(TreeNode root, StringBuilder sb) {
        if (root == null) {
            sb.append(',').append("null");
            return;
        }

        sb.append(',').append(root.val);
        serialize(root.left, sb);
        serialize(root.right, sb);
    }

    // Decodes your encoded data to tree.
    public TreeNode deserialize(String data) {
        String[] segments = data.substring(1).split(",");


        return deserialize(segments, new AtomicInteger(0));
    }

    private TreeNode deserialize(String[] segments, AtomicInteger index) {
        String segment = segments[index.get()];
        index.incrementAndGet();

        if (Objects.equals(segment, "null")) {
            return null;
        }

        int val = Integer.parseInt(segment);

        TreeNode root = new TreeNode(val);

        root.left = deserialize(segments, index);
        root.right = deserialize(segments, index);

        return root;
    }
}
```