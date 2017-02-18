# Minimum Height Trees

* 动态更新节点的度(这里度的定义是，与该节点相邻的未访问节点的数目)
```Java
	//beats 98.85%
	public List<Integer> findMinHeightTrees(int n, int[][] edges) {
        if(n==1) return Arrays.asList(0);
        @SuppressWarnings("unchecked")
        List<Integer>[] graph=new List[n];
        int[] degrees=new int[n];
        
        for(int i=0;i<n;i++){
            graph[i]=new ArrayList<Integer>();
        }
        
        for(int[] edge:edges){
            graph[edge[0]].add(edge[1]);
            graph[edge[1]].add(edge[0]);
            degrees[edge[0]]++;
            degrees[edge[1]]++;
        }
        
        List<Integer> curStep=new ArrayList<Integer>();
        for(int i=0;i<n;i++){
            if(degrees[i]==1){  //度为1时，表明此时它为"相对的叶节点"
                curStep.add(i);
                degrees[i]--;
            }
        }
        
        boolean flag=true;
        while(flag){
            System.out.println(curStep);
            List<Integer> nextStep=new ArrayList<Integer>();
            for(int i=0;i<curStep.size();i++){
                int curNode=curStep.get(i);
                List<Integer> adjacentList=graph[curNode];
                for(int otherNode:adjacentList){
                    if(--degrees[otherNode]==1){
                        nextStep.add(otherNode);
                        degrees[otherNode]--;//这里不进行判断了，即便是已经访问过的点-1也没有关系，因为只有度为1才会添加到下一次访问的表中
                    }
                }
            }
            if(!nextStep.isEmpty())
                curStep=nextStep;
            else
                flag=false;
        }
        
        return curStep;
        
    }
```

* 另一种方法，不动态更新节点的度，而是更新邻接表
```Java
	//beats 59.68%
	public List<Integer> findMinHeightTrees(int n, int[][] edges) {
        if(n==1) return Arrays.asList(0);
        @SuppressWarnings("unchecked")
        Set<Integer>[] graph=new Set[n];

        for(int i=0;i<n;i++){
            graph[i]=new HashSet<Integer>();
        }
        
        for(int[] edge:edges){
            graph[edge[0]].add(edge[1]);
            graph[edge[1]].add(edge[0]);
        }
        
        List<Integer> curStep=new ArrayList<Integer>();
        for(int i=0;i<n;i++)
            if(graph[i].size()==1)
                curStep.add(i);
            
        
        
        boolean flag=true;
        while(flag){
            List<Integer> nextStep=new ArrayList<Integer>();
            for(int i=0;i<curStep.size();i++){
                int curNode=curStep.get(i);
                Set<Integer> adjacentList=graph[curNode];
                for(int otherNode:adjacentList){
                    graph[otherNode].remove(curNode);//这步操作导致性能降低咯
                    if(graph[otherNode].size()==1)
                        nextStep.add(otherNode);
                }
            }
            if(!nextStep.isEmpty())
                curStep=nextStep;
            else
                flag=false;
        }
        
        return curStep;
        
    }
```