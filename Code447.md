# Number of Boomerangs(给定n个二维坐标，返回tuple(i,j,k)的个数，满足i到j的距离等于i到k的距离)

```Java
	public int numberOfBoomerangs(int[][] points) {
        int res=0;
        for(int i=0;i<points.length;i++){
            int[] point_i=points[i];
            Map<Integer,Integer> map=new HashMap<Integer,Integer>();
            for(int p=0;p<points.length;p++){
                if(p==i) continue;
                int[] point_p=points[p];
                int curDistance=distance(point_i,point_p);
                if(map.containsKey(curDistance))
                    map.put(curDistance,map.get(curDistance)+1);
                else
                    map.put(curDistance,1);
            }
            for(Map.Entry<Integer,Integer> pair:map.entrySet()){
                if(pair.getValue()<2) continue;
                res+=pair.getValue()*(pair.getValue()-1);
            }
        }
        return res;
    }
    private int distance(int[] p1,int[] p2){
        return (p1[0]-p2[0])*(p1[0]-p2[0])+(p1[1]-p2[1])*(p1[1]-p2[1]);
    }
```