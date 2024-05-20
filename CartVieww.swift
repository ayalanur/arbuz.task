//
//  CartVieww.swift
//  arbuz
//
//  Created by Ayala Nurkuatkyzy on 19.05.2024.
//

import SwiftUI

struct CartView: View {
    var body: some View {
        NavigationView {
            Text("Здесь будут продукты которые вы добавили")
                .navigationTitle("Корзина")
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
