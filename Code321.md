# Create Maximum Number

* ʧ�ܵĳ��ԣ���ͨ��һ��ջ��ʵ��
* ����ǰֵ����ջ��Ԫ�أ�����ʣ���Ԫ���㹻����ôѭ����ջ��Ԫ�ص���
* �������ڣ��ж�ʣ��Ԫ���Ƿ��㹻���ﱾ�������⣬���赱ǰԪ�ر�ջ��Ԫ�ش���ʣ��Ԫ�ز����ˣ���ô�Ͳ��ᵯ��ջ��Ԫ���ˣ�����ʵ�����ǲ��Եģ���Ϊ�����󣬿��Խ�ָ�������ƶ�
* [1,2,3,4,5] [1,2,3,9] ���ж�9�Ƿ����ջ��ʱ��ʣ��Ԫ���Ѿ������ˣ�����9ȷʵ�ǿ�����ջ��
```Java
    class Node{
        int num;
        boolean isLeft;
        int pos;
        public Node(int num,boolean isLeft,int pos){
            this.num=num;
            this.isLeft=isLeft;
            this.pos=pos;
        }
        public String toString(){
            return Integer.toString(num);
        }
    }
    public int[] maxNumber(int[] nums1, int[] nums2, int k) {
        LinkedList<Node> stack=new LinkedList<Node>();
        
        int iter1=0,iter2=0;
        int remain=nums1.length+nums2.length;
        
        while(iter1<nums1.length||iter2<nums2.length){
            Node node=null;
            if(iter1==nums1.length){
                node=new Node(nums2[iter2],false,iter2);
            }
            else if(iter2==nums2.length){
                node=new Node(nums1[iter1],true,iter1);
            }
            else if(nums1[iter1]>=nums2[iter2]){
                node=new Node(nums1[iter1],true,iter1);
            }
            else{
                node=new Node(nums2[iter2],false,iter2);
            }
            int remainSize=k-stack.size();
            int remainNum=(nums1.length-1-iter1)+(nums2.length-1-iter2);
            while(remainNum>remainSize&&!stack.isEmpty()&&node.num>stack.peek().num){
                Node peekNode=stack.pop();
                if(node.isLeft&&!peekNode.isLeft) iter2=0;
                else if(!node.isLeft&&peekNode.isLeft) iter1=0;
                remainNum=(nums1.length-1-iter1)+(nums2.length-1-iter2);
                remainSize--;
            }
            
            if(stack.size()<k){
                stack.push(node);
                if(node.isLeft)iter1++;
                else iter2++;
            }else{
                if(iter1<nums1.length) iter1++;
                if(iter2<nums2.length) iter2++;
            }

        }

        int[] res=new int[k];
        for(int i=k-1;i>=0;i--){
            res[i]=stack.pop().num;
        }
        return res;
    }
```

* ��һ��˼·�����������ҳ�Ϊk����ϣ���ô��Ȼ�ǵ�һ�������ó�i��Ԫ�أ��ڶ��������ó�j��Ԫ�أ���k������ƴһ�������
* ����ת�����˵��������г�Ϊk��������Լ���ϲ�������
* ����greater���������ע����鲢�����еıȽϲ�ͬ���鲢����ֻ��Ҫ�Ƚϵ�ǰһ��ֵ���ɣ���Ϊ������ģ����˴�������ģ������������ȵ�Ԫ�أ������������Ƚ�
* ����[1 1 3] [1 1 9] �ϲ���������λ������ô��һ��1����ȡ�أ���Ȼ�ǵڶ���������ȡ��119113

```Java
    public int[] maxNumber(int[] nums1, int[] nums2, int k) {
        int[] res=new int[k];
        for(int len1=Math.max(0,k-nums2.length);len1<=Math.min(nums1.length,k);len1++){
            int len2=k-len1;
            int[] candidate=merge(maxAry(nums1,len1),maxAry(nums2,len2));
            if(greater(candidate,0,res,0)) res=candidate;
        }
        return res;
    }
    
    private int[] merge(int[] nums1,int[] nums2){
        int iter1=0,iter2=0;
        int[] res=new int[nums1.length+nums2.length];
        for(int i=0;i<res.length;i++){
            res[i]=greater(nums1,iter1,nums2,iter2)?nums1[iter1++]:nums2[iter2++];
        }
        return res;
    }
    
    private boolean greater(int[] nums1,int pos1,int[] nums2,int pos2){
        while(pos1<nums1.length&&pos2<nums2.length&&nums1[pos1]==nums2[pos2]){
            pos1++;
            pos2++;
        }
        return pos2==nums2.length||pos1<nums1.length&&nums1[pos1]>nums2[pos2];
    }
    
    private int[] maxAry(int[] nums,int k){
        int[] res=new int[k];
        int iter=0;
        for(int i=0;i<nums.length;i++){
            int num1=k-iter;
            int num2=nums.length-i;
            while(iter>0&&res[iter-1]<nums[i]&&num2>num1){
                iter--;
                num1++;
            } 
            if(iter<k)//©�����
                res[iter++]=nums[i];
        }
        return res;
    }
```