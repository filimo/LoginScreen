//
//  UserModelView.swift
//  LoginScreen
//
//  Created by Viktor Kushnerov on 7/12/19.
//  Copyright © 2019 Viktor Kushnerov. All rights reserved.
//

import SwiftUI
import Combine

class UserModelView: BindableObject {
    @Published var password = ""
    @Published var passwordRepeat = ""
    
    var didChange = PassthroughSubject<Void, Never>()
    
    @Published var isValid = false {
        didSet {
            didChange.send()
        }
    }
    
    var validPassword: AnyPublisher<Bool, Never> {
        return Publishers.CombineLatest($password, $passwordRepeat)
            .map { password, passwordRepeat in
                return !password.isEmpty && password == passwordRepeat
            }
            .eraseToAnyPublisher()
    }
    
    init() {
        _ = validPassword
            .receive(on: RunLoop.main)
            .assign(to: \.isValid, on: self)
//            .map { val in
//                return val
//            }
//            .assign(to: \.isValid, on: self)
    }
}


