//
//  Money.swift
//  chapter02-movie_reservation
//
//  Created by Yongwoo Marco on 2022/05/16.
//

import Foundation

struct Money {
    /* Swift 스타일로 이름을 지어봄
    static let zero: Money = Money.wons(0)
    
    static func wons(_ amount: Int) -> Money {
        return Money(amount: Decimal(amount))
    }
    */
    static func makeZero() -> Money {
        return Money.makeByWon(0)
    }
    
    static func makeByWon(_ amount: Int) -> Money {
        return Money(amount: Decimal(amount))
    }
    
    private var amount: Decimal
    
    func plus(_ amount: Money) -> Money {
        return Money(amount: self.amount + amount.amount)
    }
    
    func minus(_ amount: Money) -> Money {
        return Money(amount: self.amount - amount.amount)
    }
    
    func times(_ percent: Double) -> Money {
        return Money(amount: self.amount * Decimal(percent))
    }
    
    func times(_ count: Int) -> Money {
        return Money(amount: self.amount * Decimal(count))
    }
    
    func isLessThan(other: Money) -> Bool {
        return amount < other.amount
    }
    
    func isGreaterThanOrEqual(other: Money) -> Bool {
        return amount >= other.amount
    }
}
