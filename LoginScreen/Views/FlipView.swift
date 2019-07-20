//
//  FlipView.swift
//  LoginScreen
//
//  Created by Viktor Kushnerov on 7/15/19.
//  Copyright © 2019 Viktor Kushnerov. All rights reserved.
//

import UIKit
import SwiftUI

struct FlipView: UIViewRepresentable {
    var firstView: UIView!
    var secondView: UIView!
    
    func makeUIView(context: UIViewRepresentableContext<FlipView>) -> UIView {
        let view = UIView()
        
        let firstView = UIView(frame: CGRect(x: 32, y: 32, width: 128, height: 128))
        let secondView = UIView(frame: CGRect(x: 32, y: 32, width: 128, height: 128))
        
        firstView.backgroundColor = UIColor.red
        secondView.backgroundColor = UIColor.blue
        
        secondView.isHidden = true
        
        view.addSubview(firstView)
        view.addSubview(secondView)
        
//        perform(#selector(flip), with: nil, afterDelay: 2)
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<FlipView>) {
        
    }
    
    func flip() {
        let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
        
        UIView.transition(with: firstView, duration: 1.0, options: transitionOptions, animations: {
            self.firstView.isHidden = true
        })
        
        UIView.transition(with: secondView, duration: 1.0, options: transitionOptions, animations: {
            self.secondView.isHidden = false
        })
    }
}


//struct FlipView: UIViewControllerRepresentable {
//    var controllers: [UIViewController]
//
//    func makeUIViewController(context: Context) -> UIPageViewController {
//        let pageViewController = UIPageViewController(
//            transitionStyle: .scroll,
//            navigationOrientation: .horizontal)
//
//        return pageViewController
//    }
//
//    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
//        pageViewController.setViewControllers(
//            [controllers[0]], direction: .forward, animated: true)
//    }
//}
