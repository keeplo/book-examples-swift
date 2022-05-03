//
//  TicketOffice.swift
//  chapter01-ticketSeller
//
//  Created by Yongwoo Marco on 2022/05/03.
//

import Foundation

// MARK: - 최초 코드
/*
final class TicketOffice {
    private var _amount: Int
    private var _tickets: [Ticket]
    
    init(amount: Int, tickets: Ticket...) {
        self._amount = amount
        self._tickets = tickets
    }
    
    func getTicket() -> Ticket? {
        return self._tickets.popLast()
    }
    
    func minusAmount(_ amount: Int) {
        self._amount -= amount
    }
    
    func plusAmount(_ amount: Int) {
        self._amount += amount
    }
}
*/

// MARK: - Refactoring (1차)
final class TicketOffice {
    private var _amount: Int
    private var _tickets: [Ticket]
    
    init(amount: Int, tickets: Ticket...) {
        self._amount = amount
        self._tickets = tickets
    }
    
    func getTicket() -> Ticket? {
        return self._tickets.popLast()
    }
    
    func minusAmount(_ amount: Int) {
        self._amount -= amount
    }
    
    func plusAmount(_ amount: Int) {
        self._amount += amount
    }
}
