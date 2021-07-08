import UIKit


func reverse(_ x: Int) -> Int {
    if x >= 0 {
        return Int(Int32(String(String(x).reversed())) ?? 0)
    }
    else {
        return -Int(Int32(String(String(-x).reversed())) ?? 0)
    }
}


print(reverse(123))
