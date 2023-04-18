//
//  File.swift
//  
//
//  Created by Hieu Vuong on 2023-04-17.
//

import Foundation

@MainActor
class DetailedFoodViewModel: ObservableObject {
    private var cuisine: Cuisine
    private let onDismiss: () -> Void
    init(cuisine: Cuisine, onDismiss: @escaping () -> Void){
        self.cuisine = cuisine
        self.onDismiss = onDismiss
    }
    
    func onDismissButtonTapped() {
        onDismiss()
    }
    
    func getFoodName() -> String {
        cuisine.name
    }
    func getFoodPicture() -> String {
        cuisine.foodPicture
    }
    func getFoodLocations() -> String {
        cuisine.foodDescription.location
    }
    func getFoodDescription() -> String {
        cuisine.foodDescription.descriptionText
    }
    func getFoodIngredients() -> String {
        cuisine.ingredients
    }
}
