//
//  main.swift
//  chapter02-movieReservation
//
//  Created by Yongwoo Marco on 2021/09/24.
//

import Foundation

class Customer {
    
}

enum WeekDay: Int {
    case mon = 1
    case tue, wen, thu, fri, sat, sun
}

let avatarTitle = "아바타"
let avatarRunningTime = TimeInterval(120*60)
let avatarFee = Money.wons(10000)
let avatarDiscountPolicy = AmountDiscountPolicy(discountAmount: Money.wons(800),
                                     conditions: SequenceCondition(1), SequenceCondition(10),
                                     PeriodCondition(WeekDay.mon.rawValue,
                                                     DateComponents(hour: 10, minute: 0),
                                                     DateComponents(hour: 11, minute: 59)),
                                     PeriodCondition(WeekDay.mon.rawValue,
                                                     DateComponents(hour: 10, minute: 0),
                                                     DateComponents(hour: 20, minute: 59))
                                     )
let avatar = Movie(title: avatarTitle, runningTime: avatarRunningTime, fee: avatarFee, discountPolicy: avatarDiscountPolicy)

// 할인 정책 변경예제
avatar.changeDiscountPolicy(by: PercentDiscountPolicy(percent: 0.1,
                                                      conditions: SequenceCondition(1), SequenceCondition(10),
                                                      PeriodCondition(WeekDay.mon.rawValue,
                                                                      DateComponents(hour: 10, minute: 0),
                                                                      DateComponents(hour: 11, minute: 59)),
                                                      PeriodCondition(WeekDay.mon.rawValue,
                                                                      DateComponents(hour: 10, minute: 0),
                                                                      DateComponents(hour: 20, minute: 59)))
                                                      )

let titanicTitle = "아바타"
let titanicRunningTime = TimeInterval(180*60)
let titanicFee = Money.wons(11000)
let titanicDiscountPolicy = PercentDiscountPolicy(percent: 0.1,
                                     conditions: SequenceCondition(2),
                                     PeriodCondition(WeekDay.mon.rawValue,
                                                     DateComponents(hour: 14, minute: 0),
                                                     DateComponents(hour: 16, minute: 59)),
                                     PeriodCondition(WeekDay.mon.rawValue,
                                                     DateComponents(hour: 10, minute: 0),
                                                     DateComponents(hour: 13, minute: 59))
                                     )
let titanic = Movie(title: titanicTitle, runningTime: titanicRunningTime, fee: titanicFee, discountPolicy: titanicDiscountPolicy)


let starwarsTitle = "스타워즈"
let starwarsRunningTime = TimeInterval(210*60)
let starwarsFee = Money.wons(10000)
let starwarsDiscountPolicy = NoneDiscountPolicy()
let starwars = Movie(title: starwarsTitle, runningTime: starwarsRunningTime, fee: starwarsFee, discountPolicy: starwarsDiscountPolicy)
