//
//  Brute-Fore-String-Searching.swift
//  LanguageImple
//
//  Created by liudong on 2022/11/7.
//

import Foundation

public extension String {
    public func index(_ subString: String?) -> Int? {
        guard let subString else { return nil }
        let subStringCount = subString.count
        for i in 0..<self.count {
            guard (self.count - i) >= subStringCount else {
                return nil
            }
            for j in 0..<subStringCount {
                if self[self.index(self.startIndex, offsetBy: (i+j))] == subString[subString.index(subString.startIndex, offsetBy: j)] {
                    if j == (subStringCount - 1) {
                        return i
                    }
                    continue
                } else {
                    break
                }
            }
        }
        return nil
    }
}
