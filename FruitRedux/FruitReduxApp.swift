//
//  FruitReduxApp.swift
//  FruitRedux
//
//  Created by Gustavo Batista on 14/10/25.
//

import SwiftUI

@main
struct FrutaReduxApp: App {
    @StateObject private var fruitStore = ObservableStore(initial: FruitState(), reducer: fruitReducer)
    @StateObject private var cartStore = ObservableStore(initial: CartState(), reducer: cartReducer)
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(fruitStore)
                .environmentObject(cartStore)
                .onAppear {
                    fruitStore.dispatch(.setLoading(true))
                    DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
                        let sample = [
                            Fruit(name: "Maçã", price: 3.50),
                            Fruit(name: "Banana", price: 2.20),
                            Fruit(name: "Laranja", price: 4.00),
                            Fruit(name: "Pera", price: 5.75)
                        ]
                        fruitStore.dispatch(.setFruits(sample))
                    }
                }
        }
    }
}
