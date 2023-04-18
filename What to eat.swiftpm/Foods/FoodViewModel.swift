//
//  File.swift
//  
//
//  Created by Hieu Vuong on 2023-04-14.
//

import Foundation
enum FoodDestination: Identifiable {
    var id: ObjectIdentifier {
        switch self {
        case .open(let viewModel):
            return ObjectIdentifier(viewModel)
        }
    }
    case open(DetailedFoodViewModel)
}
@MainActor
class FoodViewModel: ObservableObject{
    private var cuisines: [Cuisine]
    @Published private(set) var destination: FoodDestination?
//    var onCard: (Cuisine) -> Void = { _ in fatalError("AreaViewModel.onContinue was invoked before being initialized") }
    var onDone: () -> Void = { fatalError("AreaViewModel.onContinue was invoked before being initialized") }
    init(cuisines: [Cuisine], onDone: (() -> Void)?){
        self.cuisines = cuisines
        if let onDone {
            self.onDone = onDone
        }
    }
    
    func getListOfCuisine() -> [Cuisine] {
        return cuisines
    }
    func onFoodCardTaped(cuisine: Cuisine) {
        let detailedFoodViewModel: DetailedFoodViewModel = DetailedFoodViewModel(cuisine: cuisine) { [weak self] in
            self?.resetDestination()
        }
        destination = .open(detailedFoodViewModel)
    }
    func resetDestination() {
        destination = nil
    }
    func onDoneTapped() {
        onDone()
    }
}
