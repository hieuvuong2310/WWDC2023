//
//  EndView.swift
//  
//
//  Created by Hieu Vuong on 2023-04-18.
//

import SwiftUI

struct EndView: View {
    @ObservedObject private var viewModel: EndViewModel
    init(viewModel: EndViewModel){
        self.viewModel = viewModel
    }
    var body: some View {
        Color(.primaryAccent)
            .ignoresSafeArea()
            .overlay(
                ZStack{
                    Image("Background")
                        .resizable()
                        .opacity(0.5)
                        .aspectRatio(contentMode: .fit)
                    VStack {
                        Text("Thank you for your time!")
                            .font(.largeTitle)
                            .foregroundColor(Color(.titleText))
                            .bold()
                            .multilineTextAlignment(.center)
                            .padding([.top, .leading, .trailing], 20)
                        Text("I hope you enjoy my app!")
                            .font(.title2)
                            .padding([.leading, .trailing], 20)
                        Spacer()
                        Image("Bye")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        RoundedRectangle(cornerRadius: 30)
                            .frame(maxWidth: 400, maxHeight: 60)
                            .foregroundColor(Color(.primaryButton))
                            .padding([.leading, .trailing, .bottom], 20)
                            .overlay(
                                Text("Restart")
                                    .foregroundColor(.white)
                                    .bold()
                                    .font(.title)
                                    .padding(.bottom, 20)
                            )
                            .onTapGesture {
                                playSound(sound: "clickButton", type: "wav")
                                viewModel.onRestartTapped()
                            }
                    }
                }
            )
    }
}

struct EndView_Previews: PreviewProvider {
    static var previews: some View {
        EndView(viewModel: EndViewModel(onRestart: {}))
    }
}
