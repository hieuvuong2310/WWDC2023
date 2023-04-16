//
//  SwiftUIView.swift
//  
//
//  Created by Hieu Vuong on 2023-04-14.
//

import SwiftUI

struct FoodView: View {
    @ObservedObject private var viewModel: FoodViewModel
    @State var animate: Bool = false
        let animation: Animation = Animation.linear(duration: 10.0).repeatForever(autoreverses: false)
    init(viewModel: FoodViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        Color(.primaryAccent)
            .ignoresSafeArea()
            .overlay(
                VStack{
                    Text(viewModel.getText())
                    GeometryReader { geo in
                        HStack(spacing: -1) {
                            Image("Flight")
                                .aspectRatio(contentMode: .fit)
                            
                            Image("Avatar")
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geo.size.width, alignment: .leading)
                                .onTapGesture {
                                    print("Hi")
                                }
                            Image("Character")
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geo.size.width, alignment: .leading)
                                .onTapGesture {
                                    print("Hi")
                                }
                            
                        }
                        .frame(width: geo.size.width, height: geo.size.height,
                               alignment: animate ? .trailing : .leading)
                    }
                    .ignoresSafeArea()
                    .onAppear {
                        withAnimation(animation) {
                            animate.toggle()
                        }
                    }
                }
        )
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView(viewModel: FoodViewModel(mode: .north))
    }
}
