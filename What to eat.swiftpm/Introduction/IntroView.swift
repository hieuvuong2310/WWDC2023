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
    var body: some View {
        Color(.primaryAccent)
            .ignoresSafeArea()
            .overlay(
                VStack {
                    Rectangle()
                        .frame(maxWidth: 430, maxHeight: 150)
                        .foregroundColor(Color(.secondaryAccent))
                        .overlay(alignment: .topLeading){
                            HStack{
                                
                                Image("Avatar")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                Text(text).animation(.spring())
//                                Text("Hi! Welcome to What to eat in Vietnam. Following this app will help you ")
//                                    .bold()
//                                    .multilineTextAlignment(.leading)
//                                printMessage(message: "Hi! Welcome to What to eat in Vietnam. Following this app will help you")
                            }
                        
                        }
                    
                }
            )
            .onAppear {
                let introText = viewModel.getIntro(index: 0)
                text = ""
                introText.enumerated().forEach { index, character in
                        DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.1) {
                          text += String(character)
                        }
                      }
            }
    }

//    func printMessage(message: String?, delay: TimeInterval = 1) {
//            let splits = message?.split(separator: " ", maxSplits: 1)
//            print(splits?.first)
//            DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {[weak self] in
//                guard splits?.count == 2 else {
//                    return
//                }
//                self?.printMessage(message: String(splits?.last ?? ""))
//            })
//        }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
