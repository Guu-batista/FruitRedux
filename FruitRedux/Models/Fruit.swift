//
//  Fruits.swift
//  FruitRedux
//
//  Created by Gustavo Batista on 14/10/25.
//

import Foundation

struct Fruit: Identifiable, Equatable, Codable{
    let id: UUID
    let name: String
    let price: Decimal
    
    init(id: UUID = .init(), name: String, price: Decimal) {
        self.id = id
        self.name = name
        self.price = price
    }
}
