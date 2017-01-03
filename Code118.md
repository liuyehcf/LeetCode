# Pascal's Triangle

```Java
	//beats 27.34%
	public List<List<Integer>> generate(int numRows) {
        List<List<Integer>> res=new ArrayList<List<Integer>>();
        if(numRows<=0) return res;
        
        res.add(Arrays.asList(1));
        
        for(int row=1;row<numRows;row++){
            List<Integer> cur=new ArrayList<Integer>();
            cur.add(1);
            for(int i=1;i<row;i++){
                cur.add(res.get(row-1).get(i-1)+res.get(row-1).get(i));
            }
            cur.add(1);
            res.add(cur);
        }
        
        return res;
    }
```