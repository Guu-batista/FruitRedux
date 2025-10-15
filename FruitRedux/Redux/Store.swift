//
//  store.swift
//  FruitRedux
//
//  Created by Gustavo Batista on 14/10/25.
//

import Foundation
import Combine

final class ObservableStore<State, Action>: ObservableObject {
    @Published private(set) var state: State
    private let reducer: (inout State, Action) -> Void
    private let queue = DispatchQueue(label: "redux.observable.queue")

    init(initial: State, reducer: @escaping (inout State, Action) -> Void) {
        self.state = initial
        self.reducer = reducer
    }

    func dispatch(_ action: Action) {
        queue.sync {
            var copy = state
            reducer(&copy, action)
            DispatchQueue.main.async {
                self.state = copy
            }
        }
    }
}
