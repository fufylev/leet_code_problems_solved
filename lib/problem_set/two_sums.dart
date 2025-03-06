/// https://leetcode.com/problems/two-sum/description/
/// 1. Two Sum
// Given an array of integers nums and an integer target, return indices of the two numbers
// such that they add up to target.
//
// You may assume that each input would have exactly one solution, and you may not use
// the same element twice.
//
// You can return the answer in any order.
//
// Example 1:
// Input: nums = [2,7,11,15], target = 9
// Output: [0,1]
// Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
//
// Example 2:
// Input: nums = [3,2,4], target = 6
// Output: [1,2]
// Example 3:
//
// Input: nums = [3,3], target = 6
// Output: [0,1]
//
// Constraints:
//
// 2 <= nums.length <= 10^4
// -10^9 <= nums[i] <= 10^9
// -10^9 <= target <= 10^9
// Only one valid answer exists.

class Solution {
  List<int> twoSum(List<int> nums, int target) {
    Map<int, int> hashMap = {};

    for (int i = 0; i < nums.length; i++) {
      int complement = target - nums[i];
      if (hashMap.containsKey(complement)) {
        return [hashMap[complement]!, i];
      }
      hashMap[nums[i]] = i;
    }

    return [];
  }
}
// First solution
// class Solution {
//   List<int> twoSum(List<int> nums, int target) {
//     Map<int, int> hashMap = {};
//     List<int> list = [];
//     for (int i = 0; i < nums.length; i++) {
//       hashMap.putIfAbsent(nums[i], () => i);
//     }
//
//     for (int i = 0; i < nums.length; i++) {
//       if (hashMap.containsKey(target - nums[i]) && ((hashMap[target - nums[i]]) ?? 0) != i) {
//         list.add(i);
//         list.add(hashMap[target - nums[i]] ?? 0);
//         break;
//       }
//     }
//
//     return list;
//   }
// }

void main() {
  final Solution solution = Solution();
  final result1 = solution.twoSum([2, 7, 11, 15], 9); // => [0,1]
  print('result twoSum([2, 7, 11, 15], 9): $result1');
  final result2 = solution.twoSum([3, 2, 4], 6); // => [1,2]
  print('result twoSum([3, 2, 4], 6): $result2');
}
