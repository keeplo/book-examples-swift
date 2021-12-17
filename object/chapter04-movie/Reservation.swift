//
//  Reservation.swift
//  chapter04-movie
//
//  Created by Yongwoo Marco on 2021/12/09.
//

import Foundation

struct Reservation {
    private var customer: Customer
    private var screening: Screening
    private var fee: Money
    private var audienceCount: Int
    
    init(_ customer: Customer, _ screening: Screening, _ fee: Money, _ audienceCount: Int) {
        self.customer = customer
        self.screening = screening
        self.fee = fee
        self.audienceCount = audienceCount
    }
}
