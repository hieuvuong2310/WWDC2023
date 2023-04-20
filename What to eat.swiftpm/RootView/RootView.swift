//
//  RootView.swift
//
//
//  Created by Hieu Vuong on 2023-04-18.
//
import SwiftUI

struct RootView: View {
    @ObservedObject private var rootViewModel: RootViewModel = RootViewModel()
    var body: some View {
        switch rootViewModel.destination {
        case .personas(let viewModel):
            PersonalIntroView(viewModel: viewModel)
        case .home(let viewModel):
            HomeView(viewModel: viewModel)
        case .intro(let viewModel):
            IntroView(viewModel: viewModel)
        case .region(let viewModel):
            ChooseRegionView(viewModel: viewModel)
        case .area(let viewModel):
            AreaView(viewModel: viewModel)
        case .food(let viewModel):
            FoodView(viewModel: viewModel)
        case .proceed(let viewModel):
            ProceedView(viewModel: viewModel)
        case .end(let viewModel):
            EndView(viewModel: viewModel)
        }
    }
}
