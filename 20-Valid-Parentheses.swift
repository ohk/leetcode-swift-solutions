/**
 
Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

An input string is valid if:

Open brackets must be closed by the same type of brackets.
Open brackets must be closed in the correct order.
Every close bracket has a corresponding open bracket of the same type.
 

Example 1:

Input: s = "()"
Output: true
Example 2:

Input: s = "()[]{}"
Output: true
Example 3:

Input: s = "(]"
Output: false
 

Constraints:

1 <= s.length <= 104
s consists of parentheses only '()[]{}'.

 */

class Solution {
    func isValid(_ s: String) -> Bool {
        var stack:[Character] = []
        
        var hashMap : [Character:Character] = [
            ")" : "(",
            "]" : "[",
            "}" : "{"
        ]
        
        for i in s {
            if i == "(" || i == "[" || i == "{" {
                stack.append(i)
            } else {
                if stack.count == 0 { return false }
                var lastElement = stack.removeLast()
                if hashMap[i, default: Character("")] != lastElement {
                    return false
                }
            }
        }
        
        return stack.count == 0 ? true : false
    }
}