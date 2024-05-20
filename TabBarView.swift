//
//  TabBarView.swift
//  arbuz
//
//  Created by Ayala Nurkuatkyzy on 19.05.2024.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Главная", systemImage: "house")
                }
            
            CartView()
                .tabItem {
                    Label("Корзина", systemImage: "cart")
                }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
