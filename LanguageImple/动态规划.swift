//
//  动态规划.swift
//  LanguageImple
//
//  Created by Dong Liu on 2025/6/19.
//

import Foundation


public class DynamicProgramming {


    public func test() {
        let matrix = [
            [1,3,1],
            [1,5,1],
            [4,2,1]
        ]
        shortestDistance(matrix: matrix)
    }
    
    func shortestDistance(matrix:[[Int]]){
        
        
        let rowCount = matrix.count
        let columnCount = matrix.first!.count
        var dp = Array(repeating: Array(repeating: 0, count: columnCount), count: rowCount)
//        dp[i][j]代表从起点到[i,j]的最短路径
//        状态转移方程：
//        dp[i][j] = min(dp[i-1][j],dp[i][j-1]) + matrix[i][j]
        for j in 0..<columnCount {
            if j == 0 {
                dp[0][j] = matrix[0][j]
            } else {
                dp[0][j] = dp[0][j-1] + matrix[0][j]
            }
        }
        for i in 0..<rowCount {
            if i == 0 {
                dp[i][0] = matrix[i][0]
            } else {
                dp[i][0] = dp[i-1][0] + matrix[i][0]
            }
        }
        for i in 1..<rowCount {
            for j in 1..<columnCount {
                dp[i][j] = min(dp[i-1][j], dp[i][j-1]) + matrix[i][j]
            }
        }
        let rr = dp.map { row in
            row.map { value in
                String(value)
            }.joined(separator: ",")
        }.joined(separator: "\\")
        print("动态规划："+rr)
    }
    
    
}
