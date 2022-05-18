//
//  AmountDiscountPolicy.swift
//  chapter02-movie_reservation
//
//  Created by Yongwoo Marco on 2022/05/17.
//

import Foundation

struct AmountDiscountPolicy: DiscountPolicy {
    var conditions: [DiscountCondition]
    private var discountAmount: Money
    
    init(discountAmount: Money, conditions: DiscountCondition...) {
        self.conditions = conditions
        self.discountAmount = discountAmount
    }
    
    func discountAmount(_ screening: Screening) -> Money {
        return discountAmount
    }
}
