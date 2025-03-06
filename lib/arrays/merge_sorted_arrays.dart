/// You are given two integer arrays nums1 and nums2, sorted in non-decreasing order,
/// and two integers m and n, representing the number of elements in nums1 and nums2 respectively.
///
/// Merge nums1 and nums2 into a single array sorted in non-decreasing order.
///
/// The final sorted array should not be returned by the function, but instead be stored inside the array nums1.
/// To accommodate this, nums1 has a length of m + n, where the first m elements denote the elements
/// that should be merged, and the last n elements are set to 0 and should be ignored. nums2 has a length of n.
///
/// Example 1:
/// Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
/// Output: [1,2,2,3,5,6]
/// Explanation: The arrays we are merging are [1,2,3] and [2,5,6].
/// The result of the merge is [1,2,2,3,5,6] with the underlined elements coming from nums1.
///
/// Example 2:
/// Input: nums1 = [1], m = 1, nums2 = [], n = 0
/// Output: [1]
/// Explanation: The arrays we are merging are [1] and [].
/// The result of the merge is [1].
///
/// Example 3:
/// Input: nums1 = [0], m = 0, nums2 = [1], n = 1
/// Output: [1]
/// Explanation: The arrays we are merging are [] and [1].
/// The result of the merge is [1].
/// Note that because m = 0, there are no elements in nums1.
/// The 0 is only there to ensure the merge result can fit in nums1.
///
/// Constraints:
///
/// nums1.length == m + n
/// nums2.length == n
/// 0 <= m, n <= 200
/// 1 <= m + n <= 200
/// -10^9 <= nums1[i], nums2[j] <= 10^9
///
/// Follow up: Can you come up with an algorithm that runs in O(m + n) time?

class Solution {
  List<int> merge(List<int> nums1, int m, List<int> nums2, int n) {
    List<int> ar3 = [];

    if (m == 0) {
      nums1 = List.from(nums2);
      return nums1;
    } else {
      /// [1, 2, 3, 0, 0, 0], 3, [2, 5, 6], 3)
      int i = 0;
      int j = 0;

      while (i < m && j < n) {
        ///  Pick smaller of the two current elements and move ahead in the array of the picked element
        if (nums1[i] < nums2[j]) {
          ar3.add(nums1[i]);
          i += 1;
        } else {
          ar3.add(nums2[j]);
          j += 1;
        }
      }

      while (i < m) {
        ar3.add(nums1[i]);
        i += 1;
      }

      /// Else if there are remaining elements of the second array, move them
      while (j < n) {
        ar3.add(nums2[j]);
        j += 1;
      }
    }

    nums1 = List.from(ar3);
    return nums1;
  }
}

void main() {
  final Solution solution = Solution();
  print('result: ${solution.merge([1, 2, 3, 0, 0, 0], 3, [2, 5, 6], 3)}');
  print('result: ${solution.merge([1], 1, [], 0)}');
  print('result: ${solution.merge([0], 0, [1], 1)}');
}
