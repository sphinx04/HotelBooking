//
//  PurchaseView.swift
//  HotelBooking
//
//  Created by Sphinx04 on 08.09.23.
//

import SwiftUI

struct PurchaseView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Circle()
                    .frame(width: 94, height: 94)
                    .foregroundStyle(Color.backgroundGray)
                    .overlay {
                        Text("🎉")
                            .font(.system(size: 44))
                    }
                
                Text("Ваш заказ принят в работу")
                    .font(.system(size: 22, weight: .medium))
                    .padding()
                Text("Подтверждение заказа №" + String(Int.random(in: 1..<10000)) + " может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.")
                    .font(.system(size: 16))
                    .foregroundStyle(.gray)
            } //VSTACK
            .multilineTextAlignment(.center)
            .padding()
            .navigationTitle("Заказ оплачен")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button("Супер!") {
                        NavigationUtility.popToRootView(animated: true)
                    }
                    .selectButtonModifier()
                }
            }
        }
    }
}

struct PurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseView()
    }
}
