//
//  ReservationAgency.swift
//  chapter04-movie
//
//  Created by Yongwoo Marco on 2021/12/09.
//

import Foundation

struct ReservationAgency {
//    func reserve(screening: Screening, customer: Customer, audienceCount: Int) -> Reservation {
//        let movie = screening.movie
//        var discountable = false
//
//        for condition in movie.discountConditions {
//            if condition.type == .period {
//                discountable = (screening.whenScreened.dayOfWeek == condition.dayOfWeek) && condition.startTime.isPassed(from: screening.whenScreened) && screening.whenScreened.isPassed(from: condition.endTime)
//            } else {
//                discountable = condition.sequence == screening.sequence
//            }
//
//            if discountable {
//                break
//            }
//        }
//
//        let fee: Money
//        if discountable {
//            let discountAmount: Money
//
//            switch movie.movieType {
//            case .amount:
//                discountAmount = movie.discountAmount
//            case .percent:
//                discountAmount = movie.fee.times(movie.discountPercent)
//            case .none:
//                discountAmount = Money.zero
//            }
//            fee = movie.fee.minus(discountAmount)
//        } else {
//            fee = movie.fee
//        }
//
//        return Reservation(customer, screening, fee, audienceCount)
//    }
    
    // 4. 자율적인 객체를 향해 - b. 스스로 자신의 데이터를 책임지는 객체
    func reserve(screening: Screening, customer: Customer, audienceCount: Int) -> Reservation {
        let fee = screening.calculateFee(audienceCount)
        return Reservation(customer, screening, fee, audienceCount)
    }
}
