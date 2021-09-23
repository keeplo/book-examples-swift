//
//  02Upgrade1.swift
//  chapter01-ticketSeller
//
//  Created by Yongwoo Marco on 2021/09/24.
//

import Foundation

private class FirstUpgrade {
    // MARK: - 설계 개선하기 1. sellTo() 추가 -> TicketSeller 자율적 존재 만들기
    struct Invitation {
        private let when: Date = Date()
    }
    
    struct Ticket {
        private var fee: Int
        
        func getFee() -> Int {
            return fee
        }
    }
    
    class Bag {
        private var amount: Int
        private var invitation: Invitation?
        private var ticket: Ticket?
        
        init(amount: Int, invitation: Invitation? = nil, ticket: Ticket? = nil) {
            self.amount = amount
            self.invitation = invitation
            self.ticket = ticket
        }
        
        func hasInvitation() -> Bool {
            return self.invitation != nil
        }
        
        func hasTicket() -> Bool {
            return self.ticket != nil
        }
        
        func setTicket(_ newTicket: Ticket) {
            self.ticket = newTicket
        }
        
        func minusAmout(_ minus: Int) {
            self.amount -= minus
        }
        
        func plushAmout(_ plus: Int) {
            self.amount += plus
        }
    }
    
    struct Audience {
        private var bag: Bag
        
        func getBag() -> Bag {
            return bag
        }
    }
    
    class TicketOffice {
        private var amount: Int
        private var tickets: [Ticket]
        
        init(amount: Int, tickets: Ticket...) {
            self.amount = amount
            self.tickets = tickets
        }
        
        func getTicket() -> Ticket? {
            guard !tickets.isEmpty else { return nil }
            return tickets.removeFirst()
        }
        
        func minusAmout(_ minus: Int) {
            self.amount -= minus
        }
        
        func plushAmout(_ plus: Int) {
            self.amount += plus
        }
    }
    
    class TicketSeller {
        private var ticketOffice: TicketOffice
        
        init(ticketOffice: TicketOffice) {
            self.ticketOffice = ticketOffice
        }
        
        //    func getTicketOffice() -> TicketOffice {
        //        return ticketOffice
        //    }
        
        func sellTo(audience: Audience) {
            guard let ticket = ticketOffice.getTicket() else {
                print("남은 티켓이 없습니다.")
                return
            }
            
            if !audience.getBag().hasInvitation() {
                audience.getBag().minusAmout(ticket.getFee())
                ticketOffice.plushAmout(ticket.getFee())
            }
            
            audience.getBag().setTicket(ticket)
        }
    }
    
    class Theater {
        private var ticketseller: TicketSeller
        
        init(ticketseller: TicketSeller) {
            self.ticketseller = ticketseller
        }
        
        func enter(_ audience: Audience) {
            ticketseller.sellTo(audience: audience)
        }
    }
}
