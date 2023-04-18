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
    var onContinue: () -> Void = { fatalError("AreaViewModel.onContinue was invoked before being initialized") }
    init(intro: [String], onContinue: (() -> Void)?){
        if let onContinue {
            self.onContinue = onContinue
        }
        self.intro = intro
    }
    convenience init(onContinue: (()->Void)?) {
        self.init(intro: ["Hi! Welcome to What to eat in Vietnam. Following this app will guide you through cuisines across Vietnam", "You can expect to gain more information about food in different regions in Vietnam.", "Now, let's start our journey."], onContinue: onContinue)
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
    func moveNext() {
        onContinue()
    }
    
}
