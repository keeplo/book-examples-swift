//
//  PercentDiscountPolicy.swift
//  chapter02-movie_reservation
//
//  Created by Yongwoo Marco on 2022/05/17.
//

import Foundation

struct PercentDiscountPolicy: DiscountPolicy {
    var conditions: [DiscountCondition]
    private var percent: Double
    
    init(percent: Double, conditions: DiscountCondition...) {
        self.conditions = conditions
        self.percent = percent
    }
    
    func discountAmount(_ screening: Screening) -> Money {
        return screening.movieFee.times(percent)
    }
}
