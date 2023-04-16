//
//  File.swift
//  
//
//  Created by Hieu Vuong on 2023-04-14.
//

import Foundation

@MainActor
class FoodViewModel: ObservableObject{
    private var mode: AreaMode
    private var foodText: String
    init(mode: AreaMode){
        self.mode = mode
        switch mode {
        case .north:
            foodText = "north"
        case .middle:
            foodText = "middle"
        case .south:
            foodText = "south"
        }
    }
    
    func getText() -> String {
        return self.foodText
    }
}
