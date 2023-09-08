//
//  RatingLabelModifier.swift
//  HotelBooking
//
//  Created by Sphinx04 on 08.09.23.
//

import SwiftUI

struct RatingLabelModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .fontWeight(.medium)
            .font(.system(size: 16))
            .foregroundStyle(Color(red: 1, green: 168/255, blue: 0))
            .background {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundStyle(Color(red: 1, green: 199/255, blue: 0))
                    .opacity(0.2)
            }
    }
}

extension View {
    func ratingLabel() -> some View {
        modifier(RatingLabelModifier())
    }
}
