# Majority Element II
* 注锟斤拷锟姐，某一时锟教ｏ拷只锟斤拷num1锟斤拷num2锟斤拷锟斤拷之一锟斤拷锟芥换为num锟斤拷锟斤拷使cnt1锟斤拷cnt2锟斤拷为0

```Java
	//beats 62.63%
	public List<Integer> majorityElement(int[] nums) {
        List<Integer> res=new ArrayList<Integer>();
        int cnt1=0;
        int cnt2=0;
        int num1=Integer.MAX_VALUE,num2=Integer.MAX_VALUE;
        for(int num:nums){
            if(num1==num) {
                cnt1++;
            }
            else if(num2==num) {
                cnt2++;
            }
            else if(cnt1==0){
                num1=num;
                cnt1=1;
            }
            else if(cnt2==0){
                num2=num;
                cnt2=1;
            }
            else{
                cnt1--;
                cnt2--;
            }
        }
        cnt1=0;cnt2=0;
        for(int num:nums){
            if(num==num1) cnt1++;
            else if(num==num2) cnt2++;
        }
        if(cnt1>nums.length/3) res.add(num1);
        if(cnt2>nums.length/3) res.add(num2);
        return res;
    }
```


```Java
public class Solution {
    public List<Integer> majorityElement(int[] nums) {
        long value1=Long.MAX_VALUE;
        long value2=Long.MAX_VALUE;
        int cnt1=0,cnt2=0;
        for(long num:nums){
            if(value1==num){
                cnt1++;
            }
            else if(value2==num){
                cnt2++;
            }
            else if(cnt1==0){//杩欎釜鏉′欢鍜屼笅闈㈣繖涓潯浠讹紝杩樹笉鑳芥斁鍒版渶鍓嶉潰锛屽惁鍒欎緥濡俒2,2]锛岃繑鍥炵粨鏋滀細鏄�2锛�2
                value1=num;
                cnt1++;
            }
            else if(cnt2==0){
                value2=num;
                cnt2++;
            }
            else{
                cnt1--;
                cnt2--;
            }
        }
        cnt1=0;cnt2=0;
        for(long num:nums){
            if(num==value1) cnt1++;
            if(num==value2) cnt2++;
        }
        List<Integer> res=new ArrayList<Integer>();
        if(cnt1>nums.length/3) res.add((int)value1);
        if(cnt2>nums.length/3) res.add((int)value2);
        return res;
    }
}
```