//
//  TestFlipView.swift
//  LoginScreen
//
//  Created by Viktor Kushnerov on 7/15/19.
//  Copyright © 2019 Viktor Kushnerov. All rights reserved.
//

import SwiftUI

struct TestFlipView : View {
    let rectangle1 = Rectangle()
    let rectangle2 = Rectangle()
    @State private var degreesYellow = -90.0
    @State private var degreesRed = 0.0
//    let animationOptions: Animation = [.transitionFlipFromRight, .showHideTransitionViews]
    let x: CGFloat = 0
    let y: CGFloat = 1
    let z: CGFloat = 0

    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color.yellow)
                    .rotation3DEffect(.degrees(degreesYellow), axis: (x, y, z))
                    .tapAction {
                        withAnimation {
                            self.degreesYellow = -90
                            self.degreesRed = 0
                        }
                }
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color.red)
                    .rotation3DEffect(.degrees(degreesRed), axis: (x, y, z))
                    .clipShape(Capsule())
                    .tapAction {
                        withAnimation {
                            self.degreesYellow = 0
                            self.degreesRed = 90
                        }
                    }
            }
            Button(action: {
                
            }) {
                Text("Flip")
            }
        }
    }
}

#if DEBUG
struct TestFlipView_Previews : PreviewProvider {
    static var previews: some View {
        TestFlipView()
    }
}
#endif
