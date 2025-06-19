//
//  RabinKarp.swift
//  LanguageImple
//
//  Created by liudong on 2022/12/12.
//

import Foundation

// transform the single Character to Int reprentation in unicode scalar view
public extension String.Element {
//    获取string中的第一个字符的unicode scalar值
    var asInt:Int {
        let s = String(self).unicodeScalars
        return Int(s[s.startIndex].value)
    }
}


struct Constants {
    static let hashMultiplier = 123
}
// define ** as the power func operator
precedencegroup PowerPrecedence {higherThan:MultiplicationPrecedence}
infix operator ** :PowerPrecedence

func ** (radix:Int,power:Int) -> Int {
    return Int(pow(Double(radix),Double(power)))
}

func ** (radix:Double,power:Int) -> Double {
    return pow(radix, Double(power))
}

public class RabinKarp {
    
    
    func rabinKarpTest()  {
        let a = "a"
        a.forEach { c in
            print(c.asInt)
        }
        
        let flag = "xxx🇵🇷"
        print(flag.unicodeScalars.count)
        ///     for c in flag {
        ///         print(c)
        ///     }
        
        
        
    }
    
    public func search(text:String,pattern:String) -> Int {
        let patternArray = pattern.compactMap { c in
            c.asInt
        }
        let textArray = text.compactMap { c in
            c.asInt
        }
        if textArray.count < patternArray.count {
            return -1
        }
        let patternHash = hash(array: patternArray)
        var endIdx = patternArray.count - 1
        let firstChars = Array(textArray[0...endIdx])
        let firstHash = hash(array: firstChars)
        if patternHash == firstHash {
            if firstChars == patternArray {
                return 0
            }
        }
        var preHash = firstHash
//        now slide the window across the text to be searched.
        for idx in 1...(textArray.count - patternArray.count){
            endIdx = idx + (patternArray.count-1)
            let window = Array(textArray[idx...endIdx])
            let windowHash = nextHash(preHash: preHash,
                                      dropped: textArray[idx-1],
                                      added: textArray[endIdx],
                                      patternSize: patternArray.count - 1)
            if windowHash == patternHash {
                if patternArray == window {
                    return idx
                }
            }
            preHash = windowHash
            
        }
        return -1
        
    }
    
    /// custom hash function for array
    /// - Parameter array: <#array description#>
    /// - Returns: <#description#>
    public func hash(array:Array<Int>) -> Double {
        
        var total:Double = 0
        var exponent = array.count - 1
        for i in array {
            total += Double(i) * (Double(Constants.hashMultiplier) ** exponent)
            exponent -= 1
        }
        return Double(total)
    }
    
    
    /// compute the next array hash based on the previous hash array.
    /// - Parameters:
    ///   - preHash: <#preHash description#>
    ///   - dropped: <#dropped description#>
    ///   - added: <#added description#>
    ///   - patternSize: <#patternSize description#>
    /// - Returns: <#description#>
    func nextHash(preHash:Double,dropped:Int,added:Int,patternSize:Int) -> Double {
        let oldHash = preHash  - (Double(dropped) * (Double(Constants.hashMultiplier) ** patternSize))
        return Double(Constants.hashMultiplier) * oldHash + Double(added) // multiplate Constants.hashMultiplier because the element in array move forward one bit.
        
    }
    
    
    
    
}


