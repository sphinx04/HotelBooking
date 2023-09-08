//
//  AboutHotelList.swift
//  HotelBooking
//
//  Created by Sphinx04 on 04.09.23.
//

import SwiftUI

struct AboutHotelList: View {
    let imageName: String
    let title: String
    let subtitle: String

    var body: some View {
        HStack {
            Image(imageName)
                .renderingMode(.template)
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundStyle(.primary)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                Text(subtitle)
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .foregroundStyle(.gray)
            }

            Spacer()

            Button {} label: {
                Image(systemName: "chevron.right")
                    .fontWeight(.medium)
            }
            .padding(.horizontal, 10)
        }
        .foregroundStyle(.primary)
        .padding(15)
    }
}
