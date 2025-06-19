import Foundation

public class MyKthLargest {
    public init() {
        print("MyKthLargest init")
    }

//
    public func findKthSmallest<T: Comparable>(_ a: inout [T], low: Int, high: Int, k: Int) -> T {
        let p = partitionLomuto(&a, low, high)
        if p == k {
            return a[p]
        } else if p < k {
            return findKthSmallest(&a, low: p + 1, high: high, k: k)
        } else {
            return findKthSmallest(&a, low: low, high: p - 1, k: k)
        }
    }

//    put pivot in front of array, and the end index first move, then start index move.
    public func sortedIndexOfTargetNumber<T: Comparable>(_ a: inout [T], _ target: T) -> Int? {
        guard !a.isEmpty else {
            return nil
        }
        var low = 0
        var high = a.count - 1

        while low < high {
            while a[high] > target {
                high -= 1
            }
            while a[low] < target {
                low += 1
            }
            if low >= high {
                return low
            }
            a.swapAt(low, high)
        }
        return low
    }
    // 关键总结
    // array[j] <= pivot 时交换 i 和 j，是为了将小元素“收集”到左侧。
    // i 的作用是 标记下一个可存放小元素的位置，逐步向右推进。
    // 最终 i 的位置就是基准的正确位置。
    /// [0...i] values less than or equal to pivot
    /// [i+1...j-1] values bigger than pivot
    /// [j...high-1] values that not looked at
    /// [high] the pivot
    public func partitionLomuto<T: Comparable>(_ arr: inout [T], _ low: Int, _ high: Int) -> Int {
        let pivot = arr[high]
        var i = low
//        j for loop every element in array.
//        i point the first element which bigger than pivot.
        for j in low ..< high { // from low to (high-1), because 'high' is pivot
            if arr[j] <= pivot {
                // 为什么交换？
                // 目的：通过交换保证 i 的左侧始终是已处理的 ≤ pivot 元素。
                // 效果：每次发现一个 ≤ pivot 的元素，就把它放到 i 的位置，并让 i 指向下一个位置，逐步扩展左侧区域。
                arr.swapAt(i, j)
                i += 1
            }
        }
        arr.swapAt(i, high)
        return i
    }

    public func quickSortLomuto<T: Comparable>(_ arr: inout [T], low: Int, high: Int) {
        if low < high {
            let p = partitionLomuto(&arr, low, high)
            quickSortLomuto(&arr, low: low, high: p - 1)
            quickSortLomuto(&arr, low: p + 1, high: high)
        }
    }

    func partitionHoare<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
        let pivot = a[low]
        var i = low - 1
        var j = high + 1

        while true {
            repeat { j -= 1 } while a[j] > pivot
            repeat { i += 1 } while a[i] < pivot

            if i < j {
                a.swapAt(i, j)
            } else {
                return j
            }
        }
    }

//    [5, 1, 3, 2, 7, 6, 4,5] low=0,high = 6
//                         h
//     l
//    [4, 1, 3, 2, 7, 6, 5, 5]
//                          h
//                 l
//    [4, 1, 3, 2, 5, 6, 5, 7]
//                 l     h
//                 l  h
//                 l(h)
    
    
    
    
    public  static  func quickSort20250619<T:Comparable>(_ a: inout [T],low:Int,high:Int){
        guard low < high else {
            return
        }
        let pivot = a[high]
        var i = low
        for j in low..<high {
            if a[j] <= pivot {
                a.swapAt(i,j)
                i += 1
            }
        }
        a.swapAt(i,high)
        quickSort20250619(&a, low: low, high: i-1)
        quickSort20250619(&a, low: i+1, high: high)
        
    }
    
    
    public static func test() {
        
        var arr =    [5, 1, 3, 2, 7, 6, 4,5]
        MyKthLargest.quickSort20250619(&arr, low: 0, high: arr.count - 1)
        print(arr)
    }
}
