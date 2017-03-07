# Course Schedule II

* BFS
```Java
public class Solution {
    public int[] findOrder(int numCourses, int[][] prerequisites) {
        if(numCourses<=0||prerequisites==null) return new int[0];
        
        List<Integer>[] graph=new List[numCourses];
        for(int i=0;i<numCourses;i++){
            graph[i]=new ArrayList<Integer>();
        }
        
        int[] degrees=new int[numCourses];
        
        for(int[] edge:prerequisites){
            graph[edge[1]].add(edge[0]);
            degrees[edge[0]]++;
        }
        
        int cnt=0;
        int[] res=new int[numCourses];
        Queue<Integer> queue=new LinkedList<Integer>();
        for(int i=0;i<numCourses;i++){
            if(degrees[i]==0){
                queue.offer(i);
                res[cnt++]=i;
            }
        }
        
        while(!queue.isEmpty()){
            int node=queue.poll();
            List<Integer> adj=graph[node];
            for(int otherNode:adj){
                if(--degrees[otherNode]==0){
                    queue.offer(otherNode);
                    res[cnt++]=otherNode;
                }
            }
        }
        
        return cnt==numCourses? res:new int[0];
    }
}
```