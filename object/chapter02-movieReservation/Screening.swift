//
//  Screening.swift
//  chapter02-movieReservation
//
//  Created by Yongwoo Marco on 2021/09/24.
//

import Foundation

class Screening {
    private var movie: Movie
    private var sequence: Int
    private var whenScreened: Date
    
    init(movie: Movie, sequence: Int, whenScreened: Date) {
        self.movie = movie
        self.sequence = sequence
        self.whenScreened = whenScreened
    }
    
    func getStartTime() -> Date {
        return whenScreened
    }
    
    func isSequence(_ sequence: Int) -> Bool {
        return self.sequence == sequence
    }
    
    func getMovieFee() -> Money {
        return movie.getFee()
    }
    
    func reserve(customer: Customer, audienceCount: Int) -> Reservation {
        return Reservation(customer, self, calculateFee(audienceCount), audienceCount)
    }
    
    func calculateFee(_ audienceCount: Int) -> Money {
        return movie.calculateMovieFee(self).mutiply(by: audienceCount)
    }
}
