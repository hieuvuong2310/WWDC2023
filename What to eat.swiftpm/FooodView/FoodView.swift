//
//  SwiftUIView.swift
//  
//
//  Created by Hieu Vuong on 2023-04-14.
//

import SwiftUI

struct FoodView: View {
    @State var animate: Bool = false
        let animation: Animation = Animation.linear(duration: 10.0).repeatForever(autoreverses: false)
    var body: some View {
        Color(.primaryAccent)
            .ignoresSafeArea()
            .overlay(
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
        )
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView()
    }
}
