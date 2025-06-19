//
//  KMPStringSearch.swift
//  LanguageImple
//
//  Created by liudong on 2022/11/23.
//

import Foundation

class KMPStringSearch {
//    need to transform T -> S for KMP string search
    
    // KMP PTABLE
//    S[0,Z[i]] == S[i-Z[i],i]
    
    /// T[0,z[i]] == T[i,i+z[i]]
    /// - Parameter src: <#src description#>
    /// - Returns: <#description#>
    func zFunction(_ src: [String], pattern: [String]) -> [Int] {
        var i = 0 // index in source string
        var j = 0 // index in pattern string
        let next = getNext(pattern)
        var result = [Int]()
        
        while i < src.count {
            for p in j ..< pattern.count {
                if i < src.count {
                    if src[i] == pattern[p] {
                        if p == pattern.count - 1 {
                            result.append(i - p)
                        }
                        i += 1
                        
                    } else {
                        j = next[j]
                        if j == -1 { // if the two string's first element not equal, so the two pivot should forward 1 positon.
                            j = 0
                        }
                        if p == 0 {
                            i += 1
                        }
                        break
                    }                    
                }
            }
        }
        return result
    }
    
    /// generate the next array, when T[i] != P[j], the index for j to point
    /// - Parameter p: pattern string
    /// - Returns: results
    func getNext(_ p: [String]) -> [Int] {
        var next = Array(repeating: -1, count: p.count)
        var j = 0
        var k = -1 // k denote the next[j]
        while j < p.count - 1 {
            if k == -1 || p[j] == p[k] {
                j += 1
                k += 1
                next[j] = k
            } else {
                k = next[k]
            }
        }
        return next
    }
}
