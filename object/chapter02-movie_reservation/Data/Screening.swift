//
//  Screening.swift
//  chapter02-movie_reservation
//
//  Created by Yongwoo Marco on 2022/05/16.
//

import Foundation

// 상영 정보 - 영화 정보나 순번, 시작 등 정보는 숨겨질 필요가 없다고 생각함.
struct Screening {
    let movie: Movie // 상영할 영화
    let sequence: Int // 순번
    let whenScreened: DateComponents // 상영 시작 시간
    
    var startTime: DateComponents {
        return whenScreened
    }
    
    var movieFee: Money {
        return movie.fee
    }
    
    func isSequence(_ sequence: Int) -> Bool {
        return self.sequence == sequence
    }
    
    func reserve(customer: Customer, audienceCount: Int) -> Reservation {
        return Reservation(customer: customer,
                           screening: self,
                           fee: calculateFee(by: audienceCount),
                           audienceCount: audienceCount)
    }
    
    func calculateFee(by audienceCount: Int) -> Money {
        return movie.calculateMovieFee(self).times(audienceCount)
    }
}
