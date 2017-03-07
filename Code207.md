# Course Schedule

* BFS

```Java
	//beats 80.10%
	public class Solution {
    public boolean canFinish(int numCourses, int[][] prerequisites) {
        List<Integer>[] graph=new List[numCourses];
        for(int i=0;i<numCourses;i++){
            graph[i]=new ArrayList<Integer>();
        }
        
        int[] degrees=new int[numCourses];
        
        for(int[] edge:prerequisites){
            graph[edge[1]].add(edge[0]);
            degrees[edge[0]]++;
        }
        
        boolean[] visited=new boolean[numCourses];
        
        Queue<Integer> queue=new LinkedList<Integer>();
        for(int i=0;i<numCourses;i++){
            if(degrees[i]==0) {
                queue.offer(i);
                visited[i]=true;
            }
        }
        
        
        
        while(!queue.isEmpty()){
            int node=queue.poll();
            List<Integer> adj=graph[node];
            for(int otherNode:adj){
                if(--degrees[otherNode]==0){
                    queue.offer(otherNode);
                    visited[otherNode]=true;
                }
            }
        }
        
        for(boolean b:visited){
            if(!b) return false;
        }
        
        return true;
    }
}
```


```Java
public class Solution {
    public boolean canFinish(int numCourses, int[][] prerequisites) {
        List<Integer>[] graph=new List[numCourses];
        for(int i=0;i<numCourses;i++){
            graph[i]=new ArrayList<Integer>();
        }
        
        int[] degrees=new int[numCourses];
        
        for(int[] edge:prerequisites){
            graph[edge[1]].add(edge[0]);
            degrees[edge[0]]++;
        }
        
        int visitedCnt=0;
        
        Queue<Integer> queue=new LinkedList<Integer>();
        for(int i=0;i<numCourses;i++){
            if(degrees[i]==0) {
                queue.offer(i);
                visitedCnt++;
            }
        }
        
        
        
        while(!queue.isEmpty()){
            int node=queue.poll();
            List<Integer> adj=graph[node];
            for(int otherNode:adj){
                if(--degrees[otherNode]==0){
                    queue.offer(otherNode);
                    visitedCnt++;
                }
            }
        }
        
        return visitedCnt==numCourses;
    }
}
```


* DFS
```Java
	public boolean canFinish(int numCourses, int[][] prerequisites) {
        List<Integer>[] graph=new List[numCourses];
        for(int i=0;i<numCourses;i++){
            graph[i]=new ArrayList<Integer>();
        }
        

        for(int[] edge:prerequisites){
            graph[edge[1]].add(edge[0]);
        }
        
        boolean[] visited=new boolean[numCourses];
        boolean[] visiting=new boolean[numCourses];
        
        for(int i=0;i<numCourses;i++){
            if(!visited[i]){
                if(!helper(graph,visited,visiting,i)) return false;
            }
        }
        
        return true;
    }
    
    private boolean helper(List<Integer>[] graph, boolean[] visited,boolean[] visiting,int node){
        if(visiting[node]==true) return false;
        List<Integer> adj=graph[node];
        visiting[node]=true;
        for(int otherNode:adj){
            if(!visited[otherNode]){
                if(!helper(graph,visited,visiting,otherNode)) return false;
            }
        }
        visiting[node]=false;
        visited[node]=true;
        return true;
    }
```