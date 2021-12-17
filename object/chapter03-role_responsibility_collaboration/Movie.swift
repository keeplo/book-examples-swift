//
//  Movie.swift
//  chapter03-role_responsibility_collaboration
//
//  Created by Yongwoo Marco on 2021/12/09.
//

import Foundation

public class Movie {
    private var fee: Money
    private discountPolicy: DiscountPolicy

    public func calculateMoviewFee(screening: Screening) -> Money {
        return fee.minus(discountPolicy.calculateDiscountAmount(screening))
    }
}
