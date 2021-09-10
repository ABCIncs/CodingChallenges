import UIKit

/// 1. Simple algorithm for the students grades  challenge
func gradingStudents(arrays:[Int]) -> [Int] {
    var arr = [Int]()
    
    if 1 <= arrays.count && arrays.count <= 60 {
        let interval = 0...100
        for n in arrays {
            for inter in interval {
                if inter % 5 == 0 && inter > n && inter - n < 3 {
                    if 0 <= n && n <= 100 {
                        if n < 38 {
                            arr.append(n)
                        } else  {
                            arr.append(inter)
                        }
                    }
                } else if inter % 5 == 0 && inter > n && inter - n == 3 {
                    arr.append(n)
                }
            }
        }
    }
    return arr
}
/// 2. Simple algorithm for counting valleys challenge
func countingValleys(n:Int, str:String) -> Int{
    let upperStr = str.uppercased()
    var Us = 0
    var Ds = 0
    var valleys = 0
    let array = Array(upperStr)
    if 2 <= n && n <= Int(powf(10, 6)){
        for i in array {
            if i == "U" {
                Us += 1
            } else if i == "D" {
                Ds += 1
            }
            if array[0] == array[array.count-1] {
            }
        }
    }
    valleys  = Ds + Us
    return valleys / n
}

/// 3. Simple algorithm for between Numbers challenge
func betweenNumbers(of first: [Int], and second: [Int]) -> Int {
    
    func greatestCommonDivisor(_ a: Int, _ b: Int) -> Int {
        
        var result: (a: Int, b: Int, d: Int) = (a, b, 0)
        
        while (result.a % 2 == 0) && (result.b % 2 == 0) {
            result = (result.a / 2, result.b / 2, result.d + 1)
        }
        while (result.a != result.b) {
            if (result.a % 2 == 0) { result.a = result.a / 2 }
            else if (result.b % 2 == 0) { result.b = result.b / 2 }
            else if result.a > result.b { result.a = (result.a - result.b) / 2 }
            else { result.b = (result.b - result.a) / 2 }
        }
        return result.a * Int(pow(2.0, Double(result.d)))
    }
    
    func greatestCommonDivisor(_ array: [Int]) -> Int {
        var result: Int = array[0]
        for integer in array {
            result = greatestCommonDivisor(result, integer)
        }
        return result
    }
    
    func leastCommonMultiple(_ a: Int, _ b: Int) -> Int {
        return (a * b)/greatestCommonDivisor(a, b)
    }
    
    func leastCommonMultiple(_ array: [Int]) -> Int {
        var result: Int = array[0]
        for integer in array {
            result = (result * integer)/greatestCommonDivisor(result, integer)
        }
        return result
    }
    
    let LCM = leastCommonMultiple(first)
    let GCD = greatestCommonDivisor(second)
    var result: [Int] = []
    if LCM <= GCD{
        for n in 1...GCD/LCM {
            if GCD % (LCM * n) == 0{
                result.append(LCM * n)
            }
        }
    }
    let number = result.count
    return number
}

/// 4. Simple algorithm equivalent to the between Numbers challenge from HackerRank
func getTotalX(a: [Int], b: [Int]) -> Int {
    var intersa = [Int]()
    var intersb = [Int]()
    var inters = [Int]()
    var indexa = 1
    var indexb = 1
    let range = a.min()!...b.max()!
    var finalb = [Int]()
    var finala = [Int]()
    
    if (0...10).contains(a.count) && (0...10).contains(b.count) {
        
        for number in a {
            for element in range {
                if element.isMultiple(of:number) && element.isMultiple(of: a[indexa]) {
                    intersa.append(element)
                    if indexa < a.count - 1 { indexa += 1 }
                }
            }
        }
        let mappedItema = intersa.map { ($0, 1) }
        let counta = Dictionary(mappedItema, uniquingKeysWith: +)
        for (key, value) in counta {
            if value >= a.count {
                finala.append(key)
            }
        }
        
        for n in b {
            for e in finala {
                indexb  = b.count - 1
                if n % e == 0 && indexb < b.count {
                    if b[indexb] % e == 0 {
                        intersb.append(e)
                        indexb -= 1
                    }
                }
            }
        }
        
        let mappedItemb = intersb.map { ($0, 1) }
        let countb = Dictionary(mappedItemb, uniquingKeysWith: +)
        for (key, value) in countb {
            if value >= b.count { finalb.append(key) }
        }
        inters = finala.filter(finalb.contains)
    }
    return inters.count
    
}

/// 5. A simple algorithm for password validator
func validatePassword(password: String) -> Bool {
    
    let datas = Array(password)
    var count = 0
    var number = 0
    if datas.count >= 7 {
        for data in datas {
            let char = String(data)
            if char >= "0" && char <= "9" {
                number += 1
            } else if char == "!" || char == "@" || char == "#" || char == "$" || char == "%" || char == "&" || char == "*" {
                count += 1
            }
        }
    }
    if number >= 2 && count >= 2 {
        return true
    } else {
        return false
    }
}


// 6. A simple algorithm to inverse an integer without using a loop
func reverseIntegers(_ number: Int, _ result: String) -> Int {
    
    let quotient = number / 10
    let remainder = number % 10;
    
    var result = result
    result += String(remainder);
    return quotient >= 10 ? reverseIntegers(quotient, result) : Int(result + String(quotient))!
}
//print(reverseIntegers(321, ""))
