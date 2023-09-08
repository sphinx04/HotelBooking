//
//  ContentView.swift
//  HotelBooking
//
//  Created by Sphinx04 on 04.09.23.
//

import SwiftUI

struct HotelView: View {
    @StateObject var hotelViewModel = HotelViewModel()

    private func rating(of hotel: Hotel) -> some View {
        Text("★\(hotel.rating) \(hotel.ratingName)")
            .ratingLabel()
    }

    private func aboutSection(of hotel: Hotel) -> some View {
        VStack (alignment: .leading, spacing: 15) {
            Text("Об отеле")
                .font(.system(size: 22))
                .fontWeight(.medium)
                .padding(.top, 10)

            TagCloud(tags: hotel.aboutTheHotel.peculiarities)

            Text(hotel.aboutTheHotel.description)
                .font(.system(size: 16))

            VStack {
                AboutHotelList(imageName: "emoji-happy", title: "Удобства", subtitle: "Самое необходимое")
                Divider()
                    .padding(.horizontal)
                AboutHotelList(imageName: "tick-square", title: "Что включено", subtitle: "Самое необходимое")
                Divider()
                    .padding(.horizontal)
                AboutHotelList(imageName: "close-square", title: "Что не включено", subtitle: "Самое необходимое")
            }
            .background {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundStyle(Color.backgroundLightGray)
            }
        }
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(hotelViewModel.hotels, id: \.id) { hotel in
                        VStack(alignment: .leading, spacing: 15) {
                            ImageCarousel(urls: hotel.imageUrls)
                            rating(of: hotel)
                            HotelTitle(hotelName: hotel.name,
                                       hotelAddress: hotel.address)
                            PriceLabel("от \(hotel.minimalPrice.formattedWithSeparator) ₽",
                                       for: hotel.priceForIt)
                        } //VSTACK
                        
                        Divider()
                        
                        // MARK: - About
                        aboutSection(of: hotel)

                        NavigationLink {
                            RoomView(hotel: hotel)
                                .toolbarRole(.editor)
                        } label: {
                            Text("К выбору номера")
                                .selectButtonModifier()
                        }
                    } //FOREACH
                } //VSTACK
                .padding(.horizontal, 15)
            } //SCROLLVIEW
            .navigationTitle("Отель")
            .navigationBarTitleDisplayMode(.inline)
        } //NAVIGATIONSTACK
        .tint(.primary)
    }
}

struct HotelView_Previews: PreviewProvider {
    static var previews: some View {
        HotelView()
    }
}
