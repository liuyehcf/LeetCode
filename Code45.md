# Jump Game II

```Java
	//beats 87.06%
	public int jump(int[] nums) {
        int curFar=0;
        int farest=curFar;
        int jump=0;
        int iter=0;
        while(farest<nums.length-1){
            while(iter<nums.length&&iter<=curFar){
                farest=Math.max(farest,iter+nums[iter]);
                iter++;
            }
            jump++;
            curFar=farest;
            //iter++;    <Warn>:������䣬�����������������ѭ���Ǳ�Ȼ�ᷢ���ģ�����������������ģ�Ҳ���ǲ����ܵ��յ�
        }
        return jump;
    }
```