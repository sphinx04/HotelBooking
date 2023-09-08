//
//  RoomView.swift
//  HotelBooking
//
//  Created by Sphinx04 on 04.09.23.
//

import SwiftUI

struct RoomView: View {
    @StateObject var roomsViewModel = RoomViewModel()
    let hotel: Hotel?

    init(hotel: Hotel? = nil) {
        self.hotel = hotel
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(roomsViewModel.rooms, id: \.id) { room in
                        VStack(alignment: .leading) {
                            // MARK: - Images
                            ImageCarousel(urls: room.imageUrls)
                            
                            // MARK: - Title
                            Text(room.name)
                                .font(.system(size: 22))
                                .fontWeight(.medium)
                            
                            // MARK: -
                            TagCloud(tags: room.peculiarities)
                            Button {} label: {
                                HStack {
                                    Text("Подробнее о номере")
                                    Image(systemName: "chevron.right")
                                }
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .lineLimit(1)
                                .fontWeight(.medium)
                                .font(.system(size: 14))
                                .foregroundStyle(.blue)
                                .background {
                                    RoundedRectangle(cornerRadius: 5)
                                        .foregroundStyle(.blue)
                                        .opacity(0.1)
                                }
                                .padding(.horizontal, 2)
                            }
                            // MARK: - Price
                            PriceLabel("\(room.price.formattedWithSeparator) ₽",
                                       for: room.pricePer.lowercased())

                            NavigationLink {
                                BookingView()
                                    .toolbarRole(.editor)
                            } label: {
                                Text("Выбрать номер")
                                    .selectButtonModifier()
                            }

                            Divider()
                        }
                    } //FOREACH
                } //VSTACK
                .padding(.horizontal, 15)
            } //SCROLLVIEW
            .navigationTitle(hotel?.name ?? "Hotel")
            .navigationBarTitleDisplayMode(.inline)
        } //NAVIGATIONSTACK
    }
}

struct RoomView_Previews: PreviewProvider {
    static var previews: some View {
        RoomView()
    }
}
