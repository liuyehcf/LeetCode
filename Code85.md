# Maximal Rectangle

* 注意点：当栈顶元素需要弹出时，其边界范围为：(栈次顶位置+1)到(当前迭代-1)

```Java
    //beats 65.14
    public int maximalRectangle(char[][] matrix) {
        if(matrix==null||matrix.length==0||matrix[0].length==0) return 0;
        int[] heights=new int[matrix[0].length];
        int res=0;
        for(int row=0;row<matrix.length;row++){
            for(int col=0;col<matrix[0].length;col++){
                if(matrix[row][col]=='0') heights[col]=0;
                else heights[col]+=1;
            }
            res=Math.max(res,maxArea(heights));
        }
        return res;
    }
    
    private int maxArea(int[] heights){
        LinkedList<Integer> stack=new LinkedList<Integer>();
        int res=0;
        int iter=0;
        while(iter<heights.length){
            while(!stack.isEmpty()&&heights[stack.peek()]>=heights[iter]){
                int topPos=stack.pop();
                
                int leftBoundary=stack.isEmpty()?0:(stack.peek()+1);
                res=Math.max(res,(iter-1-leftBoundary+1)*heights[topPos]);
            }
            stack.push(iter++);
        }
        
        while(!stack.isEmpty()){
            int topPos=stack.pop();
                
            int leftBoundary=stack.isEmpty()?0:(stack.peek()+1);
            res=Math.max(res,(heights.length-1-leftBoundary+1)*heights[topPos]);
        }
        return res;
    }
```


```Java
//灵异事件，我曹
public int maximalRectangle(char[][] matrix) {
        if(matrix==null||matrix.length==0||matrix[0].length==0) return 0;
        int m=matrix.length;
        int n=matrix[0].length;
        int[] heights=new int[n];
        int res=0;
        for(int row=0;row<m;row++){
            for(int col=0;col<n;col++){
                if(matrix[row][col]=='1'){
                    heights[col]++;
                }
                else{
                    heights[col]=0;
                }
            }
            Math.max(res,largestRectangleArea(heights));//SB,没有赋值
        }
        return res;
    }
    
    private int largestRectangleArea(int[] heights) {
        LinkedList<Integer> stack=new LinkedList<Integer>();
        int i=0;
        int res=0;
        while(i<heights.length){
            while(!stack.isEmpty()&&heights[stack.peek()]>heights[i]){
                int posRight=i-1;
                int curHigh=heights[stack.pop()];
                int posLeft=stack.isEmpty()?-1:stack.peek();
                res=Math.max(res,(posRight-(posLeft+1)+1)*curHigh);
            }
            stack.push(i++);
        }
        while(!stack.isEmpty()){
            int posRight=stack.pop();
            int curHigh=heights[posRight];
            int posLeft=stack.isEmpty()?-1:stack.peek();
            res=Math.max(res,(heights.length-1-(posLeft+1)+1)*curHigh);
        }
        return res;
    }
```