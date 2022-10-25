class ListNode():
    def __init__(self, key, next):
        self.key = key
        self.next = next

class MyHashSet:

    def __init__(self):
        self.size = 10000
        self.bucket = [None]*self.size
        return
    
    def add(self, key: int) -> None:    
        bucket_code = key%self.size
        cur = self.bucket[bucket_code]
        
        if not cur:
            self.bucket[bucket_code] = ListNode(key, None)
            return
        while cur:
            if cur.key == key:
                return
            if not cur.next:
                cur.next = ListNode(key, None)
                return 
            cur = cur.next
        
        return
        
    def remove(self, key: int) -> None:
        bucket_code = key%self.size
        cur = self.bucket[bucket_code]
        if not cur:
            return
        if cur.key == key:
            self.bucket[bucket_code] = cur.next
            return
        while cur.next:
            if cur.next.key == key:
                cur.next = cur.next.next
                return
            cur = cur.next
        
        return        

    def contains(self, key: int) -> bool:
        bucket_code = key%self.size
        cur = self.bucket[bucket_code]
        while cur:
            if cur.key == key:
                return True
            cur = cur.next
        return False


# Your MyHashSet object will be instantiated and called as such:
# obj = MyHashSet()
# obj.add(key)
# obj.remove(key)
# param_3 = obj.contains(key)
