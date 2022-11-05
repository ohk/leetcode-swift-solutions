/**
Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.

 

Example 1:

Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
Output: [[1,6],[8,10],[15,18]]
Explanation: Since intervals [1,3] and [2,6] overlap, merge them into [1,6].
Example 2:

Input: intervals = [[1,4],[4,5]]
Output: [[1,5]]
Explanation: Intervals [1,4] and [4,5] are considered overlapping.
 

Constraints:

1 <= intervals.length <= 104
intervals[i].length == 2
0 <= starti <= endi <= 104
 */

class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard intervals.count > 1 else { return intervals }
        var sorted = intervals.sorted { ($0[0] ) < ($1[0] ) }
        var result: [[Int]] = []
        var lastInterval: [Int] = sorted[0]
        
        for i in sorted[1...] {
            if lastInterval[1] >= i[0] {
                lastInterval[1] = max(lastInterval[1],i[1])
            } else {
                result.append(lastInterval)
                lastInterval = i
            }
        }
        
        result.append(lastInterval)
        
        return result
    }
}