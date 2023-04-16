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
        case .home(let viewModel):
            return ObjectIdentifier(viewModel)
        case .intro(let viewModel):
            return ObjectIdentifier(viewModel)
        case .area(let viewModel):
            return ObjectIdentifier(viewModel)
        case .food(let viewModel):
            return ObjectIdentifier(viewModel)
        }
    }
    case home(HomeViewModel)
    case intro(IntroViewModel)
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
        destination = Self.makeHomeDestination()
        bind()
    }
}

extension RootViewModel {
    private static func makeHomeDestination() -> Destination {
        .home(HomeViewModel(onStart: {}))
    }
    private static func makeIntroDestination() -> Destination {
        .intro(IntroViewModel(onNorth: {}, onMiddle: {}, onSouth: {}))
    }
    private static func makeAreaDestination(mode: AreaMode, onContinue: ((AreaMode) -> Void)? = nil)-> Destination {
        .area(AreaViewModel(mode: mode, onContinue: onContinue))
    }
    private static func makeFoodDestination(mode: AreaMode)-> Destination {
        .food(FoodViewModel(mode: mode))
    }
    
    private func bind() {
        switch destination {
        case .home(let viewModel):
            viewModel.onStart = { [weak self] in
                guard let self else { return }
                self.destination = Self.makeIntroDestination()
            }
        case .intro(let viewModel):
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
            viewModel.onContinue = { [weak self] mode in
                guard let self else { return }
                self.destination = Self.makeFoodDestination(mode: mode)
            }
        case .food(_):
            break
        }
    }
}
