//
//  DiscountCondition.swift
//  chapter02-movie_reservation
//
//  Created by Yongwoo Marco on 2022/05/16.
//

import Foundation

protocol DiscountCondition {
    func isSatisfiedBy(_ screening: Screening) -> Bool
}
