//
//  File.swift
//  
//
//  Created by Hieu Vuong on 2023-04-18.
//

import Foundation
@MainActor
class EndViewModel: ObservableObject {
    private let endImage: String = "Bye"
    private let endTitle: String = "Thank you for your time!"
    private let endMessage: String = "I hope you enjoy my app!"
    
    func getEndImage() -> String {
        return endImage
    }
    func getEndTitle() -> String {
        return endTitle
    }
    func getEndMessage() -> String {
        return endMessage
    }
}
