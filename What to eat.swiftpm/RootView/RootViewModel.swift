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
        }
    }
    case home(HomeViewModel)
    case intro(IntroViewModel)
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
        .intro(IntroViewModel())
    }
//    private static func makeListDestination(userId: String) -> Destination {
//        .list(ToDoListViewModel(userId: userId))
//    }
    
    private func bind() {
        switch destination {
        case .home(let viewModel):
            viewModel.onStart = { [weak self] in
                guard let self else { return }
                self.destination = Self.makeIntroDestination()
            }
        case .intro(_):
            break

        }
    }
}
