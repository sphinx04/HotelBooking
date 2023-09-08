//
//  ColorExtension.swift
//  HotelBooking
//
//  Created by Sphinx04 on 08.09.23.
//

import SwiftUI

extension Color {
    static var backgroundGray: Color {
        let opaqueR = 246.0
        let opaqueG = 246.0
        let opaqueB = 249.0

        let a = 0.2
        let r = 255 - (255 - opaqueR) / a
        let g = 255 - (255 - opaqueG) / a
        let b = 255 - (255 - opaqueB) / a
        return Color(red: r/255, green: g/255, blue: b/255).opacity(a)
    }

    static var backgroundLightGray: Color {
        let opaqueR = 251.0
        let opaqueG = 251.0
        let opaqueB = 252.0

        let a = 0.2
        let r = 255 - (255 - opaqueR) / a
        let g = 255 - (255 - opaqueG) / a
        let b = 255 - (255 - opaqueB) / a
        return Color(red: r/255, green: g/255, blue: b/255).opacity(a)
    }
    static let backgroundRed = Color(red: 235/255, green: 87/255, blue: 87/255).opacity(0.15)
}
