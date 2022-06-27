/**

https://leetcode.com/problems/find-leaves-of-binary-tree/

Given the root of a binary tree, collect a tree's nodes as if you were doing this:

Collect all the leaf nodes.
Remove all the leaf nodes.
Repeat until the tree is empty.


Example 1:


Input: root = [1,2,3,4,5]
Output: [[4,5,3],[2],[1]]
Explanation:
[[3,5,4],[2],[1]] and [[3,4,5],[2],[1]] are also considered correct answers since per each level it does not matter the order on which elements are returned.
Example 2:

Input: root = [1]
Output: [[1]]


Constraints:

The number of nodes in the tree is in the range [1, 100].
-100 <= Node.val <= 100

Solution:
We go to the deepest level of the tree. The deepest nodes are the 0 level nodes.
After we add the values of the deepest nodes to the first array of the result array.
We then return the level of the deepest nodes. Compare the left and right level of the nodes.
Max value is the level of the current node. And we check the result array has the array for the current level.
If it does not have the array, then we create the array and add the current node value to it.
 */


/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func findLeaves(_ root: TreeNode?) -> [[Int]] {
        var result: [[Int]] = []
        checkTheLevel(node: root, result: &result)
        return result
    }

    func checkTheLevel(node: TreeNode?, result: inout [[Int]]) -> Int {
        // If the node is nil, then return 0
        guard let node = node else { return 0 }
        // Check the node is the leaf node or not. If it is leaf node then add the node value to the result array. Then return the level of the node.
        if node.right == nil && node.left == nil {
            if result.count > 0 {
                result[0].append(node.val)
            } else {
                result.append([node.val])
            }
            return 1
        } else {
            let left = checkTheLevel(node: node.left, result: &result)
            let right = checkTheLevel(node: node.right, result: &result)
            let maxVal = max(left,right)

            if result.count - 1 >= maxVal {
                result[maxVal].append(node.val)
            } else {
                result.append([node.val])
            }
            return maxVal + 1
        }
    }
}