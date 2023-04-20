//
//
//  
//
//  Created by Hieu Vuong on 2023-04-17.
//

import Foundation

@MainActor
class ChooseRegionViewModel: ObservableObject {
    var onNorth: () -> Void = { fatalError("ChooseRegionViewModel.onNorth was invoked before being initialized") }
    var onMiddle: () -> Void = { fatalError("ChooseRegionViewModel.onMiddle was invoked before being initialized") }
    var onSouth: () -> Void = { fatalError("ChooseRegionViewModel.onSouth was invoked before being initialized") }
    init(onNorth: (() -> Void)?, onMiddle: (() -> Void)?, onSouth: (() -> Void)?) {
        if let onNorth {
            self.onNorth = onNorth
        }
        if let onMiddle {
            self.onMiddle = onMiddle
        }
        if let onSouth {
            self.onSouth = onSouth
        }
    }
    func northTapped() {
        onNorth()
    }
    func middleTapped() {
        onMiddle()
    }
    func southTapped() {
        onSouth()
    }
}
