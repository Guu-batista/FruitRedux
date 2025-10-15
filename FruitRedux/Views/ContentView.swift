//
//  ContentView.swift
//  FruitRedux
//
//  Created by Gustavo Batista on 14/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            FruitListView()
            Text("Selecione uma fruta")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    ContentView()
}
