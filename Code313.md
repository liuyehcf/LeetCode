# Super Ugly Number

* 比方说给出的primes=[2,3,5]
* 因此我们可以创建一个数组，里面的数字是排好序的丑数。里面的每一个丑数是前面(不是指其相邻的前一个)的丑数乘以2、3或者5得到的
* 我们假设数组中已经有若干个丑数，排好序后存在数组中。我们把现有的最大丑数记做M。现在我们来生成下一个丑数，该丑数肯定是前面某一个丑数乘以2、3或者5的结果。我们首先考虑把已有的每个丑数乘以2。在乘以2的时候，能得到若干个结果小于或等于M的。由于我们是按照顺序生成的，小于或者等于M肯定已经在数组中了，我们不需再次考虑；我们还会得到若干个大于M的结果，但我们只需要第一个大于M的结果，因为我们希望丑数是按从小到大顺序生成的，其他更大的结果我们以后再说。我们把得到的第一个乘以2后大于M的结果，记为M2。同样我们把已有的每一个丑数乘以3和5，能得到第一个大于M的结果M3和M5。那么下一个丑数应该是M2、M3和M5三个数的最小者


```Java
	//beats 86.50%
	public int nthSuperUglyNumber(int n, int[] primes) {
        int size=primes.length;
        
        int[] ugly=new int[n];
        ugly[0]=1;
        
        int[] factors=new int[size];
        int[] indexs=new int[size];
        
        System.arraycopy(primes,0,factors,0,size);


        for(int i=1;i<n;i++){
            ugly[i]=min(factors);
            for(int j=0;j<size;j++){
                if(factors[j]==ugly[i]){
                    factors[j]=ugly[++indexs[j]]*primes[j];
                }
            }
        }
        

        return ugly[n-1];
    }
    
    private int min(int[] nums){
        int minimum=Integer.MAX_VALUE;
        for(int num:nums){
            minimum=Math.min(minimum,num);
        }
        return minimum;
    }
```