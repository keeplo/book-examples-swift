//
//  Movie.swift
//  chapter02-movieReservation
//
//  Created by Yongwoo Marco on 2021/09/24.
//

import Foundation

class Movie {
    private let title: String
    private let runningTime: TimeInterval
    private var fee: Money
    private var discountPolicy: DiscountPolicy
    
    init(title: String, runningTime: TimeInterval, fee: Money, discountPolicy: DiscountPolicy) {
        self.title = title
        self.runningTime = runningTime
        self.fee = fee
        self.discountPolicy = discountPolicy
    }
    
    func getFee() -> Money {
        return fee
    }
    
    func calculateMovieFee(_ screening: Screening) -> Money {
        return fee.minus(discountPolicy.calculateDiscountAmount(screening))
    }
    
    func changeDiscountPolicy(by discountPolicy: DiscountPolicy) {
        self.discountPolicy = discountPolicy
    }
}
