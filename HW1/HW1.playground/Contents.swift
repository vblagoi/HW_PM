import UIKit

// 1.1 Factorial___________________________________
func FactorialByRecursion(number: Int) -> Int? {

    guard number >= 0 else { return nil }

    if number > 1 {
        if let factorial = FactorialByRecursion(number: number - 1) {
            return number * factorial
        }
        
    } else {
        return 1
    }
    return nil
}


func FactorialByIteration(number: Int) -> Int? {

    guard number >= 0 else { return nil }

    var factorial: Int = 1

    for item in 1...number {

        factorial = factorial * item
    }
    return factorial
}

FactorialByRecursion(number: 5)
FactorialByIteration(number: 4)


// 1.2 Output Fibonaci sequence till specified N
func FibonaciOutput (number: Int) {

    guard number > 0 else { return }

    var first: Int = 0
    var second: Int = 1

    for i in 1...number {

        print("\(i)) \(second)")

        let third: Int = first + second

        first = second
        second = third

    }

}

FibonaciOutput(number: 50)

// 1.3 Find N digit of Pi number fraction
func DigitOfPiNumberFraction(number: Int) -> Int? {
    
    guard number > 0 && number < 16 else { return nil }
    
    let pi = String(Double.pi)
    let index = pi.index(pi.startIndex, offsetBy: number + 1)
    
    if let digit = Int(String(pi[index])) {
        return digit
    }
    return nil
}

String(Double.pi)
DigitOfPiNumberFraction(number: 4)
