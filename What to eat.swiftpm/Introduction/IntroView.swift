//
//  SwiftUIView.swift
//  
//
//  Created by Hieu Vuong on 2023-03-31.
//

import SwiftUI

struct IntroView: View {
    @ObservedObject private var viewModel: IntroViewModel = IntroViewModel()
    @State var text: String = ""
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
                                                VStack {
                                                    Text(text).animation(.easeIn)
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
                                            text = ""
                                            introText.enumerated().forEach { index, character in
                                                    DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.05) {
                                                      text += String(character)
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
                text = ""
                introText.enumerated().forEach { index, character in
                        DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.05) {
                          text += String(character)
                        }
                      }
            }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
