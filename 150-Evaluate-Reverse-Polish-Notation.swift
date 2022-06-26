/**


https://leetcode.com/problems/evaluate-reverse-polish-notation/


Evaluate the value of an arithmetic expression in Reverse Polish Notation.

Valid operators are +, -, *, and /. Each operand may be an integer or another expression.

Note that division between two integers should truncate toward zero.

It is guaranteed that the given RPN expression is always valid. That means the expression would always evaluate to a result, and there will not be any division by zero operation.


Example 1:

Input: tokens = ["2","1","+","3","*"]
Output: 9
Explanation: ((2 + 1) * 3) = 9
Example 2:

Input: tokens = ["4","13","5","/","+"]
Output: 6
Explanation: (4 + (13 / 5)) = 6
Example 3:

Input: tokens = ["10","6","9","3","+","-11","*","/","*","17","+","5","+"]
Output: 22
Explanation: ((10 * (6 / ((9 + 3) * -11))) + 17) + 5
= ((10 * (6 / (12 * -11))) + 17) + 5
= ((10 * (6 / -132)) + 17) + 5
= ((10 * 0) + 17) + 5
= (0 + 17) + 5
= 17 + 5
= 22


Constraints:

1 <= tokens.length <= 104
tokens[i] is either an operator: "+", "-", "*", or "/", or an integer in the range [-200, 200].


Solution 1:
First we need to create a result array from the input array. Because we manipulate the array for storing the result.
After that we create while loop until the result array elements count is equal to 1.
In while loop we check the 3 index. First index is the operand. Second index is the operand. Third index is the operator.
If this indexes are is valid then we calculate the temporary result. After this calculation we remove the safeIndex + 1 and safeIndex + 2 elements from the result array. Then we change the safeIndex element value with the temporary result.
After this changes we subtract 1 from safeIndex if it is greater than 0. And loop again.
If the indexes are not valid then we add 1 to safeIndex and loop again.
When loop is finished we return the first element of the result array.

Solution 2:
First we create a stack to store the operands.
After that we check every element of the input array.
If the element is an integer then we push it to the stack.
If the element is an operator then we pop the last two elements from the stack and calculate the result.
Then we push the result to the stack.
After that we return the last element of the stack.
 */

// Solution 1
class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var safeIndex = 0
        var resultArray = tokens
        // Check resultArray elements count is equal to 1
        while resultArray.count != 1 {
            let isOperation = Int(resultArray[safeIndex + 2]) // operator
            let num1 = Int(resultArray[safeIndex + 1]) // operand
            let num2 = Int(resultArray[safeIndex]) // operand
            // check the indexes are valid
            if let num1 = num1, let num2 = num2, isOperation == nil && num1 != nil && num2 != nil {
                let operation = resultArray[safeIndex + 2]
                var tmp = 0
                switch operation {
                    case "+":
                        tmp = num2 + num1
                    case "-":
                        tmp = num2 - num1
                    case "/":
                        tmp = num2 / num1
                    case "*":
                        tmp = num2 * num1
                    default:
                        tmp = 0
                }

                // remove the second operand and operator from the result array
                resultArray.remove(at: safeIndex + 2)
                resultArray.remove(at: safeIndex + 1)

                // change the first operand with the temporary result
                resultArray[safeIndex] = String(tmp)

                // if the safeIndex is greater than 0 then we subtract 1 from it
                if safeIndex > 0 {
                    safeIndex -= 1
                } else {
                    safeIndex = 0
                }
            } else {
                safeIndex += 1
            }
        }
        
        return Int(resultArray[0])  ?? 0
    }
}


// Solution 2
class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()
        for token in tokens {
            // if the token is an integer then we push it to the stack
            if let num = Int(token) {
                stack.append(num)
            } 
            // if the token is an operator then we pop the last two elements from the stack and calculate the result
            else {
                let num2 = stack.popLast() ?? 0
                let num1 = stack.popLast() ?? 0
                switch token {
                    case "+":
                        stack.append(num1 + num2)
                    case "-":
                        stack.append(num1 - num2)
                    case "*":
                        stack.append(num1 * num2)
                    case "/":
                        stack.append(num1 / num2)
                    default:
                        stack.append(num1)
                }
            }
        }
        return stack.first ?? 0
    }
}