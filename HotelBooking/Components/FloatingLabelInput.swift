//
//  FloatingLabelInput.swift
//  HotelBooking
//
//  Created by Sphinx04 on 05.09.23.
//

import SwiftUI

enum FieldType {
    case phoneNumber
    case date
}

struct FloatingLabelInput: View {
    @State var placeholder = ""
    @Binding var text: String
    var fieldType: FieldType? = nil
    @Binding var isValid: Bool?

    var body: some View {
        ZStack(alignment: .leading) {
            Text(self.placeholder)
                .foregroundColor(self.text.isEmpty ? Color.gray : Color.gray.opacity(0.5))
                .offset(x: 0,
                        y: self.text.isEmpty ? 0 : -20)
                .scaleEffect(self.text.isEmpty ? 1 : 0.8, anchor: .topLeading)
                .animation(.easeIn(duration: 0.1), value: text)
            TextField("", text: self.$text)
                .font(.system(size: 17))
                .onChange(of: text) { oldValue, newValue in
                    switch fieldType {
                        case .phoneNumber:
                            guard abs(newValue.count - oldValue.count) == 1
                            else { return }
                            if newValue.count > oldValue.count {
                                if oldValue.isEmpty {
                                    text = "+7 " + newValue
                                    //"+7 (***) ***-**-**"
                                    // 012345678901234567
                                } else if newValue.count == 7 {
                                    text.insert("(", at: text.index(text.startIndex, offsetBy: 3))
                                    text.insert(")", at: text.index(text.startIndex, offsetBy: 7))
                                    text.insert(" ", at: text.index(text.endIndex, offsetBy: -1))
                                } else if newValue.count == 13 || newValue.count == 16 {
                                    text.insert("-", at: text.index(text.endIndex, offsetBy: -1))
                                } else if newValue.count > 18 {
                                    text = String(text.dropLast())
                                }
                            } else {
                                if newValue.count == 16 || newValue.count == 13 {
                                    text = String(text.dropLast())
                                } else if newValue.count == 9 {
                                    text = String(text.dropLast(2))
                                    text.remove(at: text.index(text.startIndex, offsetBy: 3))
                                } else if newValue.count == 3 {
                                    text = String(text.dropLast(3))
                                }
                            }
                        case .date:
                            if newValue.count > oldValue.count {
                                if newValue.count == 3 ||  newValue.count == 6 {
                                    text.insert(".", at: text.index(text.endIndex, offsetBy: -1))
                                } else if newValue.count > 10 {
                                    text = String(text.dropLast())
                                }
                            } else {
                                if newValue.count == 3 ||  newValue.count == 6 {
                                    text = String(text.dropLast())
                                }
                            }
                        case nil:
                            text = newValue
                    }
                }
        }
        .padding(20)
        .background(RoundedRectangle(cornerRadius: 10)
            .foregroundStyle(
                isValid ?? true ? Color.backgroundGray : Color.backgroundRed)
                    )
    }
}
