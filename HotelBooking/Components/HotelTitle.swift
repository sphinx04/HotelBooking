//
//  HotelTitle.swift
//  HotelBooking
//
//  Created by Sphinx04 on 04.09.23.
//

import SwiftUI

struct HotelTitle: View {
    let hotelName: String
    let hotelAddress: String

    var body: some View {
        Group {
        Text(hotelName)
            .font(.system(size: 22))

        Text(hotelAddress)
            .font(.system(size: 14))
            .foregroundStyle(.blue)
    }
    .fontWeight(.medium)
    }
}
