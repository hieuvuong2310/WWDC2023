//
//  DetailedFoodView.swift
//  
//
//  Created by Hieu Vuong on 2023-04-17.
//

import SwiftUI

struct DetailedFoodView: View {
    @ObservedObject private var viewModel: DetailedFoodViewModel
    init(viewModel: DetailedFoodViewModel){
        self.viewModel = viewModel
    }
    var body: some View {
        VStack{
            Color(.primaryAccent)
                .ignoresSafeArea()
                .overlay(
                    ScrollView(.vertical){
                        VStack {
                            Text(viewModel.getFoodName())
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(Color(.titleText))
                                .multilineTextAlignment(.center)
                                .padding([.leading, .trailing, .top], 30)
                            RoundedRectangle(cornerRadius: 30)
                                .frame(width: 400, height: 400)
                                .foregroundColor(.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .frame(width: 300, height: 300)
                                        .foregroundColor(.white)
                                        .overlay {
                                            Image(viewModel.getFoodPicture())
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .padding(.top, 10)
                                        }
                                )
                            VStack{
                                Text("Ingredients")
                                    .font(.title)
                                    .foregroundColor(Color(.secondaryText))
                                    .bold()
                                Text(viewModel.getFoodIngredients())
                                    .font(.body)
                                Spacer()
                                    .frame(height: 30)
                                Text("Origin")
                                    .font(.title)
                                    .foregroundColor(Color(.secondaryText))
                                    .bold()
                                Text(viewModel.getFoodLocations())
                                    .font(.body)
                                Spacer()
                                    .frame(height: 30)
                                Text("Description")
                                    .font(.title)
                                    .foregroundColor(Color(.secondaryText))
                                    .bold()
                                Text(viewModel.getFoodDescription())
                                    .font(.body)
                                Spacer()
                                    .frame(height: 30)
                                RoundedRectangle(cornerRadius: 30)
                                    .frame(width: 350, height: 60)
                                    .padding(.bottom, 20)
                                    .foregroundColor(Color(.primaryButton))
                                    .overlay(
                                        Text("Done")
                                            .foregroundColor(.white)
                                            .bold()
                                            .font(.title)
                                            .padding(.bottom, 20)
                                    )
                                    .onTapGesture {
                                        playSound(sound: "clickButton", type: "wav")
                                        viewModel.onDismissButtonTapped()
                                    }
                            }
                            .padding([.leading, .trailing], 30)
                        }
                        .padding([.leading, .trailing], 30)
                    }
                )
        }
    }
}

struct DetailedFoodView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedFoodView(viewModel: DetailedFoodViewModel(cuisine: .init(id: UUID(), name: "Pho", ingredients: "beef, broth, rice noodle, bean sprout, hoisin sauce", foodDescription: .init(location: "This was created in 1980s", descriptionText: "A signature dish of Vietnam"), foodPicture: "Food1"), onDismiss: {}))
    }
}
