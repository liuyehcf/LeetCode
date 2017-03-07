# The Skyline Problem

```Java
//beats 77.92%
public class Solution {
    private class Point{
        int high;
        boolean exists;
        Point(int high,boolean exists){
            this.high=high;
            this.exists=exists;
        }
    }
    public List<int[]> getSkyline(int[][] buildings) {
        Map<Integer,List<Point>> posPointMap=new TreeMap<Integer,List<Point>>();
        for(int[] building:buildings){
            if(!posPointMap.containsKey(building[0])){
                posPointMap.put(building[0],new ArrayList<Point>());
            }
            posPointMap.get(building[0]).add(new Point(building[2],true));
            
            if(!posPointMap.containsKey(building[1])){
                posPointMap.put(building[1],new ArrayList<Point>());
            }
            posPointMap.get(building[1]).add(new Point(building[2],false));
        }
        
        Queue<Integer> queue=new PriorityQueue(new Comparator<Integer>(){
            @Override
            public int compare(Integer obj1,Integer obj2){
                return obj2-obj1;
            }
        });
        List<int[]> res=new ArrayList<int[]>();
        int preHigh=-1;
        for(Map.Entry<Integer,List<Point>> p:posPointMap.entrySet()){
            for(Point point:p.getValue()){
                if(point.exists){
                    queue.offer(point.high);
                }
                else{
                    queue.remove(point.high);
                }
            }
            int curHigh;
            if(queue.isEmpty()){
                curHigh=0;
            }
            else{
                curHigh=queue.peek();
            }
            
            if(curHigh!=preHigh){
                preHigh=curHigh;
                res.add(new int[]{p.getKey(),curHigh});
            }
        }
        return res;
    }
}
```