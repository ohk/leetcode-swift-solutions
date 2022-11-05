/**
Given an integer numRows, return the first numRows of Pascal's triangle.

In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:


 

Example 1:

Input: numRows = 5
Output: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
Example 2:

Input: numRows = 1
Output: [[1]]
 

Constraints:

1 <= numRows <= 30
 */

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        guard numRows > 1 else { return [[1]]}
        guard numRows > 2 else { return [[1],[1,1]]}
        var result : [[Int]] = [[1],[1,1]]
        
        for i in stride(from: 2, to: numRows, by: 1) {
            result.append([1])
            for t in stride(from: 1, to: i, by: 1) {
                result[i].append(result[i - 1][t] + result[i - 1][t - 1])
            }
            result[i].append(1)
        }
        
        return result
    }
}