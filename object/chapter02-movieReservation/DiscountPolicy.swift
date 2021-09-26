//
//  DiscountPolicy.swift
//  chapter02-movieReservation
//
//  Created by Yongwoo Marco on 2021/09/24.
//

import Foundation

// 추상클래스를 protocol과 extension 구현으로 대체해봄
protocol DiscountPolicy {
    var conditions: [DiscountCondition] { get set }

    func calculateDiscountAmount(_ screening: Screening) -> Money
    func getDiscountAmount(_ screening: Screening) -> Money
}
extension DiscountPolicy {
    func calculateDiscountAmount(_ screening: Screening) -> Money {
        for each in conditions {
            if each.isSatisfiedBy(screening) {
                return getDiscountAmount(screening)
            }
        }
        return Money.zero
    }
}

extension DiscountPolicy where Self: NoneDiscountPolicy {
    func calculateDiscountAmount(_ screening: Screening) -> Money {
        return Money.zero
    }
}


class AmountDiscountPolicy: DiscountPolicy {
    var conditions: [DiscountCondition]
    private var discountAmount: Money
    
    init(discountAmount: Money, conditions: DiscountCondition...) {
        self.conditions = conditions
        self.discountAmount = discountAmount
    }
    
    func getDiscountAmount(_ screening: Screening) -> Money {
        return discountAmount
    }
}

class PercentDiscountPolicy: DiscountPolicy {
    var conditions: [DiscountCondition]
    private var percent: Double
    
    init(percent: Double, conditions: DiscountCondition...) {
        self.conditions = conditions
        self.percent = percent
    }
    
    func getDiscountAmount(_ screening: Screening) -> Money {
        return screening.getMovieFee().times(percent)
    }
}

class NoneDiscountPolicy: DiscountPolicy {
    var conditions: [DiscountCondition] = []
    
    func getDiscountAmount(_ screening: Screening) -> Money {
        return Money.zero
    }
}


