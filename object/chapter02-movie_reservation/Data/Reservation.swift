//
//  Reservation.swift
//  chapter02-movie_reservation
//
//  Created by Yongwoo Marco on 2022/05/16.
//

import Foundation

struct Reservation {
    let customer: Customer
    let screening: Screening
    let fee: Money
    let audienceCount: Int
}
