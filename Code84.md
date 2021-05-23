# Largest Rectangle in Histogram

* 注意点：计算面积时的宽度
* 不是栈顶到前一个的距离，而是当(前迭代位置-1)到(栈次顶位置+1)
* 如果(栈次顶位置+1)到(栈顶位置)中间的位置，其高度必然不小于栈顶高度，否则(栈次顶位置)就是这些中间的位置
* 因为当前迭代压入的位置，其高度为当前栈中最大，那些原本高于当前高度的位置都已经被弹出了，因此若栈中两个位置不连续，假设posi与posj，那么height[posi+1...posj]>=height[posj]
*
* 另一个注意点：右边界是iter-1，而不是栈顶位置
* 综上，注意点：当栈顶元素需要弹出时，其边界范围为：(栈次顶位置+1)到(当前迭代-1)
```java
class Solution {
    public int largestRectangleArea(int[] heights) {
        LinkedList<Integer> stack = new LinkedList<>();

        int maxArea = Integer.MIN_VALUE;

        for (int i = 0; i < heights.length; i++) {
            int height = heights[i];

            while (!stack.isEmpty() && height <= heights[stack.peek()]) {
                int top = stack.pop();
                maxArea = Math.max(maxArea, calculateArea(stack.isEmpty() ? 0 : stack.peek() + 1, i - 1, heights[top]));
            }

            stack.push(i);
        }

        while (!stack.isEmpty()) {
            int top = stack.pop();
            maxArea = Math.max(maxArea, calculateArea(stack.isEmpty() ? 0 : stack.peek() + 1, heights.length - 1, heights[top]));
        }

        return maxArea;
    }

    private int calculateArea(int left, int right, int height) {
        return (right - left + 1) * height;
    }
}
```