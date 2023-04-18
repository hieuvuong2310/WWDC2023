//
//  SwiftUIView.swift
//  
//
//  Created by Hieu Vuong on 2023-04-18.
//

import SwiftUI

struct ProceedView: View {
    @ObservedObject private var viewModel: ProceedViewModel
    init(viewModel: ProceedViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        Color(.primaryAccent)
            .ignoresSafeArea()
            .overlay(
                ZStack {
                    Image("Background")
                        .resizable()
                        .opacity(0.5)
                        .aspectRatio(contentMode: .fit)
                    VStack {
                        Text("Do you want to view other regions?")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(Color(.titleText))
                        Spacer()
                        RoundedRectangle(cornerRadius: 30)
                            .frame(maxWidth: 400, maxHeight: 60)
                            .foregroundColor(Color(.primaryButton))
                            .overlay(
                                Text("Yes")
                                    .foregroundColor(.white)
                                    .bold()
                                    .font(.title)
                            )
                            .onTapGesture {
                                viewModel.onYes()
                            }
                        RoundedRectangle(cornerRadius: 30)
                            .frame(maxWidth: 400, maxHeight: 60)
                            .foregroundColor(Color(.primaryButton))
                            .overlay(
                                Text("Finish")
                                    .foregroundColor(.white)
                                    .bold()
                                    .font(.title)
                            )
                            .onTapGesture {
                                viewModel.onFinish()
                            }
                    }
                }
            )
                    
    }
}

struct ProceedView_Previews: PreviewProvider {
    static var previews: some View {
        ProceedView(viewModel: ProceedViewModel(onYes: {}, onFinish: {}))
    }
}
