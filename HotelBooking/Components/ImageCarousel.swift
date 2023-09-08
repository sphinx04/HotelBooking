//
//  ImageCarousel.swift
//  HotelBooking
//
//  Created by Sphinx04 on 04.09.23.
//

import SwiftUI

struct ImageCarousel: View {
    var urls: [String]
    var body: some View {
        TabView {
            ForEach(urls, id: \.self) { url in
                AsyncImage(url: URL(string: url)) { image in
                    image
                        .resizable()
                } placeholder: {
                    ProgressView()
                }
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .tabViewStyle(.page)
        .aspectRatio(4/3, contentMode: .fill)
    }
}
