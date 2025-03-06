/// Longest Substring Without Repeating Characters
/// https://leetcode.com/problems/longest-substring-without-repeating-characters/description/
/// Given a string s, find the length of the longest substring without duplicate characters.
///
/// Example 1:
/// Input: s = "abcabcbb"
/// Output: 3
/// Explanation: The answer is "abc", with the length of 3.
///
/// Example 2:
/// Input: s = "bbbbb"
/// Output: 1
/// Explanation: The answer is "b", with the length of 1.
///
/// Example 3:
/// Input: s = "pwwkew"
/// Output: 3
/// Explanation: The answer is "wke", with the length of 3.
/// Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
///
/// Constraints:
///
/// 0 <= s.length <= 5 * 104
/// s consists of English letters, digits, symbols and spaces.

class Solution {
  int lengthOfLongestSubstring(String s) {
    if (s.length <= 1) return s.length;

    int right = 0;
    final l = s.length;
    Map<String, String> hashMap = {};
    String current = '';
    String longest = '';

    while (right <= l - 1) {
      final rightValue = s[right];
      if (hashMap.containsKey(rightValue)) {
        hashMap.remove(current[0]);
        current = current.substring(1);
      } else {
        hashMap.putIfAbsent(rightValue, () => rightValue);
        right++;
        current += rightValue;

        if (longest.length < current.length && current.length == hashMap.length) {
          longest = current;
        }
      }
    }
    // print('longest: $longest');

    return longest.length;
  }
}

void main() {
  final Solution solution = Solution();
  final result1 = solution.lengthOfLongestSubstring('abcabcbb'); // => "abc"
  print('result1: $result1');
  final result2 = solution.lengthOfLongestSubstring('bbbbb'); // => "b"
  print('result2: $result2');
  final result3 = solution.lengthOfLongestSubstring('pwwkew'); // => "wke"
  print('result3: $result3');
}
