# Merge Sorted Array

```java
class Solution {
    public void merge(int[] nums1, int m, int[] nums2, int n) {
        for (int i = 0; i < m; i++) {
            nums1[nums1.length - 1 - i] = nums1[m - 1 - i];
        }

        int iter1 = nums1.length - m;
        int iter2 = 0;
        int iter = 0;

        while (iter1 < nums1.length && iter2 < nums2.length) {
            if (nums1[iter1] <= nums2[iter2]) {
                nums1[iter++] = nums1[iter1++];
            } else {
                nums1[iter++] = nums2[iter2++];
            }
        }

        while (iter1 < nums1.length) {
            nums1[iter++] = nums1[iter1++];
        }

        while (iter2 < nums2.length) {
            nums1[iter++] = nums2[iter2++];
        }
    }
}
```