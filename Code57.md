# Insert Interval

```Java
	//beats 72.52%
	public List<Interval> insert(List<Interval> intervals, Interval newInterval) {
        List<Interval> res=new ArrayList<Interval>();
        
        for(int i=0;i<intervals.size();i++){
            if(newInterval==null) res.add(intervals.get(i));
            else if(intervals.get(i).end<newInterval.start){
                res.add(intervals.get(i));
            }
            else if(newInterval.end<intervals.get(i).start){
                res.add(newInterval);
                newInterval=null;
                res.add(intervals.get(i));//<Warn>:missing this
            }
            else{
                newInterval.start=Math.min(newInterval.start,intervals.get(i).start);
                newInterval.end=Math.max(newInterval.end,intervals.get(i).end);
            }
        }
        
        if(newInterval!=null) res.add(newInterval);
        
        return res;
    }
```

```Java
public class Solution {
    public List<Interval> insert(List<Interval> intervals, Interval newInterval) {
        List<Interval> res=new ArrayList<Interval>();
        
        int i=0;
        for(;i<intervals.size();i++){
            Interval cur=intervals.get(i);
            if(newInterval.end<cur.start){
                res.add(newInterval);
                newInterval=null;
                break;
            }
            else if(newInterval.start>cur.end){
                res.add(cur);
            }
            else{
                newInterval.start=Math.min(newInterval.start,cur.start);
                newInterval.end=Math.max(newInterval.end,cur.end);
            }
        }
        
        if(newInterval!=null){
            res.add(newInterval);
        }
        else{
            while(i<intervals.size()){
                res.add(intervals.get(i++));
            }
        }
        
        return res;
    }
}
```