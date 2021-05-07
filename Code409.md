# Longest Palindrome(��Ļ�������)

* �ܼ򵥣�������ַ���������������ô��ȡ�����ַ��������м�
* �����������������Ա߼���

```java
class Solution {
public int longestPalindrome(String s) {
        int[] cnt=new int[128];
        for(char c:s.toCharArray())
            cnt[c]++;
        boolean hasSingle=false;
        int res=0;
        for(char c=0;c<128;c++){
            if((cnt[c]&1)!=0) hasSingle=true;
            res+=cnt[c]/2*2;
        }
        return res+(hasSingle?1:0);
   }
}
```