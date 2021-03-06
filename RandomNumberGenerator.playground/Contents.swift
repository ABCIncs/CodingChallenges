import Foundation

// MARK: - m > 0 (the modulus is positive),
// MARK: - 0 < a < m (the multiplier is positive but less than the modulus),
// MARK: - 0 ≤ b < m (the increment is non negative but less than the modulus), and
// MARK: - 0 ≤ X0 < m (the seed is non negative but less than the modulus).

func getRandomNumbers(
    seed x0: Int,
    multiplier a: Int,
    increment b: Int,
    modulus m: Int,
    desiredArraylength n: Int) -> [Int] {
    
    var results = [Int]()
    
    var xo = x0
    for _ in 0..<n {
        print(xo)
        xo = ( a * xo + b) % m
        
        results.append(xo)
    }
    
    return results
}


