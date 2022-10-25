# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def middleNode(self, head: Optional[ListNode]) -> Optional[ListNode]:
        slow = fast = head
        while fast and fast.next: #add first since judge fast first (with None value) can solve the 'nonetype doesn't have next attribute'
            slow = slow.next
            fast = fast.next.next
        return slow
    
