//
//  File.swift
//  
//
//  Created by Hieu Vuong on 2023-03-31.
//

import Foundation
@MainActor
class HomeViewModel: ObservableObject {
    var onStart: () -> Void = { fatalError("IntroViewModel.onStart was invoked before being initialized") }
    init(onStart: (() -> Void)?){
        if let onStart {
            self.onStart = onStart
        }
    }
    
    func onStartClicked(){
        onStart()
    }
}
