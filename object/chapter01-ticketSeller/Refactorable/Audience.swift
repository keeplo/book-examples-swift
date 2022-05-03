//
//  Audience.swift
//  chapter01-ticketSeller
//
//  Created by Yongwoo Marco on 2022/05/03.
//

import Foundation

// MARK: - 최초 코드
/*
struct Audience {
    private let _bag: Bag

    var bag: Bag {
        return self._bag
    }
}
*/

// MARK: - Refactoring (1차)
/*
struct Audience {
    private let _bag: Bag
    
    func buy(_ ticket: Ticket) -> Int {
        if self._bag.hasInvitation {
            self._bag.setTicket(ticket)
            return 0
        } else {
            self._bag.minusAmount(ticket.fee)
            self._bag.setTicket(ticket)
            return ticket.fee
        }
    }
}
*/

// MARK: - Refactoring (2차)

struct Audience {
    private let _bag: Bag
    
    func buy(_ ticket: Ticket) -> Int {
        let ticketFee = self._bag.hold(ticket)
        return ticketFee
    }
}

