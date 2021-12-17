//
//  DiscountCondition.swift
//  chapter04-movie
//
//  Created by Yongwoo Marco on 2021/12/09.
//

import Foundation

struct DiscountCondition {
    enum DiscountConditionType {
        case squence
        case period
    }
    private var _type: DiscountConditionType
    private var _sequence: Int
    private var _dayOfWeek: Int
    private var _startTime: Date
    private var _endTime: Date
}

extension DiscountCondition {
    var type: DiscountConditionType {
        get { return _type }
        set { self._type = newValue }
    }
    var dayOfWeek: Int {
        get { return _dayOfWeek }
        set { self._dayOfWeek = newValue }
    }
    var startTime: Date {
        get { return _startTime }
        set { self._startTime = newValue }
    }
    var endTime: Date {
        get { return _endTime }
        set { self._endTime = newValue }
    }
    var sequence: Int {
        get { return _sequence }
        set { self._sequence = newValue }
    }
    
    // 4. 자율적인 객체를 향해 - b. 스스로 자신의 데이터를 책임지는 객체
    func isDiscountable(dayOfWeek: Int, LocalTime: Date) -> Bool {
        guard type == .period else {
            fatalError()
        }
        return self.dayOfWeek == dayOfWeek && self.startTime.isPassed(from: LocalTime) && self.endTime.isPassed(from: LocalTime)
    }
    
    func isDiscountable(sequence: Int) -> Bool {
        guard type == .squence else {
            fatalError()
        }
        return self.sequence == sequence
    }
}
