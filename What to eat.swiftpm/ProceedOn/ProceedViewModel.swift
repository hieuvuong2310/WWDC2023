//
//  File.swift
//  
//
//  Created by Hieu Vuong on 2023-04-18.
//

import Foundation
@MainActor
class ProceedViewModel: ObservableObject {
    var onYes: () -> Void = { fatalError("ProceedViewModel.onYes was invoked before being initialized") }
    var onFinish: () -> Void = { fatalError("ProceedViewModel.onFinish was invoked before being initialized") }
    init(onYes: (() -> Void)?, onFinish: (() -> Void)?){
        if let onYes {
            self.onYes = onYes
        }
        if let onFinish {
            self.onFinish = onFinish
        }
    }
    
    func onYesTapped() {
        onYes()
    }
    func onFinishTapped() {
        onFinish()
    }
}
