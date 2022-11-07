/**
Given a collection of numbers, nums, that might contain duplicates, return all possible unique permutations in any order.

 

Example 1:

Input: nums = [1,1,2]
Output:
[[1,1,2],
 [1,2,1],
 [2,1,1]]
Example 2:

Input: nums = [1,2,3]
Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
 

Constraints:

1 <= nums.length <= 8
-10 <= nums[i] <= 10
 */

class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var setArray : Set<[Int]> = []
        
        func rec(_ num: [Int],_ act: [Int]) {
            if num.count == 0 {
                setArray.insert(act)
            } else {
                for (index, i) in num.enumerated() {
                    var tmpNum = num
                    var tmpAct = act
                    tmpAct.append(i)
                    tmpNum.remove(at: index)
                    rec(tmpNum, tmpAct)
                }
            }
        }
        
        rec(nums, [])
        return Array(setArray)
    }
}