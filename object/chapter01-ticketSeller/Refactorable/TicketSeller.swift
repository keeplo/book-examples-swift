//
//  TicketSeller.swift
//  chapter01-ticketSeller
//
//  Created by Yongwoo Marco on 2022/05/03.
//

import Foundation

// MARK: - 최초 코드
/*
struct TicketSeller {
    let _ticketOffice: TicketOffice
    
    var ticketOffice: TicketOffice {
        return self._ticketOffice
    }
}
*/

// MARK: - Refactoring (1차)
/*
final class TicketSeller {
    private let _ticketOffice: TicketOffice
    
    init(ticketOffice: TicketOffice) {
        self._ticketOffice = ticketOffice
    }
    
    func sell(to audience: Audience) {
        guard let newTicket = self._ticketOffice.getTicket() else {
            print("남은 티켓 없음")
            return
        }
        let ticketFee = audience.buy(newTicket)
        self._ticketOffice.plusAmount(ticketFee)
    }
}
*/

// MARK: - Refactoring (2차)
final class TicketSeller {
    private let _ticketOffice: TicketOffice
    
    init(ticketOffice: TicketOffice) {
        self._ticketOffice = ticketOffice
    }
    
    func sell(to audience: Audience) {
        self._ticketOffice.sellTicket(to: audience)
    }
}
