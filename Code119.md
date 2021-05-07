# Pascal's Triangle II

```Java
    //4.78%
    public List<Integer> getRow(int rowIndex) {
        if(rowIndex<0) return null;
        List<Integer> pre=new ArrayList<Integer>(Arrays.asList(1));
        for(int row=1;row<=rowIndex;row++){
            List<Integer> cur=new ArrayList<Integer>();
            cur.add(1);
            for(int i=1;i<row;i++){
                cur.add(pre.get(i-1)+pre.get(i));
            }
            cur.add(1);
            pre=cur;
        }
        return pre;
    }
```