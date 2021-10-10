//
//  myCode.swift
//  chapter01_03_constructors_must_be_code_free
//
//  Created by Yongwoo Marco on 2021/10/10.
//

import Foundation

// MARK: - 원인 : 매번 일정한 인스턴스에 초기 셋팅을 갖추게 만들고 싶었음.
class ViewController {
    let decoder = JSONDecoder()
    
    func viewDidLoad() {
        // super.viewDidLoad()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
}

// MARK: - Before : 인스턴스 생성시 셋팅이 되어있음.
class WeatherJSONDecoder: JSONDecoder {
    override init() {
        super.init()
        self.keyDecodingStrategy = .convertFromSnakeCase
    }
}
class ViewControllerBefore {
    let decoder = WeatherJSONDecoder()
    
    func viewDidLoad() {
        // super.viewDidLoad()
    }
}

// MARK: - First Change : 초기값을 지정해주는 형태로 구현해야한다.
// 1.3 생성자에 코드를 넣지 마세요
// - 생성자에서 내부처리 또는 프로퍼티 값 초기화 이외에 코드는 존재하지 않게 구현하자.
class FirstChanged: JSONDecoder {
    init(keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy ) {
        super.init()
        self.keyDecodingStrategy = keyDecodingStrategy
    }
}
class ViewControllerFirstChanged {
    let decoder = FirstChanged(keyDecodingStrategy: .convertFromSnakeCase)
    
    func viewDidLoad() {
        // super.viewDidLoad()
    }
}

// MARK: - Second Change : 부 생성자로 커스텀 생성자를 사용함.
class SecondChanged: JSONDecoder {
    convenience init(keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy ) {
        self.init()
        self.keyDecodingStrategy = keyDecodingStrategy
    }
}
class ViewControllerSecondChanged {
    let decoder = SecondChanged(keyDecodingStrategy: .convertFromSnakeCase)
    
    func viewDidLoad() {
        // super.viewDidLoad()
    }
}

// MARK: - Final Change : 궂이 상속형태로 구현할 필요가 없어짐.
//extension JSONDecoder {
//    convenience init(keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy ) {
//        self.init()
//        self.keyDecodingStrategy = keyDecodingStrategy
//    }
//}

//class ViewControllerFinalChanged {
//    let decoder = JSONDecoder(keyDecodingStrategy: .convertFromSnakeCase)
//    
//    func viewDidLoad() {
//        // super.viewDidLoad()
//    }
//}
