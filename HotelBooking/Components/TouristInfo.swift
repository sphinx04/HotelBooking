//
//  TouristInfo.swift
//  HotelBooking
//
//  Created by Sphinx04 on 05.09.23.
//

import SwiftUI

struct TouristInfo: View {
    @Binding var tourist: Tourist
    @State var expanded = false
    @Binding var touristValidation: TouristValidation

    var labelText: String {
        switch tourist.id {
            case 0:
                return "Первый турист"
            case 1:
                return "Второй турист"
            case 2:
                return "Третий турист"
            default:
                return "\(tourist.id + 1)-й турист"
        }
    }

    var body: some View {
        DisclosureGroup(isExpanded: $expanded) {
            VStack {
                FloatingLabelInput(placeholder: "Имя",
                                   text: $tourist.firstName,
                                   isValid: $touristValidation.firstName)
                FloatingLabelInput(placeholder: "Фамилия",
                                   text: $tourist.lastName,
                                   isValid: $touristValidation.lastName)
                FloatingLabelInput(placeholder: "Дата рождения",
                                   text: $tourist.dateOfBirth,
                                   fieldType: .date, isValid: $touristValidation.dateOfBirth)
                .keyboardType(.numberPad)
                FloatingLabelInput(placeholder: "Гражданство",
                                   text: $tourist.residency,
                                   isValid: $touristValidation.residency)
                FloatingLabelInput(placeholder: "Номер загранпаспорта",
                                   text: $tourist.passportNumber,
                                   isValid: $touristValidation.passportNumber)
                .keyboardType(.numberPad)
                FloatingLabelInput(placeholder: "Срок действия загранпаспорта",
                                   text: $tourist.passportExpiration, fieldType: .date,
                                   isValid: $touristValidation.passportExpiration)
                .keyboardType(.numberPad)
            }
        } label: {
            HStack {
                Text(labelText)
                    .font(.system(size: 22, weight: .medium))
                if !(touristValidation.isValid ?? true) && !expanded {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundStyle(.red.opacity(0.8))
                }

                Spacer()
                Button {
                    withAnimation {
                        expanded.toggle()
                    }
                } label: {
                    Image(systemName: "chevron.down")
                        .fontWeight(.semibold)
                        .rotationEffect(.degrees(expanded ? 180 : 0))
                }
                .frame(width: 32, height: 32)
                .foregroundStyle(.blue)
                .padding(5)
                .background(RoundedRectangle(cornerRadius: 6)
                    .foregroundStyle(.blue.opacity(0.1)))
            }
            .tint(.primary)
        }
        .disclosureGroupStyle(CustomDisclosureStyle())
    }
}
