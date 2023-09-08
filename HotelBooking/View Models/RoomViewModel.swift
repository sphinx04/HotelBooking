//
//  RoomViewModel.swift
//  HotelBooking
//
//  Created by Sphinx04 on 04.09.23.
//

import SwiftUI
import Combine

final class RoomViewModel: ObservableObject {
    @Published var rooms = [Room]()
    var cancellables = Set<AnyCancellable>()

    init() {
        getRooms()
    }

    func getRooms() {
        guard let url = URL(string: ApiConstants.roomsAPI) else { return }

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
            .decode(type: Rooms.self, decoder: JSONDecoder())
            .sink { completion in
                print("Completed \(completion)")
            } receiveValue: { [weak self] returnedRooms in
                self?.rooms = returnedRooms.rooms
            }
            .store(in: &cancellables)
    }
}
