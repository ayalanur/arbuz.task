//
//  ContentView.swift
//  arbuz
//
//  Created by Ayala Nurkuatkyzy on 19.05.2024.
//

import SwiftUI

struct ContentView: View {
    let photos = ["photo1", "photo2", "photo3"]
    let products = [
        Product(name: " Семга стейк", imageName: "semga", price: "6 293 ₸", weight: " 0,7 кг"),
        Product(name: " Клубника", imageName: "klubnika", price: "3 625 ₸", weight: " 1 шт"),
        Product(name: " Сибас", imageName: "sibas", price: "6 990 ₸", weight: " 1 кг"),
        Product(name: " Фарш", imageName: "pharsh", price: "3 490 ₸", weight: " 1 шт"),
        Product(name: " Масло гхи", imageName: "maslo", price: "3 330 ₸", weight: " 1 шт"),
        Product(name: " Рыбный суп", imageName: "sup", price: "1 715 ₸", weight: " 1 шт")
    ]
    
    let otherProducts = [
        Product(name: " Огурцы маринованные 370 мл", imageName: "cucumbers", price: "1 960 ₸", weight: " 1 шт"),
        Product(name: " Ассорти из оливок 300 г", imageName: "olivki", price: "1 935 ₸", weight: " 1 шт"),
        Product(name: " Чипсы Pringles", imageName: "pringles", price: "1 680 ₸", weight: " 1 шт"),
        Product(name: " Каша Кукурузная", imageName: "kasha", price: "3 320 ₸", weight: " 1 шт"),
        Product(name: " Соус Песто", imageName: "pesto", price: "2 340 ₸", weight: " 1 шт"),
        Product(name: " Choco Pie Vienna Cake", imageName: "chocopie", price: "1 715 ₸", weight: " 1 шт")
    ]
    
    // MARK: - Properties
    @State private var currentPage = 0
    @State private var scrollOffset: CGFloat = 0
    @State private var favorites = Set<String>()
    @State private var cart = [Product: Int]()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // Logo
                    Image("logo")
                        .resizable()
                        .frame(width: 100, height: 50)
                        .padding()
                    
                    HStack {
                        Text("Укажите свой адрес")
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .padding(.bottom, 5)
                            .padding(.leading, 10)
                        
                        Spacer()
                        
                        Button(action: {
                        }) {
                            Image(systemName: "arrow.down")
                        }
                        .padding(.trailing, 20)
                        
                        Button(action: {
                        }) {
                            Image(systemName: "bell")
                        }
                    }
                    .padding(.bottom, 20)
                    .padding(.trailing, 10)
                    
                    // Поиск
                    SearchBar(text: .constant(""))
                        .padding(.horizontal, 10)
                        .padding(.bottom, 5)
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 10) {
                        ForEach(photos.indices, id: \.self) { index in
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.white)
                                Image(photos[index])
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.main.bounds.width - 20, height: 150)
                                    .clipped()
                                    .cornerRadius(8)
                            }
                        }
                    }
                    .padding(.horizontal, 10)
                    .frame(height: 150)
                    .contentShape(Rectangle())
                    .offset(x: scrollOffset)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                scrollOffset = value.translation.width - UIScreen.main.bounds.width * CGFloat(currentPage)
                            }
                            .onEnded { value in
                                let offset = value.predictedEndTranslation.width / UIScreen.main.bounds.width
                                let newIndex = (CGFloat(currentPage) - offset).rounded()
                                currentPage = min(max(Int(newIndex), 0), photos.count - 1)
                                withAnimation {
                                    scrollOffset = -UIScreen.main.bounds.width * CGFloat(currentPage)
                                }
                            }
                    )
                }
                .navigationBarHidden(true)
                
                // Квадратные ячейки - каталог, профиль, избранное
                HStack(spacing: 10) {
                    Button(action: {
                    }) {
                        VStack {
                            Image(systemName: "square.grid.2x2")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 20)
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(8)
                                .foregroundColor(.black)
                                .padding(.top, 10)
                        }
                    }
                    .padding(.leading, 10)
                    
                    Button(action: {
                    }) {
                        VStack {
                            Image(systemName: "person")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 20)
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(8)
                                .foregroundColor(.black)
                                .padding(.top, 10)
                        }
                    }
                    .padding(.horizontal, 5)
                    
                    Button(action: {
                    }) {
                        VStack {
                            Image(systemName: "heart")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 20)
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(8)
                                .foregroundColor(.black)
                                .padding(.top, 10)
                        }
                    }
                    .padding(.trailing, 10)
                }
                .padding(.bottom, 20)
                
                Text("Arbuz Select")
                    .font(.headline)
                    .padding(.trailing, 255)
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 10) {
                        ForEach(products, id: \.name) { product in
                            ProductCardView(product: product, favorites: $favorites, cart: $cart)
                                .frame(width: 150)
                        }
                    }
                    .padding(.horizontal, 10)
                }
                Text("для Friends")
                    .font(.headline)
                    .padding(.top, 20)
                    .padding(.trailing, 265)
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(otherProducts, id: \.name) { product in
                        ProductCardView(product: product, favorites: $favorites, cart: $cart)
                    }
                }
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
                
                Button(action: {
                }) {
                    Text("Все товары")
                        .font(.headline)
                        .foregroundColor(.black)
                }
                
                
            }
            .navigationBarHidden(true)
        }
    }
}

// Ячейка продуктов
struct ProductCardView: View {
    let product: Product
    @Binding var favorites: Set<String>
    @Binding var cart: [Product: Int]
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topTrailing) {
                Image(product.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 100)
                    .clipped()
                
                Button(action: {
                    if favorites.contains(product.name) {
                        favorites.remove(product.name)
                    } else {
                        favorites.insert(product.name)
                    }
                }) {
                    Image(systemName: favorites.contains(product.name) ? "heart.fill" : "heart")
                        .foregroundColor(.red)
                        .padding()
                        .background(Color.white.opacity(0.5))
                        .clipShape(Circle())
                }
                .padding(5)
            }
            
            Text(product.name)
                .font(.headline)
                .lineLimit(2)
                .padding(.vertical, 5)
            
            Text(product.weight)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            HStack {
                if let quantity = cart[product], quantity > 0 {
                    Button(action: {
                        if let currentQuantity = cart[product], currentQuantity > 0 {
                            cart[product] = currentQuantity - 1
                        }
                    }) {
                        Image(systemName: "minus")
                    }
                    
                    Text("\(quantity)")
                        .padding(.horizontal, 10)
                    
                    Button(action: {
                        cart[product] = (cart[product] ?? 0) + 1
                    }) {
                        Image(systemName: "plus")
                    }
                } else {
                    Button(action: {
                        cart[product] = 1
                    }) {
                        Text(product.price)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }
                }
            }
            .padding(.top, 10)
        }
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 5)
        .padding(5)
    }
}

struct Product: Hashable {
    let name: String
    let imageName: String
    let price: String
    let weight: String
    var quantity: Int = 0
}

struct CustomSearchBar: UIViewRepresentable {
    @Binding var text: String
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        
        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.placeholder = "Поиск"
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
