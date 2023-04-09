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
    init(intro: [String]) {
        self.intro = intro
    }
    convenience init() {
        self.init(intro: ["Hi! Welcome to What to eat in Vietnam. Following this app will guide you through cuisines across Vietnam", "hdskjfhkjs", "sdkskfhkhfks"])
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
        print("North")
    }
    func middleTapped() {
        print("Middle")
    }
    func southTapped() {
        print("South")
    }
}
