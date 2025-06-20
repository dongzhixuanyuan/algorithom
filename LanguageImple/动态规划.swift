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
    
    
    public func test2()  {
        let arr = [10,9,2,5,3,7,101,18]
        ascendingSubSequenceOfMaxLength(arr: arr)
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
//    题目描述
//    给定一个无序的整数数组，找到其中最长严格递增子序列的长度。子序列表示，其元素的顺序和原始数组中的顺序一致。
//
//    说明：
//
//    子序列不需要连续
//
//    严格递增指后一个数必须大于前一个数
//
//    示例
//    输入: [10,9,2,5,3,7,101,18]
//    输出: 4
//    解释: 最长递增子序列是 [2,3,7,101]，其长度为4
    
    func ascendingSubSequenceOfMaxLength(arr:[Int])->Int {
//    使用动态规划。假设数组dp[i]表示第i个数字的最长递增子序列。那么可以找出i之前的每个数字(j)的最长子序列，如果arr[i]>arr[j]就表示i可以接在j的最长子序列的后面dp[i] = dp[j]+1;如果arr[i]<=arr[j]，那么dp[i]=dp[j]
        //    输入: [10,9,2,5,3,7,101,18]
        let count = arr.count
        var dp:[Int] = Array(repeating: 1, count: count)
        for i in 0 ..< count {
            for j in 0 ..< i {
                if arr[i] > arr[j] {
                    dp[i] = max(dp[j]+1, dp[i])
                } else {
                    dp[i] = dp[j]
                }
            }
        }
        let rr = dp.max()!
        print(rr)
        return rr
                
    }
    
}
