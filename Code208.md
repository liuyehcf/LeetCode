# Implement Trie (Prefix Tree)


```Java
public class Trie {
    
    class TrieNode{
        TrieNode[] childs=new TrieNode[26];
        boolean isEnd=false;
    }
    
    private TrieNode root;
    
    /** Initialize your data structure here. */
    public Trie() {
        root=new TrieNode();
    }
    
    /** Inserts a word into the trie. */
    public void insert(String word) {
        TrieNode x=root;
        for(char c:word.toCharArray()){
            if(x.childs[c-'a']==null){
                x.childs[c-'a']=new TrieNode();
            }
            x=x.childs[c-'a'];
        }
        x.isEnd=true;
    }
    
    /** Returns if the word is in the trie. */
    public boolean search(String word) {
        TrieNode x=root;
        for(char c:word.toCharArray()){
            if(x.childs[c-'a']==null){
                return false;
            }
            x=x.childs[c-'a'];
        }
        return x.isEnd;
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    public boolean startsWith(String prefix) {
        TrieNode x=root;
        for(char c:prefix.toCharArray()){
            if(x.childs[c-'a']==null){
                return false;
            }
            x=x.childs[c-'a'];
        }
        return true;
    }
}
```