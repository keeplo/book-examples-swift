//
//  Bag.swift
//  chapter01-ticketSeller
//
//  Created by Yongwoo Marco on 2022/05/03.
//

import Foundation

// MARK: - 최초 코드
/*
final class Bag {
    private var _amount: Int
    private var _invitation: Invitation?
    private var _ticket: Ticket?

    init(amount: Int, invitation: Invitation? = nil) {
        self._amount = amount
        self._invitation = invitation
    }

    var hasInvitation: Bool {
        self._invitation == nil
    }

    var hasTicket: Bool {
        self._ticket == nil
    }

    func setTicket(_ newTicket: Ticket) {
        return self._ticket = newTicket
    }

    func minusAmount(_ amount: Int) {
        return self._amount -= amount
    }

    func plusAmount(_ amount: Int) {
        return self._amount += amount
    }
}
*/

// MARK: - Refactoring (1차)
/*
final class Bag {
    private var _amount: Int
    private var _invitation: Invitation?
    private var _ticket: Ticket?
    
    init(amount: Int, invitation: Invitation? = nil) {
        self._amount = amount
        self._invitation = invitation
    }
    
    var hasInvitation: Bool {
        self._invitation != nil
    }
    
    var hasTicket: Bool {
        self._ticket != nil
    }
    
    func setTicket(_ newTicket: Ticket) {
        return self._ticket = newTicket
    }
    
    func minusAmount(_ amount: Int) {
        return self._amount -= amount
    }
    
    func plusAmount(_ amount: Int) {
        return self._amount += amount
    }
}
*/

// MARK: - Refactoring (2차)

final class Bag {
    private var _amount: Int
    private var _invitation: Invitation?
    private var _ticket: Ticket?
    
    init(amount: Int, invitation: Invitation? = nil) {
        self._amount = amount
        self._invitation = invitation
    }
    
    var hasInvitation: Bool {
        self._invitation != nil
    }
    
    var hasTicket: Bool {
        self._ticket != nil
    }
    
    func setTicket(_ newTicket: Ticket) {
        self._ticket = newTicket
    }
    
    func minusAmount(_ amount: Int) {
        return self._amount -= amount
    }
    
    func plusAmount(_ amount: Int) {
        return self._amount += amount
    }
    
    func hold(_ ticket: Ticket) -> Int {
        if hasInvitation {
            setTicket(ticket)
            return 0
        } else {
            minusAmount(ticket.fee)
            setTicket(ticket)
            return ticket.fee
        }
    }
}

