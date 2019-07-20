//
//  UserModelView.swift
//  LoginScreen
//
//  Created by Viktor Kushnerov on 7/12/19.
//  Copyright © 2019 Viktor Kushnerov. All rights reserved.
//

import SwiftUI
import Combine


class UserViewModels: BindableObject {
    @Published var password = ""
    @Published var passwordRepeat = ""
    
    var willChange = PassthroughSubject<Void, Never>()
    
    var isValid = false {
        didSet {
            willChange.send()
        }
    }
    
    var validPassword: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest($password, $passwordRepeat)
            .map { password, passwordRepeat in
                return !password.isEmpty && password == passwordRepeat
            }
            .eraseToAnyPublisher()
    }
    
    init() {
        _ = validPassword
            .receive(on: RunLoop.main)
            .assign(to: \.isValid, on: self)
    }
}


