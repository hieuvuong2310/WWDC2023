//
//  File.swift
//  
//
//  Created by Hieu Vuong on 2023-04-14.
//

import Foundation

@MainActor
class FoodViewModel: ObservableObject{
    private var cuisines: [Cuisine]
    init(cuisines: [Cuisine]){
        self.cuisines = cuisines
    }
    
    func getListOfCuisine() -> [Cuisine] {
        return cuisines
    }
}
