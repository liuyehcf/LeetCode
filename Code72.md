# Edit Distance

* 删和增可以看成同一种，于是就变成了两种，change或者insert
```java
//beats 78.01%
class Solution {
    public int minDistance(String word1, String word2) {
        if(word1==null||word2==null) return 0;
        int len1=word1.length(),len2=word2.length();
        int[][] dp=new int[len1+1][len2+1];
        for(int i=1;i<=len1;i++){
            dp[i][0]=i;
        }
        for(int i=1;i<=len2;i++){
            dp[0][i]=i;
        }
        
        for(int i=1;i<=len1;i++){
            for(int j=1;j<=len2;j++){
                char c1=word1.charAt(i-1);
                char c2=word2.charAt(j-1);
                
                if(c1==c2){
                    dp[i][j]=Math.min(dp[i-1][j-1],Math.min(dp[i-1][j]+1,dp[i][j-1]+1));
                }
                else{
                    dp[i][j]=Math.min(dp[i-1][j-1]+1,Math.min(dp[i-1][j]+1,dp[i][j-1]+1));
                }
            }
        }
        
        return dp[len1][len2];
    }
}
```


* 文件diff的实现，并指出具体的修改方式
```java
public class FileDiff {
    public static void diff(String path1,String path2) throws IOException{

        BufferedReader reader1 = new BufferedReader(new FileReader(path1));
        BufferedReader reader2 = new BufferedReader(new FileReader(path2));

        List<String> oldContent=new ArrayList<String>();
        List<String> newContent=new ArrayList<String>();

        String temp=null;
        while((temp=reader1.readLine())!=null){
            oldContent.add(temp);
        }
        while((temp=reader2.readLine())!=null){
            newContent.add(temp);
        }

        int lineNum1=oldContent.size();
        int lineNum2=newContent.size();

        int[][] dp=new int[lineNum1+1][lineNum2+1];
        Map<String,List<Option>> cache=new HashMap<String,List<Option>>();
        cache.put("0,0",new ArrayList<Option>());


        for(int i=1;i<=lineNum1;i++){
            dp[i][0]=dp[i-1][0]+1;
            List<Option> curList=new ArrayList<Option>(cache.get(""+(i-1)+",0"));
            curList.add(new Option(i,0,"delete"));
            cache.put(""+i+",0",curList);
        }

        for(int i=1;i<=lineNum2;i++){
            dp[0][i]=dp[0][i-1]+1;
            List<Option> curList=new ArrayList<Option>(cache.get("0,"+(i-1)));
            curList.add(new Option(0,i,"insert"));
            cache.put("0,"+i,curList);
        }

        for(int i=1;i<=lineNum1;i++){
            for(int j=1;j<=lineNum2;j++){
                String oldLine=oldContent.get(i-1);
                String newLine=newContent.get(j-1);
                if(oldLine.equals(newLine)){
                    if(dp[i-1][j-1]<=dp[i][j-1]+1&&dp[i-1][j-1]<=dp[i-1][j]+1){
                        dp[i][j]=dp[i-1][j-1];
                        List<Option> curList=new ArrayList<Option>(cache.get(""+(i-1)+","+(j-1)));
                        cache.put(""+i+","+j,curList);
                    }
                    else if(dp[i][j-1]+1<=dp[i-1][j-1]&&dp[i][j-1]<=dp[i-1][j]){
                        dp[i][j]=dp[i][j-1]+1;
                        List<Option> curList=new ArrayList<Option>(cache.get(""+i+","+(j-1)));
                        curList.add(new Option(i,j,"insert"));
                        cache.put(""+i+","+j,curList);
                    }
                    else{
                        dp[i][j]=dp[i-1][j]+1;
                        List<Option> curList=new ArrayList<Option>(cache.get(""+(i-1)+","+j));
                        curList.add(new Option(i,j,"delete"));
                        cache.put(""+i+","+j,curList);
                    }
                }
                else{
                    if(dp[i-1][j-1]<=dp[i][j-1]&&dp[i-1][j-1]<=dp[i-1][j]){
                        dp[i][j]=dp[i-1][j-1]+1;
                        List<Option> curList=new ArrayList<Option>(cache.get(""+(i-1)+","+(j-1)));
                        curList.add(new Option(i,j,"change"));
                        cache.put(""+i+","+j,curList);
                    }
                    else if(dp[i][j-1]<=dp[i-1][j-1]&&dp[i][j-1]<=dp[i-1][j]){
                        dp[i][j]=dp[i][j-1]+1;
                        List<Option> curList=new ArrayList<Option>(cache.get(""+i+","+(j-1)));
                        curList.add(new Option(i,j,"insert"));
                        cache.put(""+i+","+j,curList);
                    }
                    else{
                        dp[i][j]=dp[i-1][j]+1;
                        List<Option> curList=new ArrayList<Option>(cache.get(""+(i-1)+","+j));
                        curList.add(new Option(i,j,"delete"));
                        cache.put(""+i+","+j,curList);
                    }
                }
            }
        }
        System.out.println(cache.get(""+lineNum1+","+lineNum2));
    }

    public static void main(String[] args) throws IOException {
        diff("C:\\Users\\Liuye\\Desktop\\old.md","C:\\Users\\Liuye\\Desktop\\new.md");
    }
}

class Option{
    int oldPos;
    int newPos;
    String option;
    Option(int oldPos,int newPos,String option){
        this.oldPos=oldPos;
        this.newPos=newPos;
        this.option=option;
    }

    @Override
    public String toString(){
        return "\n{"+oldPos+","+newPos+"} : "+option+"\n";
    }
}
```