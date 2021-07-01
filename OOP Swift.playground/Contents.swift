import UIKit

// Turing Tests
func calPoints(_ ops: [String])  -> Int {
    var sum = 0
    var elements = [Int]()
    for i in ops {
        
        if let number = Int(i) {
            elements.append(number)
        } else {
            if i == "C" {
                elements.removeLast()
            } else if i == "D" {
                let last = elements.last!
                let new = last * 2
                elements.append(new)
            } else if i == "+" {
                let previous1 = elements[elements.count-1]
                let previous2 = elements[elements.count-2]
                let new = previous1 + previous2
                elements.append(new)
            }
        }
    }
    
    sum = elements.reduce(0, +)
    
    return sum
    
}


func sumPoints(_ numbers: [Int])  -> Int {
    var sum = 0
    
    for numer in numbers {
        if numbers.contains(numer+1) {
            sum += 1
        }
    }
    
    return sum
}
