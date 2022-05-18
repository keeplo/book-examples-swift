//
//  PeriodCondition.swift
//  chapter02-movie_reservation
//
//  Created by Yongwoo Marco on 2022/05/16.
//

import Foundation

extension Date {
    
    func isAvailableTime(from start: Date, to end: Date) -> Bool {
        let startCompared = start.compare(self)
        let canDoFromStart = startCompared == .orderedAscending || startCompared == .orderedSame
        let endCompared = end.compare(self)
        let canDoFromEnd = endCompared == .orderedDescending || endCompared == .orderedSame
        return canDoFromStart && canDoFromEnd
    }
    
    /* Test
    private func DateExtensionTest() {
        let calendar = Calendar.current
        let start = calendar.date(from: DateComponents(hour: 5, minute: 11))!
        let end = calendar.date(from: DateComponents(hour: 5, minute: 13))!

        let compareTrue1 = calendar.date(from: DateComponents(hour: 5, minute: 11))!
        let compareTrue2 = calendar.date(from: DateComponents(hour: 5, minute: 12))!
        let compareTrue3 = calendar.date(from: DateComponents(hour: 5, minute: 13))!

        let compareFalse1 = calendar.date(from: DateComponents(hour: 5, minute: 10))!
        let compareFalse2 = calendar.date(from: DateComponents(hour: 5, minute: 14))!

        print("True  Test 1 \(compareTrue1.isAvailableTime(from: start, to: end))")
        print("True  Test 2 \(compareTrue2.isAvailableTime(from: start, to: end))")
        print("True  Test 3 \(compareTrue3.isAvailableTime(from: start, to: end))")
        print("False Test 1 \(compareFalse1.isAvailableTime(from: start, to: end))")
        print("False Test 2 \(compareFalse2.isAvailableTime(from: start, to: end))")
    }
    */
}

struct PeriodCondition: DiscountCondition {
    private let dayOfWeek: WeekDay // Calendar.current.component(.weekday, from: Date())
    private let startTime: DateComponents
    private let endTime: DateComponents
    
    init(_ dayOfWeek: WeekDay,_ startTime: DateComponents,_ endTime: DateComponents) {
        self.dayOfWeek = dayOfWeek
        self.startTime = startTime
        self.endTime = endTime
    }
    
    func isSatisfiedBy(_ screening: Screening) -> Bool {
        let calendar = Calendar.current
        
        let whenScreened = screening.startTime
        let whenScreenedDate = calendar.date(from: whenScreened)!
        let whenScreenedWeekday = calendar.component(.weekday, from: whenScreenedDate)
        
        let startTimeDate = calendar.date(from: startTime)!
        let endTimeDate = calendar.date(from: endTime)!
        
        let isSameWeekday = whenScreenedWeekday == dayOfWeek.rawValue
    
        return isSameWeekday && whenScreenedDate.isAvailableTime(from: startTimeDate, to: endTimeDate)
    }
}
