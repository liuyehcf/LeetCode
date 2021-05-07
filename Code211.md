# Add and Search Word - Data structure design


```java
//beats 20
public class WordDictionary {
    
    class Node{
        Node[] children=new Node[26];
        boolean isWord=false;
    }
    
    private Node root;

    /** Initialize your data structure here. */
    public WordDictionary() {
        root=new Node();
    }
    
    /** Adds a word into the data structure. */
    public void addWord(String word) {
        Node iter=root;
        for(char c:word.toCharArray()){
            if(iter.children[c-'a']==null){
                iter.children[c-'a']=new Node();
            }
            iter=iter.children[c-'a'];
        }
        iter.isWord=true;
    }
    
    /** Returns if the word is in the data structure. A word could contain the dot character '.' to represent any one letter. */
    public boolean search(String word) {
        return search(word,root);
    }
    
    private boolean search(String word,Node root){
        if(word.length()==0) return root.isWord;
        char c=word.charAt(0);
        if(c=='.'){
            for(Node child:root.children){
                if(child!=null){
                    if(search(word.substring(1),child)) return true;
                }
            }
            return false;
        }
        else{
            if(root.children[c-'a']==null) return false;
            return search(word.substring(1),root.children[c-'a']);
        }
    }
}
```