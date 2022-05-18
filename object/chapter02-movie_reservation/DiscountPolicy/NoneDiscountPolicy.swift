//
//  NoneDiscountPolicy.swift
//  chapter02-movie_reservation
//
//  Created by Yongwoo Marco on 2022/05/17.
//

import Foundation

struct NoneDiscountPolicy: DiscountPolicy {
    var conditions: [DiscountCondition] = []
    
    func discountAmount(_ screening: Screening) -> Money {
        return Money.makeZero()
    }
}

