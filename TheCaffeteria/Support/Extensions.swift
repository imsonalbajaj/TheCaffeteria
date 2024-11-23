//
//  Extensions.swift
//  TheCaffeteria
//
//  Created by Sonal on 20/11/24.
//

import SwiftUI

extension Color {
    static func getColor(color: CustomColor) -> Color {
        switch color {
        case .dark48:
            return Color(red: 48 / 255, green: 48 / 255, blue: 48 / 255)
            
        case .dark96:
            return Color(red: 96 / 255, green: 96 / 255, blue: 96 / 255)
            
        case .dark144:
            return Color(red: 144 / 255, green: 144 / 255, blue: 144 / 255)
            
        case .dark151:
            return Color(red: 151 / 255, green: 151 / 255, blue: 151 / 255)
            
        case .dark216:
            return Color(red: 216 / 255, green: 216 / 255, blue: 216 / 255)
            
        case .mbGreenSelectedBorder:
            return Color(red: 0 / 255, green: 150 / 255, blue: 129 / 255)
            
        case .mbGreenSelectedBackGround:
            return Color(red: 237 / 255, green: 250 / 255, blue: 249 / 255)
            
        case .primaryRed:
            return Color(red: 216 / 255, green: 35 / 255, blue: 42 / 255)
            
        case .secondaryRed:
            return Color(red: 226 / 255, green: 76 / 255, blue: 82 / 255)
            
        case .foodPrimaryGreen:
            return Color(red: 66 / 255, green: 134 / 255, blue: 18 / 255)
            
        case .ratingYellow:
            return Color(red: 254 / 255, green: 236 / 255, blue: 55 / 255)
        }
        // pallette green - rgb(155, 184, 153)
    }
}
