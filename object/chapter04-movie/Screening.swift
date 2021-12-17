//
//  Screening.swift
//  chapter04-movie
//
//  Created by Yongwoo Marco on 2021/12/09.
//

import Foundation

struct Screening {
    private var _movie: Movie
    private var _sequence: Int
    private var _whenScreened: Date
}

extension Screening {
    var movie: Movie {
        get { return _movie }
        set { self._movie = newValue }
    }
    var sequence: Int {
        get { return _sequence }
        set { self._sequence = newValue }
    }
    var whenScreened: Date {
        get { return _whenScreened }
        set { self._whenScreened = newValue }
    }
    
    func calculateFee(_ audienceCount: Int) -> Money {
        switch movie.movieType {
        case .amount:
            if movie.isDiscountable(time: whenScreened, sequence) {
                return movie.calculateAmountDiscountedFee().times(audienceCount)
            }
        case .percent:
            if movie.isDiscountable(time: whenScreened, sequence) {
                return movie.calculatePercentDiscountedFee().times(audienceCount)
            }
        case .none:
            return movie.calculateNoneDiscountedFee().times(audienceCount)
        }
        return movie.calculateNoneDiscountedFee().times(audienceCount)
    }
}
