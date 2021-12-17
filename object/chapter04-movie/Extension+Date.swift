//
//  Extension+Date.swift
//  chapter04-movie
//
//  Created by Yongwoo Marco on 2021/12/17.
//

import Foundation.NSDate

extension Date {
    /**
     # dateCompare
     - Parameters:
        - from base: 비교할 대상 Date
     - Note:
        - base 보다 self가 과거면 false 미래면 True
    */
    func isPassed(from base: Date) -> Bool {
        return self.compare(base) == .orderedDescending ? true : false
    }
    
    var dayOfWeek: Int {
        return Calendar.current.component(.weekday, from: self)
    }
}
