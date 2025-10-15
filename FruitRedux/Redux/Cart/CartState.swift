//
//  CartState.swift
//  FruitRedux
//
//  Created by Gustavo Batista on 14/10/25.
//

import Foundation

struct CartState {
    var items: [CartItem] = []
    var lastConfirmedAt: Date? = nil
}
