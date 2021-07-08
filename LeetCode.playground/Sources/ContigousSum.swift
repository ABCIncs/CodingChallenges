import Foundation


// Function to determine if array arr
// can be split into three equal sum sets.
func findSplit(_ arr: [Int]) -> Bool
{
    // variable to store prefix sum
    var preSum = 0
    
    // variables to store indices which
    // have prefix sum divisible by S/3.
    var ind1 = -1
    var ind2 = -1
    
    // variable to store sum of entire array.
    let S: Int;
    
    // Find entire sum of the array.
    S = arr.reduce(0, +)
    
    // Check if array can be split in
    // three equal sum sets or not.
    if(S % 3 != 0) { return false }
    
    // Variables to store sum S/3
    // and 2*(S/3).
    let S1 = S / 3
    let S2 = 2 * S1
    
    
    for i in 0..<arr.count {
        preSum += arr[i]
        
        // If prefix sum is equal to S/3
        // store current index.
        if (preSum == S1 && ind1 == -1) {
            ind1 = i
        }
        
        // If prefix sum is equal to 2*(S/3)
        // store current index.
        else if(preSum == S2 && ind1 != -1)
        {
            ind2 = i
            // Come out of the loop as both the
            // required indices are found.
            break
        }
    }
    
    // If both the indices are found
    // then print them.
    if (ind1 != -1 && ind2 != -1)
    {
        print("(" + ind1.description + ", " + ind2.description + ")");
        return true;
    }
    
    // If indices are not found return 0.
    return false;
}

print(findSplit([ 1, 3, 4, 0, 4 ]))
