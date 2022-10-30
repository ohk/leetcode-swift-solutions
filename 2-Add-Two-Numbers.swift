/**

You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

 

Example 1:


Input: l1 = [2,4,3], l2 = [5,6,4]
Output: [7,0,8]
Explanation: 342 + 465 = 807.
Example 2:

Input: l1 = [0], l2 = [0]
Output: [0]
Example 3:

Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
Output: [8,9,9,9,0,0,0,1]
 

Constraints:

The number of nodes in each linked list is in the range [1, 100].
0 <= Node.val <= 9
It is guaranteed that the list represents a number that does not have leading zeros.

 */

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    /**
    * My Solution 
    */
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var outputRoot: ListNode?
        var tmpVal = 0
        var outputNow: ListNode?
        
        func getTheResult(l1: ListNode?,l2: ListNode?) {
            var result: Int = tmpVal
            guard !(l1 == nil && l2 == nil) else { return }
            var v1 = l1?.val ?? 0
            var v2 = l2?.val ?? 0
            result += v1 + v2
            print(l1?.val,l2?.val,result)
            if result >= 10 {
                tmpVal = 1
                result = result - 10
            } else {
                tmpVal = 0
            }
            
            if let on = outputNow {
                on.next = ListNode(result)
                outputNow = on.next
            } else {
                outputRoot = ListNode(result)
                outputNow = outputRoot
            }
            getTheResult(l1: l1?.next, l2: l2?.next)
        }
        getTheResult(l1: l1, l2: l2)
        if tmpVal == 1 {
            outputNow?.next = ListNode(1)
        }
        return outputRoot
    }
    // Other Solution
    private var dig = 0
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 == nil && dig == 0 { return nil }
        let sum = (l1?.val ?? 0) + (l2?.val ?? 0) + dig
        dig = sum / 10
        return .init(sum % 10, addTwoNumbers(l1?.next, l2?.next))
    }
}