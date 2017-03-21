# beats 4.36%

```Java
public class Solution {
    public List<String> fullJustify(String[] words, int maxWidth) {
        List<String> res=new ArrayList<String>();
        
        List<String> cur=new ArrayList<String>();
        
        int iter=0;
        int leftWidth=maxWidth;
        while(iter<words.length){
            if(leftWidth>=words[iter].length()){
                cur.add(words[iter]);
                leftWidth-=words[iter].length()+1;
                iter++;
            }
            else{
                notLastLine(res,cur,maxWidth);
                leftWidth=maxWidth;
                cur.clear();
            }
        }
        
        if(cur.size()!=0){
            lastLine(res,cur,maxWidth);
        }
        
        return res;
    }
    
    private void notLastLine(List<String> res,List<String> cur,int maxWidth){
        System.out.println(cur);
        if(cur.size()==0) {
            res.add(getSpace(maxWidth));
            return;
        }
        int num=cur.size();
        int wordsLen=0;
        for(String word:cur){
            wordsLen+=word.length();
        }
        int totalSapce=maxWidth-wordsLen;
        
        int minSpace;
        if(num==1) minSpace=totalSapce;
        else minSpace=totalSapce/(num-1);
        
        int leftSpace=totalSapce-minSpace*(num-1);
        
        StringBuilder sb=new StringBuilder();
        sb.append(cur.get(0));
        
        for(int i=1;i<cur.size();i++){
            if(--leftSpace>=0){
                sb.append(getSpace(minSpace+1));
            }
            else{
                sb.append(getSpace(minSpace));
            }
            sb.append(cur.get(i));
        }
        
        if(sb.length()<maxWidth){
            sb.append(getSpace(maxWidth-sb.length()));
        }
        res.add(sb.toString());
    }
    
    private void lastLine(List<String> res,List<String> cur,int maxWidth){
        if(cur.size()==0) {
            res.add(getSpace(maxWidth));
            return;
        }
        StringBuilder sb=new StringBuilder();
        sb.append(cur.get(0));
        for(int i=1;i<cur.size();i++){
            sb.append(" "+cur.get(i));
        }
        sb.append(getSpace(maxWidth-sb.length()));
        res.add(sb.toString());
    }
    
    private String getSpace(int n){
        StringBuilder sb=new StringBuilder();
        for(int i=0;i<n;i++){
            sb.append(' ');
        }
        return sb.toString();
    }
}
```