//
//  main.swift
//  chapter01_03_constructors_must_be_code_free
//
//  Created by Yongwoo Marco on 2021/10/10.
//

import Foundation

// MARK: - 기본
class KoreanCash {
    private var won: Int
    
    init(dollars: Double, exchange: Double) {
        self.won = Int(dollars * exchange)
    }
    
    func calculateWon() -> Int {
        return won
    }
}

// MARK: - 추천 형태

// 1.3 생성자에 코드를 넣지 마세요

// - 초기화가 간소화 되어 성능 최적화가 쉬움, 실행속도 빨라짐
// - 의외로 더 빠르게 동작함. 실제로 호출하는 일이 없어도 매번 초기화에서 처리하는 것보다 빠를 수 있음
// - 요청이 있을때 (on demand) 데이터 처리를 하도록하면, 클래스의 사용자들이 데이터 처리 시점을 자유롭게 설정할 수 있음.
// : 객체를 인스턴스화하는 동안에는 객체를 만드는 (build) 일 이외에는 어떤 일도 수행하지 않음.
class KoreanCashEdited {
    private var dollars: Double
    
    init(dollars: Double) {
        self.dollars = dollars
    }
    
    func calculateWon(exchange: Double) -> Int {
        return Int(dollars * exchange)
    }
}
