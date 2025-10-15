//
//  CartIconView.swift
//  FruitRedux
//
//  Created by Gustavo Batista on 14/10/25.
//

import SwiftUI

struct CartIconView: View {
    @EnvironmentObject var cartStore: ObservableStore<CartState, CartAction>
    
    var totalItems: Int {
        cartStore.state.items.reduce(0) { $0 + $1.quantity }
    }
    
    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: "cart")
            if totalItems > 0 {
                Text("\(totalItems)")
                    .font(.caption2)
                    .bold()
                    .padding(6)
                    .background(.thinMaterial)
                    .clipShape(Circle())
            }
        }
    }
}
