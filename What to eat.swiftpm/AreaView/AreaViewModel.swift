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
    private var region: String
    private var count: Int = 0
    private var nextDes: Bool = true
    private let flightImage: String = "Flight"
    var onContinue: (AreaMode) -> Void = { _ in fatalError("AreaViewModel.onContinue was invoked before being initialized") }
    init(mode: AreaMode, onContinue: ((AreaMode) -> Void)?){
        self.mode = mode
        if let onContinue {
            self.onContinue = onContinue
        }
        switch mode {
        case .north:
            content = cuisineFind.getNorth()
            region = "North"
        case .middle:
            content = cuisineFind.getMiddle()
            region = "Middle"
        case .south:
            content = cuisineFind.getSouth()
            region = "South"
        }
    }
    func getFlightImage() -> String {
        return self.flightImage
    }
    func getImages() -> [Places] {
        content.animation
    }
    func getRegion() -> String {
        self.region
    }
    func getContent() -> AreaElements {
        return content
    }
    func continueTapped() {
        count+=1
    }
    func getDescription() -> String {
        var des: String
        if (count < content.description.count) {
            des = content.description[count]
        } else {
            nextDes.toggle()
            des = ""
        }
        return des
    }
    
    func isContinued() -> Bool {
        return self.nextDes
    }
    
    func goToCuisinePage() {
        onContinue(mode)
    }
}
