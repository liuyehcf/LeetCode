# Valid Number

* 弱智题，我艹
```Java
public class Solution {
    public boolean isNumber(String s) {
        s=s.trim();
        int i=0;
        boolean flagPoint=false;
        boolean flagE=false;
        while(i<s.length()){
            char c=s.charAt(i);
            if(c=='.'){
                return s.length()!=1&&isValidInteger(s.substring(0,i),true)&&isValidDecimal(s.substring(i+1));
            }
            else if(c=='e'){
                return isValidInteger(s.substring(0,i),false)&&isNumber(s.substring(i+1));
            }
            else if(Character.isDigit(c)||c=='-') i++;
            else return false;
        }
        
        return isValidInteger(s,false);
    }
    
    private boolean isValidDecimal(String s){
        System.out.println("isValidDecimal:"+s);
        if(s==null||s.length()==0) return true;
        for(int i=0;i<s.length();i++){
            char c=s.charAt(i);
            if(!Character.isDigit(c)) return false;
        }
        return true;
    }
    
    private boolean isValidInteger(String s,boolean canBeNull){
        System.out.println("isValidInteger:"+s);
        if(s==null||s.length()==0) return canBeNull;
        if(!Character.isDigit(s.charAt(0))&&s.charAt(0)!='-') return false;
        for(int i=1;i<s.length()-1;i++){
            char c=s.charAt(i);
            if(!Character.isDigit(c)) return false;
        }
        return true;
    }
}
```


```Java
public class Solution {
    public boolean isNumber(String s) {
        s = s.trim();
    
        boolean pointSeen = false;
        boolean eSeen = false;
        boolean numberSeen = false;
        boolean numberAfterE = true;
        for(int i=0; i<s.length(); i++) {
            if('0' <= s.charAt(i) && s.charAt(i) <= '9') {
                numberSeen = true;
                numberAfterE = true;
            } else if(s.charAt(i) == '.') {
                if(eSeen || pointSeen) {
                    return false;
                }
                pointSeen = true;
            } else if(s.charAt(i) == 'e') {
                if(eSeen || !numberSeen) {
                    return false;
                }
                numberAfterE = false;
                eSeen = true;
            } else if(s.charAt(i) == '-' || s.charAt(i) == '+') {
                if(i != 0 && s.charAt(i-1) != 'e') {
                    return false;
                }
            } else {
                return false;
            }
        }
        return numberSeen && numberAfterE;
    }
}
```