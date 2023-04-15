//
//  File.swift
//  
//
//  Created by Hieu Vuong on 2023-03-31.
//

import Foundation
enum IntroErrors: Error {
    case noIntro
}
@MainActor
class IntroViewModel: ObservableObject {
    @Published var intro: [String]
    @Published private(set) var loading: Bool = false
    private var count: Int = 0
    @Published var continueOn: Bool = true
    var onNorth: () -> Void = { fatalError("IntroViewModel.onNorth was invoked before being initialized") }
    var onMiddle: () -> Void = { fatalError("IntroViewModel.onMiddle was invoked before being initialized") }
    var onSouth: () -> Void = { fatalError("IntroViewModel.onSouth was invoked before being initialized") }
    init(onNorth: (() -> Void)?, onMiddle: (() -> Void)?, onSouth: (() -> Void)?, intro: [String]){
        if let onNorth {
            self.onNorth = onNorth
        }
        if let onMiddle {
            self.onMiddle = onMiddle
        }
        if let onSouth {
            self.onSouth = onSouth
        }
        self.intro = intro
    }
    convenience init(onNorth: (() -> Void)?, onMiddle: (() -> Void)?, onSouth: (() -> Void)?) {
        self.init(onNorth: onNorth, onMiddle: onMiddle, onSouth: onSouth, intro: ["Hi! Welcome to What to eat in Vietnam. Following this app will guide you through cuisines across Vietnam", "hdskjfhkjs", "sdkskfhkhfks"])
    }
    
    func getIntro() -> String{
        if(count >= intro.count){
            continueOn.toggle()
            return ""
        }
        else {
            return (intro[count])
        }
    }
    
    func continueTapped() {
        if(count >= 0 && count < intro.count){
            count += 1
        }
    }
    
    func northTapped() {
        onNorth()
    }
    func middleTapped() {
        onMiddle()
    }
    func southTapped() {
        onSouth()
    }
}
