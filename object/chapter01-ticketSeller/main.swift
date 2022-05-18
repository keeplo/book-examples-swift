//
//  main.swift
//  chapter01-ticketSeller
//
//  Created by Yongwoo Marco on 2022/05/03.
//

import Foundation

// 변동없는 Common 객체

// MARK: - 최초 코드

/*
struct Invitation {
    private let _when: Date
    
    var when: Date {
        return self._when
    }
}

struct Ticket {
    private let _fee: Int
    
    var fee: Int {
        return self._fee
    }
}
*/

// MARK: - Marco's Swift Style

struct Invitation {
    let dateOfIssue: Date // when 보다는 명사형 발행날짜 - 직관적인 명사형 프로퍼티명으로 변경
}

struct Ticket {
    let fee: Int
}
