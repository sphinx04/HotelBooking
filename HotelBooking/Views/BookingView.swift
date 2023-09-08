//
//  BookingView.swift
//  HotelBooking
//
//  Created by Sphinx04 on 04.09.23.
//

import SwiftUI

struct BookingView: View {
    @StateObject var viewModel = BookingViewModel()
    @State var isFormsValid = false
    @FocusState private var isFocused: Bool

    var body: some View {
        NavigationStack {
            if let booking = viewModel.booking {
                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        // MARK: - Title
                        Text("★\(booking.horating) \(booking.ratingName)")
                            .ratingLabel()
                        HotelTitle(hotelName: booking.hotelName,
                                   hotelAddress: booking.hotelAdress)
                        // MARK: - Booking
                        bookingInfo(booking)
                        
                        // MARK: - Contacts
                        Divider()
                        
                        Text("Информация о покупателе")
                            .font(.system(size: 22, weight: .medium))
                        
                        FloatingLabelInput(placeholder: "Номер телефона",
                                           text: $viewModel.phoneNumber,
                                           fieldType: .phoneNumber,
                                           isValid: $viewModel.validation.phoneNumber)
                        .keyboardType(.phonePad)

                        FloatingLabelInput(placeholder: "Почта",
                                           text: $viewModel.email,
                                           isValid: $viewModel.validation.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)

                        Text("Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту")
                            .font(.system(size: 14))
                            .foregroundStyle(.secondary)
                        
                        ForEach($viewModel.tourists) { tourist in
                            
                            TouristInfo(tourist: tourist, expanded: tourist.id == 0, touristValidation: $viewModel.validation.tourists[tourist.id])
                        }
                        
                        HStack {
                            Text("Добавить туриста")
                                .font(.system(size: 22, weight: .medium))
                            Spacer()
                            Button {
                                withAnimation {
                                    viewModel.addTourist()
                                }
                            } label: {
                                Image(systemName: "plus")
                                    .fontWeight(.semibold)
                            }
                            .frame(width: 32, height: 32)
                            .foregroundStyle(.white)
                            .padding(5)
                            .background(RoundedRectangle(cornerRadius: 6)
                                .foregroundStyle(.blue))
                        }
                        .tint(.primary)
                        
                        VStack(spacing: 15) {
                            HStack {
                                Text("Тур")
                                    .font(.system(size: 16))
                                    .foregroundStyle(.secondary)
                                Spacer()
                                Text("\(booking.tourPrice.formattedWithSeparator) ₽")
                            }
                            HStack {
                                Text("Топливный сбор")
                                    .font(.system(size: 16))
                                    .foregroundStyle(.secondary)
                                Spacer()
                                Text("\(booking.fuelCharge.formattedWithSeparator) ₽")
                            }
                            HStack {
                                Text("Сервисный сбор")
                                    .font(.system(size: 16))
                                    .foregroundStyle(.secondary)
                                Spacer()
                                Text("\(booking.serviceCharge.formattedWithSeparator) ₽")
                            }
                            HStack {
                                Text("К оплате")
                                    .font(.system(size: 16))
                                    .foregroundStyle(.secondary)
                                Spacer()
                                Text("\(booking.totalPrice.formattedWithSeparator) ₽")
                                    .foregroundStyle(.blue)
                            }
                        } //VSTACK
                        
                        
                        Button("Оплатить \(booking.totalPrice.formattedWithSeparator) ₽") {
                            isFormsValid = viewModel.validate()
                        }
                        .selectButtonModifier()
                        
                        
                    } //VSTACK
                    .padding(15)
                    .focused($isFocused)
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button("Done") {
                                isFocused = false
                            }
                        }
                    }
                } //SCROLLVIEW
                .navigationTitle("Бронирование")
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(isPresented: $isFormsValid) {
                    PurchaseView()
                        .toolbarRole(.editor)
                }
            } //NAVIGATIONSTACK
        }
    }

    private func bookingInfo(_ booking: Booking) -> some View {
        var nightsString: String {
            if booking.numberOfNights > 4 && booking.numberOfNights <= 20 {
                return "ночей"
            } else if booking.numberOfNights % 10 == 1 {
                return "ночь"
            } else if booking.numberOfNights % 10 < 5 {
                return "ночи"
            } else {
                return "ночей"
            }
        }

        return VStack(spacing: 15) {
            BookingInfoRow(rowLabel: "Вылет из",
                           valueLabel: booking.departure)

            BookingInfoRow(rowLabel: "Страна, город",
                           valueLabel: booking.arrivalCountry)

            BookingInfoRow(rowLabel: "Даты",
                           valueLabel: "\(booking.tourDateStart) - \(booking.tourDateStop)")

            BookingInfoRow(rowLabel: "Кол-во ночей",
                           valueLabel: "\(booking.numberOfNights) \(nightsString)")

            BookingInfoRow(rowLabel: "Отель",
                           valueLabel: booking.hotelName)

            BookingInfoRow(rowLabel: "Номер",
                           valueLabel: booking.room)

            BookingInfoRow(rowLabel: "Питание",
                           valueLabel: booking.nutrition)
        } //VSTACK
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView()
    }
}
