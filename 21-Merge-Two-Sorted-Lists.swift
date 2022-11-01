/**

You are given the heads of two sorted linked lists list1 and list2.

Merge the two lists in a one sorted list. The list should be made by splicing together the nodes of the first two lists.

Return the head of the merged linked list.

 

Example 1:


Input: list1 = [1,2,4], list2 = [1,3,4]
Output: [1,1,2,3,4,4]
Example 2:

Input: list1 = [], list2 = []
Output: []
Example 3:

Input: list1 = [], list2 = [0]
Output: [0]
 

Constraints:

The number of nodes in both lists is in the range [0, 50].
-100 <= Node.val <= 100
Both list1 and list2 are sorted in non-decreasing order.

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


// Why this is running faster than other ???

class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var l1LastNode: ListNode? = list1
        var l2LastNode: ListNode? = list2
        var resultRoot: ListNode? = nil
        var activeRoot: ListNode? = nil
        while l1LastNode != nil || l2LastNode != nil {
            var l1Val = l1LastNode?.val ?? Int.max
            var l2Val = l2LastNode?.val ?? Int.max
            
            if l1Val < l2Val {
                if resultRoot != nil {
                    activeRoot!.next = ListNode(l1Val) 
                    activeRoot = activeRoot?.next
                } else {
                    resultRoot = ListNode(l1Val)
                    activeRoot = resultRoot
                }
                l1LastNode = l1LastNode?.next
            } else {
                if resultRoot != nil {
                    activeRoot!.next = ListNode(l2Val)
                    activeRoot = activeRoot?.next
                } else {
                    resultRoot = ListNode(l2Val)
                    activeRoot = resultRoot
                }
                l2LastNode = l2LastNode?.next
            }
            
        }
        
        return resultRoot
    }
}


class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var l1LastNode: ListNode? = list1
        var l2LastNode: ListNode? = list2
        var resultRoot: ListNode? = ListNode()
        var activeRoot: ListNode? = resultRoot
        
        while l1LastNode != nil || l2LastNode != nil {
            var l1Val = l1LastNode?.val ?? Int.max
            var l2Val = l2LastNode?.val ?? Int.max
            
            if l1Val < l2Val {
                activeRoot!.next = ListNode(l1Val) 
                l1LastNode = l1LastNode?.next
            } else {
                activeRoot!.next = ListNode(l2Val)
                l2LastNode = l2LastNode?.next
            }
            
            activeRoot = activeRoot?.next
            
        }
        return resultRoot?.next
    }
}