# Rectangle Area

```java
class Solution {
    public int computeArea(int A, int B, int C, int D, int E, int F, int G, int H) {
        int areaA=(C-A)*(D-B);
        int areaB=(G-E)*(H-F);
        
        int left=Math.max(A,E);
        int right=Math.min(C,G);
        int top=Math.min(D,H);
        int bottom=Math.max(B,F);
        
        if(right<left||top<bottom) return areaA+areaB-0;
        return areaA+areaB-(right-left)*(top-bottom);
    }
}
```