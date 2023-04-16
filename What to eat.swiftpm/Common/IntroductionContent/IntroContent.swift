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
    var foodDescription: String
    var status: Bool = false
}
struct Places: Identifiable, Codable, Equatable{
    let id: UUID
    var placeName: String
    var placeDescription: String
}
struct AreaElements: Codable, Equatable {
    var cuisines: [Cuisine]
    var animation: [Places]
    var description: [String]
}
struct Area: Codable, Equatable {
    var north: AreaElements
    var middle: AreaElements
    var south: AreaElements
}

protocol CuisineFind {
    func getNorth() -> AreaElements
    func getMiddle() -> AreaElements
    func getSouth() -> AreaElements
}
final class CuisineFindImpl: CuisineFind {
    private var content: Area =
        .init(
            north: .init(cuisines: [.init(id: UUID(), name: "Pho", ingredients: ["beef", "broth", "rice noodle", "bean sprout", "hoisin"], foodDescription: "Signature in Vietnam")], animation: [.init(id: UUID(), placeName: "Hanoi", placeDescription: "A signature place in Hanoi")], description: ["Dialog1", "Dialog2", "Dialog3"]),
            middle: .init(cuisines: [.init(id: UUID(), name: "Spicy beef noodle/Bun bo", ingredients: ["beef", "broth", "rice vermicelli", "bean sprout", "chili oil"], foodDescription: "Signature in Vietnam")], animation: [.init(id: UUID(), placeName: "Hue", placeDescription: "A signature place in Hue")], description: ["Dialog4", "Dialog5", "Dialog6"]),
            south: .init(cuisines: [.init(id: UUID(), name: "Grilled pork chop with broken rice/Com tam", ingredients: ["rice", "pork", "fish sauce", "oil onion"], foodDescription: "Signature in Saigon")], animation: [.init(id: UUID(), placeName: "Saigon", placeDescription: "A signature place in Saigon")], description: ["Dialog7", "Dialog8", "Dialog9"]))
    func getNorth() -> AreaElements{
        return (content.north)
    }
    
    func getMiddle() -> AreaElements{
        return (content.middle)
    }
    
    func getSouth() -> AreaElements{
        return (content.south)
    }
    
    
}
