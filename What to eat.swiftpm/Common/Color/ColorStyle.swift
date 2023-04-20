//
//
//  
//
//  Created by Hieu Vuong on 2023-03-31.
//

import Foundation
import SwiftUI

enum ColorStyle: String {
    case primaryAccent
    case secondaryAccent
    case titleText
    case primaryButton
    case secondaryText
}

extension Color {
    init(_ colorStyle: ColorStyle) {
        self = .init(colorStyle.rawValue)
    }
}
