//
//  FruitListView.swift
//  FruitRedux
//
//  Created by Gustavo Batista on 14/10/25.
//

import SwiftUI

struct FruitListView: View {
    @EnvironmentObject var fruitStore: ObservableStore<FruitState, FruitAction>
    @EnvironmentObject var cartStore: ObservableStore<CartState, CartAction>
    
    var body: some View {
        List {
            if fruitStore.state.isLoading {
                HStack { Spacer(); ProgressView(); Spacer() }
            } else {
                ForEach(fruitStore.state.fruits) { fruit in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(fruit.name).font(.headline)
                            Text("R$ \(NSDecimalNumber(decimal: fruit.price).doubleValue, specifier: "%.2f")")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                        Button(action: { cartStore.dispatch(.add(fruit)) }) {
                            Label("Adicionar", systemImage: "cart.badge.plus")
                        }
                        .buttonStyle(.bordered)
                    }
                    .padding(.vertical, 6)
                }
            }
        }
        .navigationTitle("Frutas")
        .toolbar {
            NavigationLink(destination: CartView()) {
                CartIconView()
            }
        }
    }
}
