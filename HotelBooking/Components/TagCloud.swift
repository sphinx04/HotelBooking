//
//  TagCloud.swift
//  HotelBooking
//
//  Created by Sphinx04 on 04.09.23.
//

import SwiftUI

struct TagCloud: View {
    var tags: [String]
    var body: some View {
        WrappedHStack(tags) { tag in
            Text(tag)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .lineLimit(1)
                .fontWeight(.medium)
                .font(.system(size: 14))
                .foregroundStyle(.gray)
                .background {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundStyle(Color.backgroundLightGray)
                }
                .padding(.horizontal, 2)
                .padding(.vertical, 2)
        }
    }
}
