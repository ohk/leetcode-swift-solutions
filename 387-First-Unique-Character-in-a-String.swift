/**
Given a string s, find the first non-repeating character in it and return its index. If it does not exist, return -1.

 

Example 1:

Input: s = "leetcode"
Output: 0
Example 2:

Input: s = "loveleetcode"
Output: 2
Example 3:

Input: s = "aabb"
Output: -1
 

Constraints:

1 <= s.length <= 105
s consists of only lowercase English letters.
 */

class Solution {
    func firstUniqChar(_ s: String) -> Int {
        // [Character : [count, firstIndex]]
        var dict: [Character:[Int]] = [:]
        var index = s.count
        for (index, i) in s.enumerated() {
            dict[i] = [dict[i, default: [0,index]][0] + 1,dict[i, default: [0,index]][1]]
        }

        for (key, value) in dict {
            if value[0] == 1 {
                index = min(index, value[1])
            }
        }
        
        return index == s.count ? -1 : index
    }
}