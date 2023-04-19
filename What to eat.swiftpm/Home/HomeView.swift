//
//  HomeView.swift
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
                    Text("in Vietnam")
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
                    RoundedRectangle(cornerRadius: 30)
                        .frame(maxWidth: 400, maxHeight: 60)
                        .foregroundColor(Color(.primaryButton))
                        .overlay(
                            Text("Start the journey")
                                .foregroundColor(.white)
                                .bold()
                                .font(.title)
                        )
                        .onTapGesture {
                            playSound(sound: "clickButton", type: "wav")
                            viewModel.onStartClicked()
                        }
                }
            )
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel(onStart: {}))
    }
}
