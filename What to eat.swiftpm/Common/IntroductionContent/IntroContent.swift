//
//  File.swift
//  
//
//  Created by Hieu Vuong on 2023-03-31.
//

import Foundation
struct Cuisine: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var ingredients: [String]
    var status: Bool = false
}
struct AreaElements: Codable, Equatable {
    var cuisines: [Cuisine]
    var animation: String
}
struct Area: Codable, Equatable {
    var north: AreaElements
    var middle: AreaElements
    var south: AreaElements
}

protocol CuisineFind {
    func getNorth()
    func getMiddle()
    func getSouth()
}

final class CuisineFindImpl: CuisineFind {
    private var content: Area = .init(north: .init(cuisines: [.init(id: UUID(), name: "Pho", ingredients: ["beef", "broth", "rice noodle", "bean sprout", "hoisin"])], animation: "north"), middle: .init(cuisines: [.init(id: UUID(), name: "Spicy beef noodle/Bun bo", ingredients: ["beef", "broth", "rice vermicelli", "bean sprout", "chili oil"])], animation: "middle"), south: .init(cuisines: [.init(id: UUID(), name: "Grilled pork chop with broken rice/Com tam", ingredients: ["rice", "pork", "fish sauce", "oil onion"])], animation: "south"))
    func getNorth() {
        print("North")
    }
    
    func getMiddle() {
        print("Middle")
    }
    
    func getSouth() {
        print("South")
    }
    
    
}
