//
//  LongCommonSequence.swift
//  LanguageImple
//
//  Created by liudong on 2022/12/13.
//

import Foundation

class LongCommonSequence {
    func test(str1: String, str2: String) -> String {
        let c = computeLongestCommonSubsequenceArray(str1: str1, str2: str2)
        return backtrack(c: c, str1: str1, str2: str2, str1Index: str1.count, str2Index: str2.count)
    }

    /// <#Description#>
    /// - Parameters:
    ///   - str1: <#str1 description#>
    ///   - str2: <#str2 description#>
    /// - Returns: <#description#>
    func computeLongestCommonSubsequenceArray(str1: String, str2: String) -> [[Int]] {
        var result = [[Int]](repeating: [Int](repeating: 0, count: str2.count+1), count: str1.count+1)
        for (i, rowCharacter) in str1.enumerated() {
            for (j, columnCharacter) in str2.enumerated() {
                if rowCharacter == columnCharacter {
                    result[i+1][j+1] = result[i][j]+1
                } else {
                    result[i+1][j+1] = max(result[i+1][j], result[i][j+1])
                }
            }
        }
        return result
    }

    /// <#Description#>
    /// - Parameters:
    ///   - c: <#c description#>
    ///   - str1: <#str1 description#>
    ///   - str2: <#str2 description#>
    ///   - str1Index: index in result matrix
    ///   - str2Index: index in result matrix . the row and column length is bigger than the str1 count and str2 count by 1 corresponding.
    /// - Returns: <#description#>
    func backtrack(c: [[Int]], str1: String, str2: String, str1Index: Int, str2Index: Int) -> String {
        if str1Index == 0 || str2Index == 0 {
            return ""
        }
        if str1[str1Index-1] == str2[str2Index-1] {
            return backtrack(c: c, str1: str1, str2: str2, str1Index: str1Index-1, str2Index: str2Index-1)+str1[str1Index-1]
        } else if c[str1Index-1][str2Index] > c[str1Index][str2Index-1] {
            return backtrack(c: c, str1: str1, str2: str2, str1Index: str1Index-1, str2Index: str2Index)
        } else {
            return backtrack(c: c, str1: str1, str2: str2, str1Index: str1Index, str2Index: str2Index-1)
        }
    }
}
