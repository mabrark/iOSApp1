//
//  OrdersView.swift
//  iOSApp1
//
//  Created by Muhammad Abrar Khan on 2025-09-17.
//

import SwiftUI

struct OrdersView: View {
    @ObservedObject var store: OrderStore
    @State private var showingAddOrder = false

    var body: some View {
        NavigationView {
            List {
                ForEach(store.orders) { order in
                    VStack(alignment: .leading) {
                        Text(order.name).font(.headline)
                        Text("\(order.size) \(order.drink) with \(order.extras)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                .onDelete(perform: store.removeOrder)
            }
            .navigationTitle("Tim Hortons Orders")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAddOrder.toggle() }) {
                        Label("Add Order", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddOrder) {
                AddOrderView(store: store)
            }
        }
    }
}
