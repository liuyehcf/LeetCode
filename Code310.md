# Minimum Height Trees

* ��̬���½ڵ�Ķ�(����ȵĶ����ǣ���ýڵ����ڵ�δ���ʽڵ����Ŀ)
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
            if(degrees[i]==1){  //��Ϊ1ʱ��������ʱ��Ϊ"��Ե�Ҷ�ڵ�"
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
                        degrees[otherNode]--;//���ﲻ�����ж��ˣ��������Ѿ����ʹ��ĵ�-1Ҳû�й�ϵ����Ϊֻ�ж�Ϊ1�Ż����ӵ���һ�η��ʵı���
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

* ��һ�ַ���������̬���½ڵ�Ķȣ����Ǹ����ڽӱ�
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
                    graph[otherNode].remove(curNode);//�ⲽ�����������ܽ��Ϳ�
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