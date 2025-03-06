/// 12. Integer to Roman
/// https://leetcode.com/problems/integer-to-roman/description/
/// Seven different symbols represent Roman numerals with the following values:

/// Symbol	Value
/// I	1
/// V	5
/// X	10
/// L	50
/// C	100
/// D	500
/// M	1000
/// Roman numerals are formed by appending the conversions of decimal place values from highest to lowest.
/// Converting a decimal place value into a Roman numeral has the following rules:
///
/// If the value does not start with 4 or 9, select the symbol of the maximal value that can be subtracted from
/// the input, append that symbol to the result, subtract its value, and convert the remainder to a Roman numeral.
/// If the value starts with 4 or 9 use the subtractive form representing one symbol subtracted from
/// the following symbol, for example, 4 is 1 (I) less than 5 (V): IV and 9 is 1 (I) less than 10 (X): IX.
/// Only the following subtractive forms are used: 4 (IV), 9 (IX), 40 (XL), 90 (XC), 400 (CD) and 900 (CM).
/// Only powers of 10 (I, X, C, M) can be appended consecutively at most 3 times to represent multiples of 10.
/// You cannot append 5 (V), 50 (L), or 500 (D) multiple times. If you need to append a symbol 4 times use
/// the subtractive form.
/// Given an integer, convert it to a Roman numeral.
///
///
///
/// Example 1:
///
/// Input: num = 3749
///
/// Output: "MMMDCCXLIX"
///
/// Explanation:
///
/// 3000 = MMM as 1000 (M) + 1000 (M) + 1000 (M)
/// 700 = DCC as 500 (D) + 100 (C) + 100 (C)
/// 40 = XL as 10 (X) less of 50 (L)
/// 9 = IX as 1 (I) less of 10 (X)
/// Note: 49 is not 1 (I) less of 50 (L) because the conversion is based on decimal places
/// Example 2:
///
/// Input: num = 58
///
/// Output: "LVIII"
///
/// Explanation:
///
/// 50 = L
/// 8 = VIII
/// Example 3:
///
/// Input: num = 1994
///
/// Output: "MCMXCIV"
///
/// Explanation:
///
/// 1000 = M
/// 900 = CM
/// 90 = XC
/// 4 = IV
///
///
/// Constraints:
///
/// 1 <= num <= 3999

class Solution {
  static const Map<int, String> hashMap = {
    1: 'I',
    5: 'V',
    10: 'X',
    50: 'L',
    100: 'C',
    500: 'D',
    1000: 'M',
  };

  String cal(String current, int value, multiplier) {
    String string = current;
    if (hashMap.containsKey(value * multiplier)) {
      string += '${hashMap[value * multiplier]}';
    } else if (value == 4 || value == 9) {
      string += '${hashMap[multiplier]}${hashMap[(value + 1) * multiplier]}';
    } else if (value < 5) {
      string += '${List.generate(value, (_) => hashMap[multiplier]).join()}';
    } else {
      string += '${hashMap[5 * multiplier]}${List.generate(value - 5, (_) => hashMap[multiplier]).join()}';
    }

    return string;
  }

  String intToRoman(int num) {
    String result = '';
    final thousands = (num / 1000).floor();
    final hundreds = ((num - thousands * 1000) / 100).floor();
    final tens = ((num - thousands * 1000 - hundreds * 100) / 10).floor();
    final units = num % 10;

    if (num > 999) {
      result += '${List.generate(thousands, (_) => hashMap[1000]).join()}';
    }

    if (num > 99) {
      result = cal(result, hundreds, 100);
    }

    if (num > 9) {
      result = cal(result, tens, 10);
    }

    if (units > 0) {
      result = cal(result, units, 1);
    }

    return result;
  }
}

void main() {
  final Solution solution = Solution();
  final result1 = solution.intToRoman(3749); // => "MMMDCCXLIX"
  print('result 3749: $result1');
  final result2 = solution.intToRoman(58); // => "LVIII"
  print('result 58: $result2');
  final result3 = solution.intToRoman(1994); // => "MCMXCIV"
  print('result 1994: $result3');
  final result4 = solution.intToRoman(2); // => "II"
  print('result 2: $result4');
}

/*
This Dart code converts an integer to a Roman numeral. Let's break it down step by step, analyze its functionality, and discuss its time and space complexity.

---

### **Code Explanation**

#### **1. `hashMap`**
- A constant map (`hashMap`) is defined to store the mapping between integer values and their corresponding Roman numeral symbols.
- Example: `1` maps to `'I'`, `5` maps to `'V'`, etc.

#### **2. `cal` Function**
- This function constructs the Roman numeral string for a specific digit (`value`) and its place value (`multiplier`).
- It handles four cases:
  1. **Exact Match**: If the value exists in the `hashMap`, it directly appends the corresponding Roman numeral.
  2. **Subtractive Notation (4 or 9)**: For values like 4 (`IV`) or 9 (`IX`), it appends the appropriate subtractive notation.
  3. **Values Less Than 5**: For values less than 5, it appends the Roman numeral symbol multiple times (e.g., `III` for 3).
  4. **Values Greater Than or Equal to 5**: For values greater than or equal to 5, it appends the Roman numeral for 5 and then appends the remaining symbols (e.g., `VII` for 7).

#### **3. `intToRoman` Function**
- This function converts the given integer (`num`) into a Roman numeral.
- It breaks the number into its constituent parts:
  - Thousands place
  - Hundreds place
  - Tens place
  - Units place
- For each place, it calls the `cal` function to construct the corresponding Roman numeral string.
- Finally, it concatenates all parts to form the complete Roman numeral.

---

### **Time Complexity**
- The time complexity is **O(1)** because the input integer (`num`) is always constrained to a maximum value (in this case, 3999, as Roman numerals cannot represent numbers larger than this).
- The operations performed (e.g., breaking down the number, appending strings) are constant-time operations relative to the input size.

---

### **Space Complexity**
- The space complexity is **O(1)** because:
  - The `hashMap` is a fixed-size map with 7 key-value pairs.
  - The `result` string grows proportionally to the number of digits in the input, but since the input is bounded (up to 3999), the space used is constant.

---

### **Key Points**
1. **Efficiency**: The algorithm is efficient for converting integers to Roman numerals within the valid range (1 to 3999).
2. **Subtractive Notation**: It correctly handles subtractive notation for values like 4 (`IV`) and 9 (`IX`).
3. **Scalability**: The code is not scalable for numbers larger than 3999, as Roman numerals do not support such values.

---

### **Example Walkthrough**
#### Input: `num = 1994`
1. **Thousands Place**: `1994 / 1000 = 1` → `'M'`
2. **Hundreds Place**: `(1994 - 1000) / 100 = 9` → `'CM'`
3. **Tens Place**: `(1994 - 1000 - 900) / 10 = 9` → `'XC'`
4. **Units Place**: `1994 % 10 = 4` → `'IV'`
5. **Result**: `'M' + 'CM' + 'XC' + 'IV' = 'MCMXCIV'`

---

### **Final Answer**
- **Time Complexity**: O(1)
- **Space Complexity**: O(1)
- The code efficiently converts integers to Roman numerals using a combination of direct mapping and subtractive notation. It is well-suited for the constrained input range of Roman numerals.
* */
