# Create Maximum Number

* 失败的尝试，想通过一个栈来实现
* 若当前值大于栈顶元素，并且剩余的元素足够，那么循环将栈顶元素弹出
* 问题在于，判断剩余元素是否足够这里本身有问题，假设当前元素比栈顶元素大但是剩余元素不够了，那么就不会弹出栈顶元素了，但事实上这是不对的，因为弹出后，可以将指针向左移动
* [1,2,3,4,5] [1,2,3,9] 当判断9是否可入栈的时候，剩余元素已经不足了，但是9确实是可以入栈的
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

* 换一种思路：两个数组找长为k的组合，那么必然是第一个数组拿出i个元素，第二个数组拿出j个元素，这k个数再拼一个最大数
* 于是转换成了单个数组中长为k的最大数以及其合并的问题
* 对于greater这个函数，注意与归并排序中的比较不同，归并排序只需要比较当前一个值即可，因为是有序的，但此处是无须的，如果出现了相等的元素，必须继续往后比较
* 例如[1 1 3] [1 1 9] 合并成最大的六位数，那么第一个1从哪取呢，必然是第二个数组中取，119113

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
            if(iter<k)//漏了这句
                res[iter++]=nums[i];
        }
        return res;
    }
```