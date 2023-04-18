//
//  SwiftUIView.swift
//  
//
//  Created by Hieu Vuong on 2023-03-31.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var viewModel: HomeViewModel
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        Color(.primaryAccent)
            .ignoresSafeArea()
            .overlay(
                VStack {
                    Text("What to eat?")
                        .bold()
                        .font(.largeTitle)
                        .padding(.top, 50)
                        .foregroundColor(Color(.titleText))
                    Text("Vietnamese version")
                        .bold()
                        .font(.title2)
                        .foregroundColor(Color(.secondaryText))
                    Image("Background")
                        .resizable()
                        .opacity(0.5)
                        .aspectRatio(contentMode: .fit)
                        .overlay(
                            Image("Character")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        )
                    Button("Start the journey"){
                        viewModel.onStartClicked()
                    }
                    .foregroundColor(.white)
                    .font(.title)
                    .buttonStyle(.bordered)
                    .frame(maxWidth: 343, maxHeight: 56)
                    .background(Color(.primaryButton))
                    .cornerRadius(14)
                    .padding(.bottom, 50)
                }
            )
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel(onStart: {}))
    }
}
