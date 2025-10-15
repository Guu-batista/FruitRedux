//
//  FruitAction.swift
//  FruitRedux
//
//  Created by Gustavo Batista on 14/10/25.
//

import Foundation

enum FruitAction {
    case setLoading(Bool)
    case setFruits([Fruit])
    case addFruit(Fruit)
    case removeFruit(UUID)
}
