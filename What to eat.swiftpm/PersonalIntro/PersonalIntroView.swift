//
//  SwiftUIView.swift
//  
//
//  Created by Hieu Vuong on 2023-04-17.
//

import SwiftUI

struct PersonalIntroView: View {
    @ObservedObject private var viewModel: PersonalIntroViewModel
    init(viewModel: PersonalIntroViewModel) {
        self.viewModel = viewModel
    }
    @State var introText: String = ""
    var body: some View {
        Color(.primaryAccent)
            .ignoresSafeArea()
            .overlay(
                VStack {
//                    Image("Background")
//                        .resizable()
//                        .opacity(0.5)
//                        .aspectRatio(contentMode: .fit)
                    Text("Trong Hieu Vuong")
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(Color(.titleText))
                    if (viewModel.continueOn) {
                        Rectangle()
                            .frame(maxWidth: 430, maxHeight: 600)
                            .foregroundColor(Color(.white))
                            .overlay(
                                VStack{
                                    Rectangle()
                                        .frame(width: 350, height: 350)
                                        .foregroundColor(Color(.white))
                                        .overlay{
                                                Image("Me")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .padding(.top, 10)
                                        }
                                    Text(introText)
                                        .font(.body)
                                        .padding([.leading, .trailing], 10)
                                    Text("Continue")
                                        .foregroundColor(Color(.primaryButton))
                                        .font(.title2)
                                        .padding([.bottom, .trailing], 20)
                                        .onTapGesture {
                                            viewModel.continueTapped()
                                            introText = viewModel.getIntro()
                                        }
                                        .foregroundColor(Color(.primaryAccent))
                                }
                            )
                    }
                    else {
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: 400, height: 60)
                            .foregroundColor(Color(.primaryButton))
                            .overlay(
                                Text("Next")
                                    .foregroundColor(.white)
                                    .bold()
                                    .font(.title)
                            )
                            .onTapGesture {
                                viewModel.moveNext()
                            }
                    }
                }
            )
            .onAppear {
                introText = viewModel.getIntro()
            }
    }
}

struct PersonalIntroView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalIntroView(viewModel: PersonalIntroViewModel(onContinue: {}))
    }
}
