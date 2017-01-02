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