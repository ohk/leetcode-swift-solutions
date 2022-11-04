/**
Given an integer array nums where the elements are sorted in ascending order, convert it to a height-balanced binary search tree.

 

Example 1:


Input: nums = [-10,-3,0,5,9]
Output: [0,-3,9,-10,null,5]
Explanation: [0,-10,5,null,-3,null,9] is also accepted:

Example 2:


Input: nums = [1,3]
Output: [3,1]
Explanation: [1,null,3] and [3,1] are both height-balanced BSTs.
 

Constraints:

1 <= nums.length <= 104
-104 <= nums[i] <= 104
nums is sorted in a strictly increasing order.

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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
      func createBSTRecursive(_ leftIdx: Int, _ rightIdx: Int) -> TreeNode? {
            if leftIdx > rightIdx {
                return nil
            }
            if leftIdx == rightIdx {
                return TreeNode(nums[leftIdx])
            }
            
            let middleIdx = (leftIdx + rightIdx) / 2
            let val = nums[middleIdx]
            
            let tree = TreeNode(val)
            tree.left = createBSTRecursive(leftIdx, middleIdx - 1)
            tree.right = createBSTRecursive(middleIdx + 1, rightIdx)
            
            return tree
        }
        
        return createBSTRecursive(0, nums.count - 1)
    }
}