//
//  Money.swift
//  chapter02-movieReservation
//
//  Created by Yongwoo Marco on 2021/09/24.
//

import Foundation

struct Money {
    static let zero: Money = Money.wons(0)
    
    private var amount: Decimal
    
    static func wons(_ amount: Int) -> Money {
        return Money(amount: Decimal(amount))
    }
    
    func plus(_ amount: Money) -> Money {
        return Money(amount: self.amount + amount.amount)
    }
    
    func minus(_ amount: Money) -> Money {
        return Money(amount: self.amount - amount.amount)
    }
    
    func times(_ percent: Double) -> Money {
        return Money(amount: self.amount * Decimal(percent))
    }
    
    // 없는 구현을 추가함
    func mutiply(by people: Int) -> Money {
        return Money(amount: self.amount * Decimal(people))
    }
    
    func isLessThan(other: Money) -> Bool {
        return amount < other.amount
    }
    
    func isGreaterThanOrEqual(other: Money) -> Bool {
        return amount >= other.amount
    }
}
