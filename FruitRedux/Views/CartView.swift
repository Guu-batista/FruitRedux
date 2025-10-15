//
//  CartView.swift
//  FruitRedux
//
//  Created by Gustavo Batista on 14/10/25.
//
import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartStore: ObservableStore<CartState, CartAction>
    @Environment(\.presentationMode) var presentation
    @State private var showingConfirm = false
    @State private var showingSuccess = false

    var total: Decimal {
        cartStore.state.items.reduce(Decimal(0)) { acc, item in
            acc + item.fruit.price * Decimal(item.quantity)
        }
    }

    var body: some View {
        VStack {
            if cartStore.state.items.isEmpty {
                Spacer()
                Text("Carrinho vazio")
                    .foregroundStyle(.secondary)
                Spacer()
            } else {
                List {
                    ForEach(cartStore.state.items) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.fruit.name).font(.headline)
                                Text("R$ \(NSDecimalNumber(decimal: item.fruit.price).doubleValue, specifier: "%.2f") x \(item.quantity)")
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                            HStack(spacing: 8) {
                                Button(action: { cartStore.dispatch(.decrease(item.id)) }) {
                                    Image(systemName: "minus.circle")
                                }
                                Text("\(item.quantity)")
                                Button(action: { cartStore.dispatch(.increase(item.id)) }) {
                                    Image(systemName: "plus.circle")
                                }
                                Button(action: { cartStore.dispatch(.remove(item.id)) }) {
                                    Image(systemName: "trash")
                                }
                            }
                        }
                    }
                }

                HStack {
                    Text("Total:")
                        .font(.headline)
                    Spacer()
                    Text("R$ \(NSDecimalNumber(decimal: total).doubleValue, specifier: "%.2f")")
                        .font(.title3)
                        .bold()
                }
                .padding()

                Button(action: { showingConfirm = true }) {
                    Text("Confirmar Compra")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .padding([.horizontal, .bottom])
                .disabled(cartStore.state.items.isEmpty)
                .confirmationDialog("Deseja confirmar a compra?", isPresented: $showingConfirm, titleVisibility: .visible) {
                    Button("Confirmar", role: .none) {
                        cartStore.dispatch(.confirmPurchase)
                        showingSuccess = true
                    }
                    Button("Cancelar", role: .cancel) {}
                }
                .alert("Compra efetuada", isPresented: $showingSuccess, actions: {
                    Button("Ok", role: .cancel) {
                        presentation.wrappedValue.dismiss()
                    }
                }, message: {
                    if let date = cartStore.state.lastConfirmedAt {
                        Text("Compra confirmada em: \(date.formatted(.dateTime.year().month().day().hour().minute()))")
                    } else {
                        Text("Compra confirmada com sucesso!")
                    }
                })
            }
        }
        .navigationTitle("Carrinho")
    }
}
