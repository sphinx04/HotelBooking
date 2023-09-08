//
//  HotelViewModel.swift
//  HotelBooking
//
//  Created by Sphinx04 on 04.09.23.
//

import SwiftUI
import Combine

final class HotelViewModel: ObservableObject {
    @Published var hotels = [Hotel]()
    var cancellables = Set<AnyCancellable>()

    init() {
        getHotel()
    }

    func getHotel() {
        guard let url = URL(string: ApiConstants.hotelAPI) else { return }

        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryMap { (data, response) -> Data in
                guard
                    let response = response as? HTTPURLResponse,
                    response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: Hotel.self, decoder: JSONDecoder())
            .sink { completion in
                print("Completed")
            } receiveValue: { [weak self] hotel in
                self?.hotels.append(hotel)
            }
            .store(in: &cancellables)
    }
}

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        return formatter
    }()
}
extension Numeric {
    var formattedWithSeparator: String { Formatter.withSeparator.string(for: self) ?? "" }
}
