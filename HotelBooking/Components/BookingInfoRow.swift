//
//  BookingInfoRow.swift
//  HotelBooking
//
//  Created by Sphinx04 on 05.09.23.
//

import SwiftUI

struct BookingInfoRow: View {
    let rowLabel: String
    let valueLabel: String

    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Text(rowLabel)
                .font(.system(size: 16))
                .foregroundStyle(.secondary)
                .frame(width: 150, alignment: .leading)
            Text(valueLabel)
                .font(.system(size: 16))
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}
