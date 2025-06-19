import Foundation

// random pick *k* items in a collection


// easest version

func select01<T>( from arr:inout [T],_ count:Int) -> [T]? {
    guard arr.count >= count else {
        return nil
    }
    for i in 0..<count {
        let r = Int.random(in: i..<arr.count)
        if i != r {
            arr.swapAt(i, r)
        }
    }
    return Array(arr[0..<count])
    
    
}
