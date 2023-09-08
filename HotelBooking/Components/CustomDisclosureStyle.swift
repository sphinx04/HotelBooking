//
//  CustomDisclosureStyle.swift
//  HotelBooking
//
//  Created by Sphinx04 on 05.09.23.
//

import SwiftUI

struct CustomDisclosureStyle: DisclosureGroupStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
                .tint(.primary)
                .contentShape(Rectangle())
            
            if configuration.isExpanded {
                configuration.content
            }
        }
    }
}
