//
//  Movie.swift
//  chapter02-movie_reservation
//
//  Created by Yongwoo Marco on 2022/05/16.
//

import Foundation

struct Movie {
    let title: String
    let runningTime: TimeInterval
    let fee: Money
    private var discountPolicy: DiscountPolicy?
    
    init(title: String, runningTime: TimeInterval, fee: Money, discountPolicy: DiscountPolicy) {
        self.title = title
        self.runningTime = runningTime
        self.fee = fee
        self.discountPolicy = discountPolicy
    }
    
    func calculateMovieFee(_ screening: Screening) -> Money {
        if let discountPolicy = discountPolicy {
            return fee.minus(discountPolicy.calculateDiscountAmount(screening))
        } else {
            return fee
        }
    }
    
    mutating func changeDiscountPolicy(by discountPolicy: DiscountPolicy) {
        self.discountPolicy = discountPolicy
    }
}
