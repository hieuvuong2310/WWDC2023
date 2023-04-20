//
//  FoodView.swift
//  
//
//  Created by Hieu Vuong on 2023-04-14.
//

import SwiftUI

struct FoodView: View {
    @ObservedObject private var viewModel: FoodViewModel
    init(viewModel: FoodViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        Color(.primaryAccent)
            .ignoresSafeArea()
            .overlay(
                VStack {
                    Text("Signature dishes in your region")
                        .bold()
                        .padding([.top, .trailing, .leading], 30)
                        .font(.largeTitle)
                        .foregroundColor(Color(.titleText))
                        .multilineTextAlignment(.center)
                        .minimumScaleFactor(0.1)
                    Spacer()
                        .frame(height: 30)
                    Text("Please scroll horizontally to view the list of options.")
                        .font(.body)
                        .bold()
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(.secondaryText))
                    ScrollView(.horizontal) {
                        HStack(spacing: 5) {
                            ForEach(viewModel.getListOfCuisine()) { cuisine in
                                FoodCell(cuisine: cuisine)
                                    .onTapGesture {
                                        playSound(sound: "clickButton", type: "wav")
                                        viewModel.onFoodCardTaped(cuisine: cuisine)
                                    }
                                
                            }
                        }
                    }.font(.largeTitle)
                    HStack {
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(Color(.primaryButton))
                            .frame(maxWidth: 150, maxHeight: 70)
                            .overlay(
                                Text("Done")
                                    .bold()
                                    .font(.title)
                                    .foregroundColor(.white)
                            )
                            .onTapGesture {
                                playSound(sound: "clickButton", type: "wav")
                                viewModel.onDoneTapped()
                            }
                        Image("Walking")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    
                }
            )
            .sheet(item: Binding(
                get: { viewModel.destination },
                set: { _ in viewModel.resetDestination()}
            )
            ) { destination in
                switch destination {
                case .open(let viewModel):
                    DetailedFoodView(viewModel: viewModel)
                }
            }
    }
}
struct FoodCell: View {
    var cuisine: Cuisine
    init(cuisine: Cuisine) {
        self.cuisine = cuisine
    }
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .frame(width: 350, height: 500)
            .foregroundColor(.white)
            .overlay {
                VStack(spacing: 30) {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(maxWidth: 300, maxHeight: 300)
                        .foregroundColor(.white)
                        .overlay {
                            VStack(spacing: 20){
                                Image(cuisine.foodPicture)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(.top, 10)
                                Text(cuisine.name)
                                    .bold()
                                    .font(.largeTitle)
                                    .foregroundColor(Color(.titleText))
                                    .multilineTextAlignment(.center)
                            }
                        }
                    Text(cuisine.ingredients)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding([.trailing, .leading], 10)
                }
            }
            .padding([.leading, .trailing], 20)
        
    }
}
struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView(viewModel: FoodViewModel(cuisines: [.init(id: UUID(), name: "Pho", ingredients: "beef, broth, rice noodle, bean sprout, hoisin sauce", foodDescription: .init(location: "This was created in 1980s", descriptionText: "A signature dish of Vietnam"), foodPicture: "Food1"), .init(id: UUID(), name: "Shrimp paste with noodle", ingredients: "beef, broth, rice noodle, bean sprout, hoisin sauce", foodDescription: .init(location: "This was created in 1980s", descriptionText: "A signature dish of Vietnam"), foodPicture: "Food2"), .init(id: UUID(), name: "Grill porkloaf with vermicelli", ingredients: "beef, broth, rice noodle, bean sprout, hoisin sauce", foodDescription: .init(location: "This was created in 1980s", descriptionText: "A signature dish of Vietnam"), foodPicture: "Food3")], onDone: {}))
    }
}
