//
//  main.swift
//  LanguageImple
//
//  Created by liudong on 2022/10/20.
//

import Foundation

/// 寻找第k大的数
var a = [10, 0, 3, 9, 2, 14, 26, 27, 1, 5, 8, -1, 8 ]

//快速排序
//MyKthLargest.test()
//var myKthLargest = MyKthLargest()
//debugPrint(myKthLargest.quickSortLomuto(&a, low: 0, high: a.count-1))
//debugPrint(a)

/// 寻找第k小的数
//let kthSmallestResult = myKthLargest.findKthSmallest(&a, low: 0, high: a.count-1, k: 11)
//debugPrint(kthSmallestResult)

// 递归查找二叉树深度
let recursion = Recursion()
recursion.test()

// 动态规划
let dynamicProgramming = DynamicProgramming()
dynamicProgramming.test()
dynamicProgramming.test2()

let s = "kthSmallestResult = myKthLargest.findKthSmallest"
let pattern = "myKthLargest"
print(s.index(pattern))
var sameStrIndex = -1

if let targetIndex = s.indexByBoyerMoore(of: pattern) {
    let indexInt = s.distance(from: s.startIndex, to: targetIndex)
    print(indexInt)
    sameStrIndex = indexInt
}

let kmpSearch = KMPStringSearch()
let r = kmpSearch.zFunction(s.map{String($0)}, pattern:pattern.map{String($0)})
if sameStrIndex != -1 {
    assert(r.first! == sameStrIndex)
}
    
debugPrint("xxx")

let rabinKarp = RabinKarp()
//let rabinKarpSearchResult = rabinKarp.search(text: s, pattern: pattern)
//assert(rabinKarpSearchResult == sameStrIndex)



let longCommonSubSequence = LongCommonSequence()
let longCommonSubSequenceResult = longCommonSubSequence.computeLongestCommonSubsequenceArray(str1: "ABCBX", str2:    "ABDCAB")
print(longCommonSubSequenceResult)
print(longCommonSubSequence.test(str1: "ABCBX", str2:    "ABDCAB"))


