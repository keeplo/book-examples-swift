//
//  SequenceCondition.swift
//  chapter02-movie_reservation
//
//  Created by Yongwoo Marco on 2022/05/16.
//

import Foundation

struct SequenceCondition: DiscountCondition {
    private let sequence: Int
    
    init(_ sequence: Int) {
        self.sequence = sequence
    }
    
    func isSatisfiedBy(_ screening: Screening) -> Bool {
        return screening.isSequence(sequence)
    }
}
