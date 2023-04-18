//
//  ChooseRegionView.swift
//  
//
//  Created by Hieu Vuong on 2023-04-17.
//

import SwiftUI

struct ChooseRegionView: View {
    @ObservedObject private var viewModel: ChooseRegionViewModel
    init(viewModel: ChooseRegionViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        Color(.primaryAccent)
            .ignoresSafeArea()
            .overlay(
                ZStack {
                    Image("Background")
                        .resizable()
                        .opacity(0.5)
                        .aspectRatio(contentMode: .fit)
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
        )
    }
}

struct ChooseRegionView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseRegionView(viewModel: ChooseRegionViewModel(onNorth: {}, onMiddle: {}, onSouth: {}))
    }
}
