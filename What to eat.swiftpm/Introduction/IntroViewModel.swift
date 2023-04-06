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
    init(intro: [String]) {
        self.intro = intro
    }
    convenience init() {
        self.init(intro: ["Hi! Welcome to What to eat in Vietnam. Following this app will guide you through cuisines across Vietnam"])
    }
    
    func getIntro(index: Int) -> String{
        return (intro[index])
    }
}
