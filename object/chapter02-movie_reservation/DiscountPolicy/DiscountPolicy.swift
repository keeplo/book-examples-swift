//
//  DiscountPolicy.swift
//  chapter02-movie_reservation
//
//  Created by Yongwoo Marco on 2022/05/17.
//

import Foundation

// 추상클래스를 protocol과 extension 구현으로 대체해봄
protocol DiscountPolicy {
    var conditions: [DiscountCondition] { get set }

    func calculateDiscountAmount(_ screening: Screening) -> Money
    func discountAmount(_ screening: Screening) -> Money         // 구현을 채택한 개체에 위임
}

extension DiscountPolicy {
    func calculateDiscountAmount(_ screening: Screening) -> Money {
        for condition in conditions {
            if condition.isSatisfiedBy(screening) {
                return discountAmount(screening)
            }
        }
        return Money.makeZero()
    }
}

extension DiscountPolicy where Self == NoneDiscountPolicy {
    func calculateDiscountAmount(_ screening: Screening) -> Money {
        return Money.makeZero()
    }
}
