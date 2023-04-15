//
//  File.swift
//  
//
//  Created by Hieu Vuong on 2023-04-09.
//

import Foundation
enum AreaMode {
    case north
    case middle
    case south
}
@MainActor
class AreaViewModel: ObservableObject {
    private var mode: AreaMode
    private var cuisineFind: CuisineFindImpl = CuisineFindImpl()
    private var content: AreaElements
    private let flightImage: String = "Flight"
    init(mode: AreaMode){
        self.mode = mode
        switch mode {
        case .north:
            content = cuisineFind.getNorth()
        case .middle:
            content = cuisineFind.getMiddle()
        case .south:
            content = cuisineFind.getSouth()
        }
    }
    func getFlightImage() -> String {
        return self.flightImage
    }
    func getImages() -> [Places] {
        content.animation
    }
    func getContent() -> AreaElements {
        return content
    }
}
