//
//  main.swift
//  chapter01-ticketSeller
//
//  Created by Yongwoo Marco on 2021/09/23.
//

import Foundation

private class main {
    // MARK: - 기본 구현
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

        func getTicketOffice() -> TicketOffice {
            return ticketOffice
        }
    }

    class Theater {
        private var ticketseller: TicketSeller

        init(ticketseller: TicketSeller) {
            self.ticketseller = ticketseller
        }

        func enter(_ audience: Audience) {
            guard let ticket = ticketseller.getTicketOffice().getTicket() else {
                print("남은 티켓이 없습니다.")
                return
            }

            if !audience.getBag().hasInvitation() {
                audience.getBag().minusAmout(ticket.getFee())
                ticketseller.getTicketOffice().plushAmout(ticket.getFee())
            }

            audience.getBag().setTicket(ticket)
        }
    }

}
