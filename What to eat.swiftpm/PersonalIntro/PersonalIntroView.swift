//
//  PersonalIntroView.swift
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
                    Text("Trong Hieu Vuong")
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(Color(.titleText))
                    if (viewModel.continueOn) {
                        VStack{
                            RoundedRectangle(cornerRadius: 50)
                                .frame(width: 300, height: 300)
                                .foregroundColor(Color(.primaryAccent))
                                .overlay{
                                    Image("Me")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding(.top, 10)
                                        .cornerRadius(50)
                                }
                            Spacer()
                                .frame(maxHeight: 30)
                            Text(introText)
                                .font(.body)
                                .padding([.leading, .trailing], 20)
                                .multilineTextAlignment(.center)
                            Spacer()
                                .frame(maxHeight: 30)
                            RoundedRectangle(cornerRadius: 30)
                                .frame(maxWidth: 400, maxHeight: 60)
                                .foregroundColor(Color(.primaryButton))
                                .overlay {
                                    Text("Continue")
                                        .bold()
                                        .font(.title)
                                        .foregroundColor(.white)
                                }
                                .onTapGesture {
                                    viewModel.continueTapped()
                                    introText = viewModel.getIntro()
                                }
                        }
                    }
                    else {
                        VStack {
                            Text("Now, shall we discover together?.....")
                                .font(.title2)
                                .bold()
                                .foregroundColor(Color(.secondaryText))
                            RoundedRectangle(cornerRadius: 30)
                                .frame(maxWidth: 400, maxHeight: 60)
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
