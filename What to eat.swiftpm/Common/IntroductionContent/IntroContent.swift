//
//  File.swift
//  
//
//  Created by Hieu Vuong on 2023-03-31.
//

import Foundation
struct FoodDescription: Codable, Equatable {
    var location: String
    var descriptionText: String
}
struct Cuisine: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var ingredients: String
    var foodDescription: FoodDescription
    var status: Bool = false
    var foodPicture: String
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
            north: .init(
                cuisines: [.init(id: UUID(), name: "Pho", ingredients: "beef, broth, rice noodle, bean sprout, hoisin sauce", foodDescription: .init(location: "Usually found every where in Vietnam, but it was believe to originally come from Hanoi", descriptionText: "Pho is a Vietnamese soup that’s made with all of these primary elements: broth, noodles, beef (or other protein) and lots of mix-and-match toppings. It is a comforting soup, which is savory and rich, while still feeling clean and refreshing at the same time. Pho can be enjoyed all year round and at any time of day. In Vietnam, pho is a popular breakfast."), foodPicture: "Food1"), .init(id: UUID(), name: "Noodle with and tofu shrimp paste", ingredients: "shrimp paste, fried tofu, vermicelli, herbs, boiled pork, and optional green sticky rice rolls", foodDescription: .init(location: "Originated from Hanoi, and can be found in other provinces/cities such as Ho Chi Minh City", descriptionText: "In Vietnam, it is called Bun dau mam tom (Noodle and Tofu with Shrimp Sauce) is a unique feature of Vietnamese traditional food. With the fragrance of shrimp sauce and other kinds of fresh ingredients, these special noodles make anyone impressed at the first bite. If you are not comfortable with the smell of the shrimp paste, you can substitute it with soy sauce or fish sauce."), foodPicture: "Food2"), .init(id: UUID(), name: "Grill pork with noodle", ingredients: "rice noodle, fish sauce, grilled pork, herbs, fermented vegetables", foodDescription: .init(location: "This dish was believed to originate from Hanoi, and can be found everywhere in Hanoi. Furthermore, it can be found in other regions too.", descriptionText: "In Vietnam, it is called Bun Cha. 'Bun' means rice noodles, and you'll find a few dishes that combine the noodles with different meat, fish and vegetables. With pork, 'cha' is the main protein in this dish."), foodPicture: "Food3")],
                animation: [.init(id: UUID(), placeName: "Hanoi", placeDescription: "Ho Chi Minh Mausoleum, a signature place in Hanoi")],
                description: ["Dialog1", "Dialog2", "Dialog3"]),
            middle: .init(
                cuisines: [.init(id: UUID(), name: "Spicy beef noodle/Bun bo", ingredients: "beef, broth, rice vermicelli, bean sprout, chili oil, steamed pork loaf", foodDescription: .init(location: "The dish originates from Hue, a city in central Vietnam associated with the cooking style of the former royal court.", descriptionText: "The dish has a mix of spicy, salty, and savory flavors. The predominant flavor is that of lemongrass. Compared to Pho, the noodles are thicker and cylindrical. It is usually served with mung bean sprout, which will provide a fresh, crunchy taste along with the rich and spicy broth"), foodPicture: "Food4"), .init(id: UUID(), name: "Quang noodle", ingredients: "rice noodle, meat, and herbs, most commonly served with a small amount of broth, which is generally infused with turmeric", foodDescription: .init(location: "This dish originated from Quang Nam province, which is in the Central region of Vietnam.", descriptionText: "In the region, it is one of the most popular and nationally recognized food items, and served on various occasions such as at family parties, death anniversaries, and New Year holiday. This dish is usually eaten for breakfast and lunch."), foodPicture: "Food5"), .init(id: UUID(), name: "Water fern cakes/Banh beo", ingredients: "rice cake, dried shrimps, crispy pork skin, scallion oil, and dipping sauce", foodDescription: .init(location: "This dish originates from Hue, a city in central Vietnam associated with the cooking style of the former royal court. However, in other regions they also have different version of steam cakes as well.", descriptionText: "This is usually accompanied by fish sauce and crunchy pork belly strips that enhance the taste of the dish. served in individual small dishes and eaten whole after scraping out of the dish with a spoon. Another way to eat this dish is to use a chopstick to nudge the banh beo off the circular dish. It is often paired with beverages such as green or black tea, or Vietnamese iced coffee. It is best eaten when fresh to avoid the dish being spoiled."), foodPicture: "Food6")],
                animation: [.init(id: UUID(), placeName: "Hue", placeDescription: "Thien Mu temple, a signature place in Hue")],
                description: ["Dialog4", "Dialog5", "Dialog6"]),
            south: .init(
                cuisines: [.init(id: UUID(), name: "Grilled pork chop with broken rice/Com tam", ingredients: "rice (broken rice), girlled pork, fish sauce, oil onion, optional steamed omelet with meatloaf, pickled vegetables.", foodDescription: .init(location: "This was believed to originate from Mekong delta, which is in the South of Vietnam. It is popular across the country, especially Ho Chi Minh city, where they have different versions of this dish.", descriptionText: "Since Vietnam's urbanization in the first half of the 20th century, Com Tam became popular across Southern provinces, including Saigon. When Saigon was bustling with many people from many countries around the world, food sellers adapted Com Tam to be more suitable for foreign customers grilled pork, Vietnamese-style steamed omelet with pork was added. Also, the portion started being served on plates with a fork instead of in traditional bowls with chopsticks."), foodPicture: "Food7"), .init(id: UUID(), name: "Banh Mi", ingredients: "Baguette/bread, vegetables, protein, pate, butter, or varied by your choice.", foodDescription: .init(location: "The baguette was introduced to Vietnam by the French in the mid-19th century, during the Nguyen dynasty. In the 1950s, a distinctly Vietnamese style of sandwich developed in Saigon, becoming a popular street food.", descriptionText: "There are a lot of or countless version of Banh mi's , where customers can custom it based on their choice, and then enjoy it. You can have it with grilled pork, crispy skin pork, beef, chicken, fish, steam pork loaf, meat balls, pate, butter, etc."), foodPicture: "Food8"), .init(id: UUID(), name: "Crsipy Vietnamese Crepe/Banh Xeo", ingredients: "rice flour, water, and turmeric powder for the crepe. Some common fillings include pork, prawns, diced green onion, mung bean, and bean sprouts.", foodDescription: .init(location: "Its origin is unknown, however, people believe that the creation of this dish could be somewhere in Central Vietnam through the fusion of French culture from the French colonial times or South Vietnam by migrating immigrants moving into Vietnam and mixing with the surrounding culture.", descriptionText: "You can try two version of this crepe. The central type will have a smaller size, therefore, it has fewer filling such as prawns, thin slices of pork, and bean sprouts. Compared to the South version, it tends to be larger and thinner. About the fillings, they tend to have more fillings inside of the crepe such as prawns, pork belly, green onions, fried onions, and bean sprouts."), foodPicture: "Food9")],
                animation: [.init(id: UUID(), placeName: "Saigon", placeDescription: "Ben Thanh market, signature place in Ho Chi Minh City")],
                description: ["Dialog7", "Dialog8", "Dialog9"]))
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
