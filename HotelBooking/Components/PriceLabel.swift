//
//  PriceLabel.swift
//  HotelBooking
//
//  Created by Sphinx04 on 04.09.23.
//

import SwiftUI

struct PriceLabel: View {
    var priceText: String
    var priceForText: String

    init(_ priceText: String, for priceForText: String) {
        self.priceText = priceText
        self.priceForText = priceForText
    }

    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Text(priceText)
                .font(.system(size: 30))
                .fontWeight(.semibold)

            Text(priceForText)
                .font(.system(size: 16))
                .foregroundStyle(.gray)
        }
    }
}
