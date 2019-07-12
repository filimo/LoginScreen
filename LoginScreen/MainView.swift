//
//  ContentView.swift
//  LoginScreen
//
//  Created by Viktor Kushnerov on 7/12/19.
//  Copyright © 2019 Viktor Kushnerov. All rights reserved.
//

import SwiftUI

struct MainView : View {
    @ObjectBinding var user = UserModelView()
    @State var canRegistration = false
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Rectangle()
                    .fill(Color.yellow)
                    .cornerRadius(20)
                    .shadow(radius: 20)
                VStack {
                    Text("Fill in all the fields")
                        .font(.system(size: 25))
                        .fontWeight(.heavy)
                        .foregroundColor(Color.red)
                        .padding()
                    TextField("Password", text: $user.password)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding()
                    TextField("Password again", text: $user.passwordRepeat)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding()
                    Button(action: {
                    }) {
                        Text("Registration").font(.system(size: 25)).fontWeight(.bold)
                    }
                    .disabled(!self.canRegistration)
                        .padding()
                        .background(self.canRegistration ? Color.blue : Color.gray)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                }
            }
            Spacer()
        }
        .onAppear {
            _ = self.user.$isValid
                .receive(on: RunLoop.main)
                .assign(to: \.canRegistration, on: self)
        }
    }
}

#if DEBUG
struct MainView_Previews : PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"].identified(by: \.self)) { deviceName in
            MainView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
#endif
