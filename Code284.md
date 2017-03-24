# Peeking Iterator


```Java
// Java Iterator interface reference:
// https://docs.oracle.com/javase/8/docs/api/java/util/Iterator.html
class PeekingIterator implements Iterator<Integer> {

    private Iterator<Integer> iterator;
    private int peek=0;
    private boolean isPeek;
    
	public PeekingIterator(Iterator<Integer> iterator) {
	    // initialize any member here.
	    this.iterator=iterator;
	    isPeek=false;
	}

    // Returns the next element in the iteration without advancing the iterator.
	public Integer peek() {
        if(!isPeek) {
            next();
            isPeek=true;
        }
        return peek;
	}

	// hasNext() and next() should behave the same as in the Iterator interface.
	// Override them if needed.
	@Override
	public Integer next() {
	    if(isPeek) {
	        isPeek=false;
	        return peek;
	    }
	    peek=iterator.next();
	    return peek;
	}

	@Override
	public boolean hasNext() {
	    return iterator.hasNext()||isPeek;
	}
}
```