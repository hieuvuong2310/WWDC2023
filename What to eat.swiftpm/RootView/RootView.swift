import SwiftUI

struct RootView: View {
    @ObservedObject private var viewModel: RootViewModel = RootViewModel()
    var body: some View {
        switch viewModel.destination {
        case .home(let viewModel):
            HomeView(viewModel: viewModel)
        case .intro(_):
            IntroView()
        }
    }
}
