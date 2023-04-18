//
//  File.swift
//  
//
//  Created by Hieu Vuong on 2023-03-31.
//

import Foundation
enum Destination: Identifiable {
    var id: ObjectIdentifier {
        switch self {
        case .personas(let viewModel):
            return ObjectIdentifier(viewModel)
        case .home(let viewModel):
            return ObjectIdentifier(viewModel)
        case .intro(let viewModel):
            return ObjectIdentifier(viewModel)
        case .region(let viewModel):
            return ObjectIdentifier(viewModel)
        case .area(let viewModel):
            return ObjectIdentifier(viewModel)
        case .food(let viewModel):
            return ObjectIdentifier(viewModel)
        }
    }
    case personas(PersonalIntroViewModel)
    case home(HomeViewModel)
    case intro(IntroViewModel)
    case region(ChooseRegionViewModel)
    case area(AreaViewModel)
    case food(FoodViewModel)
}
@MainActor
class RootViewModel: ObservableObject {
    // MARK: Internal Properties
    @Published private(set) var destination: Destination {
        didSet {
            bind()
        }
    }
    
    init() {
        destination = Self.makePersonalIntroDestination()
        bind()
    }
}

extension RootViewModel {
    private static func makePersonalIntroDestination() -> Destination {
        .personas(PersonalIntroViewModel(onContinue: {}))
    }
    private static func makeHomeDestination() -> Destination {
        .home(HomeViewModel(onStart: {}))
    }
    private static func makeIntroDestination() -> Destination {
        .intro(IntroViewModel(onContinue: {}))
    }
    private static func makeRegionDestination() -> Destination {
        .region(ChooseRegionViewModel(onNorth: {}, onMiddle: {}, onSouth: {}))
    }
    private static func makeAreaDestination(mode: AreaMode, onContinue: (([Cuisine]) -> Void)? = nil)-> Destination {
        .area(AreaViewModel(mode: mode, onContinue: onContinue))
    }
    private static func makeFoodDestination(cuisines: [Cuisine], onDone: (() -> Void)? = nil)-> Destination {
        .food(FoodViewModel(cuisines: cuisines, onDone: onDone))
    }
    
    private func bind() {
        switch destination {
        case .personas(let viewModel):
            viewModel.onContinue = { [weak self] in
                guard let self else { return }
                self.destination = Self.makeHomeDestination()
            }
        case .home(let viewModel):
            viewModel.onStart = { [weak self] in
                guard let self else { return }
                self.destination = Self.makeIntroDestination()
            }
        case .intro(let viewModel):
            viewModel.onContinue = { [weak self] in
                guard let self else { return }
                self.destination = Self.makeRegionDestination()
            }
        case .region(let viewModel):
            viewModel.onNorth = { [weak self] in
                guard let self else { return }
                self.destination = Self.makeAreaDestination(mode: .north)
            }
            viewModel.onMiddle = { [weak self] in
                guard let self else { return }
                self.destination = Self.makeAreaDestination(mode: .middle)

            }
            viewModel.onSouth = { [weak self] in
                guard let self else { return }
                self.destination = Self.makeAreaDestination(mode: .south)

            }
        case .area(let viewModel):
            viewModel.onContinue = { [weak self] cuisines in
                guard let self else { return }
                self.destination = Self.makeFoodDestination(cuisines: cuisines)
            }
        case .food(let viewModel):
            viewModel.onDone = { [weak self] in
                guard let self else { return }
                self.destination = Self.makeRegionDestination()
            }
        }
    }
}
