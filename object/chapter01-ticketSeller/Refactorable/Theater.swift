//
//  Theater.swift
//  chapter01-ticketSeller
//
//  Created by Yongwoo Marco on 2022/05/03.
//

import Foundation

// MARK: - 최초 코드
/*
final class Theater {
    private var ticketSeller: TicketSeller

    init(ticketSeller: TicketSeller) {
        self.ticketSeller = ticketSeller
    }

    func enter(audience: Audience) {
        if audience.bag.hasInvitation {
            guard let newTicket = ticketSeller.ticketOffice.getTicket() else {
                print("남은 티켓 없음")
                return
            }
            audience.bag.ticket = newTicket
        } else {
            guard let newTicket = ticketSeller.ticketOffice.popTicket() else {
                print("남은 티켓 없음")
                return
            }
            audience.bag.minusAmount(by: newTicket.fee)
            ticketSeller.ticketOffice.plusAmount(by: newTicket.fee)
            audience.bag.ticket = newTicket
        }
    }
}
*/

// MARK: - Refactoring (1차)
final class Theater {
    private var ticketSeller: TicketSeller
    
    init(ticketSeller: TicketSeller) {
        self.ticketSeller = ticketSeller
    }
    
    func enter(audience: Audience) {
        self.ticketSeller.sell(to: audience)
    }
}
