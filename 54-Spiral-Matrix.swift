/**

https://leetcode.com/problems/spiral-matrix/

Given an m x n matrix, return all elements of the matrix in spiral order.

Example 1:

Input: matrix = [
    [1,2,3],
    [4,5,6],
    [7,8,9]
]
Output: [1,2,3,6,9,8,7,4,5]

Example 2:

Input: matrix = [
    [1,2,3,4],
    [5,6,7,8],
    [9,10,11,12]
]
Output: [1,2,3,4,8,12,11,10,9,5,6,7]

Constraints:

m == matrix.length
n == matrix[i].length
1 <= m, n <= 10
-100 <= matrix[i][j] <= 100

Solution:

The idea is to start from the top left corner and move in a clockwise direction.
The first move is to move from top to right.
The second move is to move from right to bottom.
The third move is to move from bottom to left.
The fourth move is to move from left to top.
Loop is continued until the result array element count is equal to the matrix element count.

*/


class Solution {
	func spiralOrder(_ matrix: [[Int]]) -> [Int] {
		var result: [Int] = []
		let rowCount = matrix.count
		let columnCount: Int = rowCount > 0 ? matrix[0].count : 0
		let totalResultCount: Int = columnCount * rowCount
		var topPointer: Int = 0
		var rightPointer: Int = columnCount
		var leftPointer: Int = 0
		var bottomPointer: Int = rowCount

		/**
		 * First check if the matrix is empty.
		 * If it is empty, return an empty array.
		 * If it is not empty, then start the loop.
		 * My first condition is to check if the top pointer is less than the bottom pointer and the left pointer is less than the right pointer.
		 * If both of these conditions are true, then we can move in the clockwise direction.
		 */

		if totalResultCount > 0 {
			while topPointer < bottomPointer && leftPointer < rightPointer {

				for i in stride(from: leftPointer, to: rightPointer, by: 1) {
					result.append(matrix[topPointer][i])
				}
				topPointer += 1

				/**
				 * After we have moved from top to right, we need to move from right to bottom.
				 * We need to check if total result count is equal to the matrix elements count. If it is equal, then we can stop the loop.
				 */
				if result.count != totalResultCount {
					for i in stride(from: topPointer, to: bottomPointer, by: 1) {
						result.append(matrix[i][rightPointer - 1])
					}
					rightPointer -= 1
				}

				/**
				 * After we have moved from right to bottom, we need to move from bottom to left.
				 * We need to check if total result count is equal to the matrix elements count. If it is equal, then we can stop the loop.
				 */
				if result.count != totalResultCount {
					for i in stride(from: rightPointer - 1, to: leftPointer, by: -1) {
						result.append(matrix[bottomPointer - 1][i])
					}
					bottomPointer -= 1
				}

				/**
				 * After we have moved from bottom to left, we need to move from left to top.
				 * We need to check if total result count is equal to the matrix elements count. If it is equal, then we can stop the loop.
				 */
				if result.count != totalResultCount {
					for i in stride(from: bottomPointer, to: topPointer - 1, by: -1) {
						result.append(matrix[i][leftPointer])
					}
					leftPointer += 1
				}
			}
			return result
		} else {
			return result
		}
	}
}
