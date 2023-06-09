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
                        .padding(.top, 20)
                    ZStack{
                        ForEach(viewModel.getImages()) { image in
                            VStack{
                                Text(image.placeDescription)
                                    .font(.body)
                                    .bold()
                                    .multilineTextAlignment(.center)
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
                            .padding([.trailing, .leading], 20)
                            .overlay(
                                Text("Continue")
                                    .foregroundColor(.white)
                                    .bold()
                                    .font(.title)
                            )
                            .frame(width: 400, height: 60)
                            .onTapGesture {
                                playSound(sound: "clickButton", type: "wav")
                                viewModel.continueTapped()
                                self.introText = viewModel.getDescription()
                            }
                    }
                    else {
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(Color(.primaryButton))
                            .padding([.trailing, .leading], 20)
                            .overlay(
                                Text("Go to next page")
                                    .foregroundColor(.white)
                                    .bold()
                                    .font(.title)
                            )
                            .frame(maxWidth: 400, maxHeight: 60)
                            .onTapGesture {
                                playSound(sound: "clickButton", type: "wav")
                                viewModel.goToCuisinePage()
                            }
                    }
                }
            )
            .onAppear {
                playInfiniteSound(sound: viewModel.getRegion(), type: "mp3")
            }     
    }
}

struct AreaView_Previews: PreviewProvider {
    static var previews: some View {
        AreaView(viewModel: AreaViewModel(mode: .north, onContinue: {_ in }))
    }
}
