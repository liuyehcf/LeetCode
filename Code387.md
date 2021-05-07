# First Unique Character in a String(�ҵ���һ�����ظ����ַ����±꣬û���򷵻�-1)

## һ��˼·

* �ʼ������һ�£�������һ��map���������⣬��Character�����ֵ�λ�û��ߴ�Character�����ֵĴ�����������
* ��Ҫ����һ����������¼���������߼�¼λ��

* �����Ǵ�Characterӳ�䵽λ��
```Java
    public int firstUniqChar(String s) {
        Map<Character,Integer> mapCharToPos=new HashMap<Character,Integer>();
        int[] cnt=new int[s.length()];
        for(int i=0;i<s.length();i++){
            char c=s.charAt(i);
            if(mapCharToPos.containsKey(c)){
                cnt[mapCharToPos.get(c)]++;
            }else{
                mapCharToPos.put(c,i);
                cnt[i]++;
            }
        }
        for(int i=0;i<s.length();i++){
            if(cnt[i]==1) return i;
        }
        return -1;
    }
```

* �����Ǵ�Characterӳ�䵽����
```Java
    public int firstUniqChar(String s) {
        Map<Character,Integer> mapCharToCount=new HashMap<Character,Integer>();
        int[] pos=new int[26];
        for(int i=0;i<s.length();i++){
            char c=s.charAt(i);
            if(mapCharToCount.containsKey(c)){
                mapCharToCount.put(c,mapCharToCount.get(c)+1);
            }else{
                pos[c-'a']=i;
                mapCharToCount.put(c,1);
            }
        }
        int res=Integer.MAX_VALUE;
        for(char c='a';c<='z';c++){
            if(mapCharToCount.containsKey(c)&&mapCharToCount.get(c)==1){
                res=Math.min(res,pos[c-'a']);
            }
        }
        return res==Integer.MAX_VALUE?-1:res;
    }
```

## ˼ά��ʽ�����

```Java
    public int firstUniqChar(String s) {
        int[] cnt=new int[26];
        for(char c:s.toCharArray()){
            cnt[c-'a']++;
        }
        for(int i=0;i<s.length();i++){
            if(cnt[s.charAt(i)-'a']==1) return i;
        }
        return -1;
    }
```