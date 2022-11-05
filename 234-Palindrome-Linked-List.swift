/**
Given the head of a singly linked list, return true if it is a palindrome or false otherwise.

 

Example 1:


Input: head = [1,2,2,1]
Output: true
Example 2:


Input: head = [1,2]
Output: false
 

Constraints:

The number of nodes in the list is in the range [1, 105].
0 <= Node.val <= 9
 

Follow up: Could you do it in O(n) time and O(1) space?
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
    func isPalindrome(_ head: ListNode?) -> Bool {
         var list: [Int] = []
        var current: ListNode? = head
        while current != nil {
            list.append(current?.val ?? 0)
            current = current?.next
        }
        guard list.count > 0 else { return true }
        var index = 0 
        
        while index <= ((list.count - 1) / 2) {
            if list[index] != list[list.count - 1 - index] {
                return false
            }
            index += 1
        }
        return true
    }
}