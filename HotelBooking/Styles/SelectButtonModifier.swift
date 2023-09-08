//
//  ButtonModifier.swift
//  HotelBooking
//
//  Created by Sphinx04 on 04.09.23.
//

import SwiftUI

struct SelectButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16))
            .fontWeight(.medium)
            .padding(15)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

extension View {
    func selectButtonModifier() -> some View {
        modifier(SelectButtonModifier())
    }
}
