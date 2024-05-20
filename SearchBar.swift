//
//  SearchBar.swift
//  arbuz
//
//  Created by Ayala Nurkuatkyzy on 19.05.2024.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Button(action: {
            }) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
            }
            .padding(.leading, 5)
            
            TextField("Искать на Арбузе", text: $text)
                .padding(5)
                .padding(.horizontal, 5)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .foregroundColor(.primary)
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
