# Merge Intervals

```java
class Solution {
//beats 59.82%
    public List<Interval> merge(List<Interval> intervals) {
        Collections.sort(intervals,new Comparator<Interval>(){
            @Override
            public int compare(Interval obj1,Interval obj2){
                return obj1.start-obj2.start;
            }
        });
        List<Interval> res=new ArrayList<Interval>();
        
        if(intervals.size()==0) return res;
        Interval iter=intervals.get(0);
        
        for(int i=1;i<intervals.size();i++){
            if(iter.end<intervals.get(i).start){
                res.add(iter);
                iter=intervals.get(i);
            }
            else{
                iter.end=Math.max(iter.end,intervals.get(i).end);
            }
        }
        
        res.add(iter);
        
        return res;
   }
}
```