//
//  Movie.swift
//  chapter04-movie
//
//  Created by Yongwoo Marco on 2021/12/09.
//

import Foundation

struct Movie {
    private let title: String
    private let runningTime: TimeInterval
    private var _fee: Money
    private var _discountConditions: [DiscountCondition]
    
    public enum MovieType {
        case amount  // 금액 할인 정책
        case percent // 비율 할인 정책
        case `none`  // 미적용
    }
    private var _movieType: MovieType
    private var _discountAmount: Money
    private var _discountPercent: Double
}

extension Movie {
    var fee: Money {
        get { return _fee }
        set { self._fee = newValue }
    }
    var discountConditions: [DiscountCondition] {
        get { return _discountConditions }
        set { self._discountConditions = newValue }
    }
    var movieType: MovieType {
        get { return _movieType }
        set { self._movieType = newValue }
    }
    var discountAmount: Money {
        get { return _discountAmount }
        set { self._discountAmount = newValue }
    }
    var discountPercent: Double {
        get { return _discountPercent }
        set { self._discountPercent = newValue }
    }
    
    // 4. 자율적인 객체를 향해 - b. 스스로 자신의 데이터를 책임지는 객체
    func calculateAmountDiscountedFee() -> Money {
        guard movieType == MovieType.amount else {
            fatalError()
        }
        return fee.minus(discountAmount)
    }
    
    func calculatePercentDiscountedFee() -> Money {
        guard movieType == MovieType.percent else {
            fatalError()
        }
        return fee.minus(fee.times(discountPercent))
    }
    
    func calculateNoneDiscountedFee() -> Money {
        guard movieType == MovieType.none else {
            fatalError()
        }
        return fee
    }
    
    func isDiscountable(time whenScreened: Date, _ sequence: Int) -> Bool {
        for condition in discountConditions {
            if condition.type == .period,
               condition.isDiscountable(dayOfWeek: whenScreened.dayOfWeek, LocalTime: whenScreened) {
                return true
            } else if condition.isDiscountable(sequence: sequence) {
                return true
            }
        }
        return false
    }
}
