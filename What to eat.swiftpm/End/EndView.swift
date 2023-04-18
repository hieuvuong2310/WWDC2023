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
                        Text("I hope you enjoy my app!")
                            .font(.title2)
                        Spacer()
                        Image("Bye")
                    }
                }
            )
    }
}

struct EndView_Previews: PreviewProvider {
    static var previews: some View {
        EndView(viewModel: EndViewModel())
    }
}
