//
//  File.swift
//  
//
//  Created by Hieu Vuong on 2023-03-31.
//

import Foundation
import SwiftUI

enum ColorStyle: String {
    case primaryAccent // Swift will automatically synthesize cases and rawValue would be exactly "primaryAccent"
    case secondaryAccent
    case titleText
    case primaryButton
    case caption
    case secondaryText
}

extension Color {
    init(_ colorStyle: ColorStyle) {
        self = .init(colorStyle.rawValue)
    }
}
