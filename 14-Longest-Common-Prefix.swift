/**

Write a function to find the longest common prefix string amongst an array of strings.

If there is no common prefix, return an empty string "".

 

Example 1:

Input: strs = ["flower","flow","flight"]
Output: "fl"
Example 2:

Input: strs = ["dog","racecar","car"]
Output: ""
Explanation: There is no common prefix among the input strings.
 

Constraints:

1 <= strs.length <= 200
0 <= strs[i].length <= 200
strs[i] consists of only lowercase English letters.

 */

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 0 else { return "" }
        var prefix: String = ""
        var minLength: Int = Int.max
        var newStrings: [[Character]] = []
        
        for str in strs {
            minLength = min(minLength,str.count)
            newStrings.append(Array(str))
        }
        
        if minLength == 0 {
            return ""
        }
        
        for i in 0...(minLength - 1) {
            var firstChar = ""
            for t in 0...(strs.count - 1) {
                if firstChar == "" {
                    firstChar = String(newStrings[t][i])
                } else if firstChar != String(newStrings[t][i]) {
                    return prefix
                }
            }
            prefix = prefix + firstChar
        }
        return prefix
    }
}