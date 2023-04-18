import SwiftUI

struct RootView: View {
    @ObservedObject private var viewModel: RootViewModel = RootViewModel()
    var body: some View {
        switch viewModel.destination {
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
        }
    }
}
