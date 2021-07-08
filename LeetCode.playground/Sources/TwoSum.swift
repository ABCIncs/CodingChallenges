import Foundation


// From https://leetcode.com/problems/two-sum/submissions/

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var hashMap = [Int: Int]()
    for (i, value) in nums.enumerated() {
        if let index = hashMap[target-value] {
            return [index, i]
        } else {
            hashMap[value] = i
        }
    }
    return []
}


//print(twoSum([2,11,7,15], 26))

public class Love {
    
}
