# Partition List(�����е�partition������ʵ��)

* ע��㣺ȡ��ֵС��ָ��ֵ�Ľڵ㣬��Ҫά����ǰһ���ڵ�(pre)����pre��ά����"iter�Ƿ���С��ָ��ֵ�������й���"�й�ϵ

```Java
	//beats 5.35
	public ListNode partition(ListNode head, int x) {
        ListNode pseudoHead=new ListNode(0);
        pseudoHead.next=head;
        ListNode smalltail=pseudoHead;
        ListNode iter=head;
        ListNode pre=pseudoHead;
        
        while(iter!=null){
            if(iter.val<x){
                //��ȡ����Ԫ�أ���ά������
                pre.next=iter.next;
                ListNode tempNext1=pre.next;//<Warn1>��pre.next��������������лᷢ���䶯�����������Ҫ����һ���Ա����iter

                //��iter���뵽ǰ�沿��,��ά������
                ListNode tempNext2=smalltail.next;
                smalltail.next=iter;
                iter.next=tempNext2;
                smalltail=iter;//<Warn2>���������Ǹ�����
                
                iter=tempNext1;
                
                //<Warn3>���������ַ���ʱ�Ų���Ҫ����pre��������Ҫ����pre
                if(iter==smalltail.next)
                    pre=smalltail;
            }
            else{
                pre=iter;
                iter=iter.next;
            }
        }
        return pseudoHead.next;
    }
    
    private void print(ListNode pseudoHead){
        ListNode iter=pseudoHead.next;
        System.out.print("begin: ");
        while(iter!=null){
            System.out.print(iter.val+"->");
            iter=iter.next;
        }
        System.out.println();
    }
```

* ��Ư����д��
```Java
	public ListNode partition(ListNode head, int x) {
        ListNode pseudoHead=new ListNode(0);
        pseudoHead.next=head;
        
        ListNode i=pseudoHead;//��Ӧ���������������i
        ListNode pre=pseudoHead;//��ȡ��ĳ�ڵ�ʱ����Ҫ����ǰ��ڵ��������������Ҫ�õ�ǰ���ڵ�
        
        ListNode iter=head;
        while(iter!=null){
            if(iter.val<x){
                if(i!=pre){
                    pre.next=iter.next;
                    ListNode tempIterNext=iter.next;
                    ListNode temp_i_Next=i.next;
                    i.next=iter;
                    iter.next=temp_i_Next;
                    i=i.next;
                    iter=tempIterNext;
                }
                else{ //��ĿǰΪֹ��������ǰ��iter�ڵ㣬���нڵ㶼�Ƶ�����ߵ�����Ҳ����i��pre���غϵģ���˲���Ҫ��������
                    pre=iter;
                    i=i.next;
                    iter=iter.next;
                }
            }
            else{
                pre=iter;
                iter=iter.next;
            }
        }
        
        return pseudoHead.next;
    }
```