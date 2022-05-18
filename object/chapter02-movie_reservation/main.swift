//
//  main.swift
//  chapter02-movie_reservation
//
//  Created by Yongwoo Marco on 2022/05/16.
//

import Foundation

enum WeekDay: Int {
    case mon = 1
    case tue, wen, thu, fri, sat, sun
}

let avatarTitle = "아바타"
let avatarRunningTime = TimeInterval(120*60)
let avatarFee = Money.makeByWon(10000)
let avatarDiscountPolicy = AmountDiscountPolicy(discountAmount: Money.makeByWon(800),
                                conditions: SequenceCondition(1), SequenceCondition(10),
                                        PeriodCondition(.mon,
                                            DateComponents(hour: 10, minute: 0),
                                            DateComponents(hour: 11, minute: 59)),
                                        PeriodCondition(.mon,
                                            DateComponents(hour: 10, minute: 0),
                                            DateComponents(hour: 20, minute: 59)))
var avatar = Movie(title: avatarTitle,
                   runningTime: avatarRunningTime,
                   fee: avatarFee,
                   discountPolicy: avatarDiscountPolicy)

// 할인 정책 변경예제
avatar.changeDiscountPolicy(by: PercentDiscountPolicy(percent: 0.1,
                                conditions: SequenceCondition(1), SequenceCondition(10),
                                        PeriodCondition(.mon,
                                            DateComponents(hour: 10, minute: 0),
                                            DateComponents(hour: 11, minute: 59)),
                                        PeriodCondition(.mon,
                                            DateComponents(hour: 10, minute: 0),
                                            DateComponents(hour: 20, minute: 59))))

let titanicTitle = "아바타"
let titanicRunningTime = TimeInterval(180*60)
let titanicFee = Money.makeByWon(11000)
let titanicDiscountPolicy = PercentDiscountPolicy(percent: 0.1,
                                conditions: SequenceCondition(2),
                                        PeriodCondition(.mon,
                                            DateComponents(hour: 14, minute: 0),
                                            DateComponents(hour: 16, minute: 59)),
                                        PeriodCondition(.mon,
                                            DateComponents(hour: 10, minute: 0),
                                            DateComponents(hour: 13, minute: 59)))
let titanic = Movie(title: titanicTitle,
                    runningTime: titanicRunningTime,
                    fee: titanicFee,
                    discountPolicy: titanicDiscountPolicy)

let starwarsTitle = "스타워즈"
let starwarsRunningTime = TimeInterval(210*60)
let starwarsFee = Money.makeByWon(10000)
let starwarsDiscountPolicy = NoneDiscountPolicy()
let starwars = Movie(title: starwarsTitle,
                     runningTime: starwarsRunningTime,
                     fee: starwarsFee,
                     discountPolicy: starwarsDiscountPolicy)
