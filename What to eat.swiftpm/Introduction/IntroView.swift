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
                                                    Text(introText)
                                                }
                                            }
                                        }
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

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView(viewModel: IntroViewModel(onContinue: {}))
    }
}
