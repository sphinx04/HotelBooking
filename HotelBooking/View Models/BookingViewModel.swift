//
//  БоокингВиешМодел.swift
//  HotelBooking
//
//  Created by Sphinx04 on 04.09.23.
//

import SwiftUI
import Combine

final class BookingViewModel: ObservableObject {
    @Published var booking: Booking?
    @Published var tourists = [Tourist]()
    @Published var phoneNumber = ""
    @Published var email = ""
    @Published var validation = Validation()

    var cancellables = Set<AnyCancellable>()

    init() {
        getBooking()
        addTourist()
    }

    func validate() -> Bool {
        validation.email = email.isValidEmail()
        validation.phoneNumber = phoneNumber.count == 18
        for i in 0..<tourists.count {
            validation.tourists[i].dateOfBirth         = tourists[i].dateOfBirth.count == 10
            validation.tourists[i].firstName           = !tourists[i].firstName.isEmpty
            validation.tourists[i].lastName            = !tourists[i].lastName.isEmpty
            validation.tourists[i].passportExpiration  = !tourists[i].passportExpiration.isEmpty
            validation.tourists[i].passportNumber      = !tourists[i].passportNumber.isEmpty
            validation.tourists[i].residency           = !tourists[i].residency.isEmpty
        }
        return validation.isValid
    }

    func addTourist() {
        tourists.append(Tourist(id: tourists.count))
        validation.tourists.append(TouristValidation())
    }

    private func getBooking() {
        guard let url = URL(string: ApiConstants.bookingAPI) else { return }

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
            .decode(type: Booking.self, decoder: JSONDecoder())
            .sink { completion in
                print("Completed")
            } receiveValue: { [weak self] booking in
                self?.booking = booking
            }
            .store(in: &cancellables)
    }
}
