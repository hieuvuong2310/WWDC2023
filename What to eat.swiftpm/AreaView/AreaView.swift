//
//  SwiftUIView.swift
//  
//
//  Created by Hieu Vuong on 2023-04-09.
//

import SwiftUI

struct AreaView: View {
    @ObservedObject private var viewModel: AreaViewModel
    init(viewModel: AreaViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        ForEach(viewModel.getImages()) { image in
            VStack{
                Text(image.placeName)
                Text(image.placeDescription)
            }
        }
    }
}

struct AreaView_Previews: PreviewProvider {
    static var previews: some View {
        AreaView(viewModel: AreaViewModel(mode: .north))
    }
}
