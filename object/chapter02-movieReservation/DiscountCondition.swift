//
//  DiscountCondition.swift
//  chapter02-movieReservation
//
//  Created by Yongwoo Marco on 2021/09/24.
//

import Foundation

protocol DiscountCondition {
    func isSatisfiedBy(_ screening: Screening) -> Bool
}

class SequenceCondition: DiscountCondition {
    private var sequence: Int
    
    init(_ sequence: Int) {
        self.sequence = sequence
    }
    
    func isSatisfiedBy(_ screening: Screening) -> Bool {
        return screening.isSequence(sequence)
    }
}

class PeriodCondition: DiscountCondition {
    private var dayOfWeek: Int // Calendar.current.component(.weekday, from: Date())
    private var startTime: DateComponents
    private var endTime: DateComponents
    
    init(_ dayOfWeek: Int,_ startTime: DateComponents,_ endTime: DateComponents) {
        self.dayOfWeek = dayOfWeek
        self.startTime = startTime
        self.endTime = endTime
    }
    
    func isSatisfiedBy(_ screening: Screening) -> Bool {
        let whenScreened = screening.getStartTime()
        return (Calendar.current.component(.weekday, from: whenScreened) == dayOfWeek) &&
            (getTimeInterval(components: startTime) <= whenScreened.timeIntervalSince1970) &&
            (getTimeInterval(components: endTime) >= whenScreened.timeIntervalSince1970)
    }
    
    // 비교를 위해 추가한 부분
    func getTimeInterval(components: DateComponents) -> TimeInterval {
        guard let date = Calendar(identifier: .gregorian).date(from: components) else {
            NSLog("Date 생성 실패 올바른 DataComponents가 아님")
            return TimeInterval()
        }
        return date.timeIntervalSince1970
    }
}
