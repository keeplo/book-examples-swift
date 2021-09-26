//
//  Reservation.swift
//  chapter02-movieReservation
//
//  Created by Yongwoo Marco on 2021/09/24.
//

import Foundation

class Reservation {
    private var customer: Customer
    private var screening: Screening
    private var fee: Money
    private var audienceCount: Int
    
    init(_ customer: Customer,_ screening: Screening,_ fee: Money,_ audienceCount: Int) {
        self.customer = customer
        self.screening = screening
        self.fee = fee
        self.audienceCount = audienceCount
    }
}
