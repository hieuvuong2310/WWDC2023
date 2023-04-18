//
//  AreaView.swift
//  
//
//  Created by Hieu Vuong on 2023-04-09.
//

import SwiftUI

struct AreaView: View {
    @ObservedObject private var viewModel: AreaViewModel
    @State private var introText: String
    init(viewModel: AreaViewModel) {
        self.viewModel = viewModel
        self.introText = viewModel.getDescription()
    }
    var body: some View {
        Color(.primaryAccent)
            .ignoresSafeArea()
            .overlay(
                VStack{
                    Text(viewModel.getRegion())
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(Color(.primaryButton))
                    ZStack{
                        ForEach(viewModel.getImages()) { image in
                            VStack{
                                Text(image.placeDescription)
                                    .font(.body)
                                    .bold()
                                Image(image.placeName)
                                    .frame(maxWidth: 230)
                                Spacer()
                                Image(viewModel.getRegion())
                                    .frame(maxWidth: 405, maxHeight: 314)
                            }
                            ZStack{
                                Image("Character")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(.trailing, -200)
                                if (viewModel.isContinued()){
                                    Image(introText)
                                        .resizable()
                                        .frame(width: 237.6, height: 153, alignment: .leading)
                                        .aspectRatio(contentMode: .fit)
                                        .padding([.leading, .top], -150)
                                }
                            }
                        }
                    }
                    if (viewModel.isContinued()) {
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(Color(.primaryButton))
                            .overlay(
                                Text("Continue")
                                    .foregroundColor(.white)
                                    .bold()
                                    .font(.title)
                            )
                            .frame(maxWidth: 400, maxHeight: 50)
                            .onTapGesture {
                                viewModel.continueTapped()
                                self.introText = viewModel.getDescription()
                            }
                    }
                    else {
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(Color(.primaryButton))
                            .overlay(
                                Text("Go to next page")
                                    .foregroundColor(.white)
                                    .bold()
                                    .font(.title)
                            )
                            .frame(maxWidth: 400, maxHeight: 50)
                            .onTapGesture {
                                viewModel.goToCuisinePage()
                            }
                        
                    }
                }
        )
                    
    }
}

struct AreaView_Previews: PreviewProvider {
    static var previews: some View {
        AreaView(viewModel: AreaViewModel(mode: .middle, onContinue: {_ in }))
    }
}
