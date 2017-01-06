# Majority Element II
* 注意点，某一时刻，只有num1或num2其中之一会替换为num，即使cnt1与cnt2都为0

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