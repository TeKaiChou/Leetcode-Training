class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        # hashtable = {}
        # for i in range(len(nums)):
        #     hashtable[nums[i]] = i
        # for i in range(len(nums)):
        #     complement = target - nums[i]
        #     if complement in hashtable and hashtable[complement] != i:
        #         return[i, hashtable[complement]]
        
        seen = {}
        for i, v in enumerate(nums):
            complement = target - v
            if complement in seen:
                return [seen[complement], i]
            seen[v] = i
