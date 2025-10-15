//
//  CartAction.swift
//  FruitRedux
//
//  Created by Gustavo Batista on 14/10/25.
//

import Foundation

enum CartAction {
    case add(Fruit)
    case remove(UUID)
    case increase(UUID)
    case decrease(UUID)
    case clear
    case confirmPurchase
}
