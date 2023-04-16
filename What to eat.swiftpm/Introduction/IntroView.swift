//
//  SwiftUIView.swift
//  
//
//  Created by Hieu Vuong on 2023-03-31.
//

import SwiftUI

struct IntroView: View {
    @ObservedObject private var viewModel: IntroViewModel
    init(viewModel: IntroViewModel) {
        self.viewModel = viewModel
    }
    @State var greetingText: String = ""
    @State var introText: String = ""
    var body: some View {
        Color(.primaryAccent)
            .ignoresSafeArea()
            .overlay(
                ZStack {
                    Image("Background")
                        .resizable()
                        .opacity(0.5)
                        .aspectRatio(contentMode: .fit)
                    if (viewModel.continueOn) {
                        Rectangle()
                            .frame(maxWidth: 430, maxHeight: 200)
                            .foregroundColor(Color(.secondaryAccent))
                            .overlay(
                                VStack (alignment: .trailing){
                                    Rectangle()
                                        .frame(maxWidth: 400, maxHeight: 150)
                                        .foregroundColor(Color(.secondaryAccent))
                                        .overlay(alignment: .topLeading){
                                            HStack{
                                                
                                                Image("Avatar")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .padding(.top, 10)
                                                VStack {
                                                    Text(greetingText).animation(.easeIn)
                                                }
                                            }
                                        }
                                    Text("Continue")
                                        .foregroundColor(Color(.primaryButton))
                                        .font(.title2)
                                        .padding([.bottom, .trailing], 20)
                                        .onTapGesture {
                                            viewModel.continueTapped()
                                            let introText = viewModel.getIntro()
                                            greetingText = ""
                                            introText.enumerated().forEach { index, character in
                                                    DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.05) {
                                                        greetingText += String(character)
                                                    }
                                                  }
                                        }
                                        .foregroundColor(Color(.primaryAccent))
                                }
                            )
                    }
                    else {
                        VStack{
                            RoundedRectangle(cornerRadius: 20)
                                .frame(maxWidth: 300, maxHeight: 100)
                                .foregroundColor(Color(.primaryButton))
                                .overlay(
                                    Text("North")
                                        .bold()
                                        .fontWeight(.heavy)
                                        .foregroundColor(.white)
                                        .font(.title)
                                )
                                .onTapGesture {
                                    viewModel.northTapped()
                                }
                            RoundedRectangle(cornerRadius: 20)
                                .frame(maxWidth: 300, maxHeight: 100)
                                .foregroundColor(Color(.primaryButton))
                                .overlay(
                                    Text("Middle")
                                        .bold()
                                        .fontWeight(.heavy)
                                        .foregroundColor(.white)
                                        .font(.title)
                                )
                                .onTapGesture {
                                    viewModel.middleTapped()
                                }
                            RoundedRectangle(cornerRadius: 20)
                                .frame(maxWidth: 300, maxHeight: 100)
                                .foregroundColor(Color(.primaryButton))
                                .overlay(
                                    Text("South")
                                        .bold()
                                        .fontWeight(.heavy)
                                        .foregroundColor(.white)
                                        .font(.title)
                                )
                                .onTapGesture {
                                    viewModel.southTapped()
                                }
                        }
                    }
                }
            )
            .onAppear {
                let introText = viewModel.getIntro()
                greetingText = ""
                introText.enumerated().forEach { index, character in
                        DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.05) {
                            greetingText += String(character)
                        }
                      }
            }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView(viewModel: IntroViewModel(onNorth: {}, onMiddle: {}, onSouth: {}))
    }
}
