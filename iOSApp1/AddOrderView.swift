//
//  AddOrderView.swift
//  iOSApp1
//
//  Created by Muhammad Abrar Khan on 2025-09-17.
//

import SwiftUI

struct AddOrderView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var store: OrderStore

    @State private var name = ""
    @State private var drink = "Coffee"
    @State private var size = "Medium"
    @State private var extras = "None"

    let drinks = ["Coffee", "Tea", "Iced Capp", "Latte", "Hot Chocolate"]
    let sizes = ["Small", "Medium", "Large"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Who is ordering?")) {
                    TextField("Name", text: $name)
                }

                Section(header: Text("Drink Details")) {
                    Picker("Drink", selection: $drink) {
                        ForEach(drinks, id: \.self) { Text($0) }
                    }
                    Picker("Size", selection: $size) {
                        ForEach(sizes, id: \.self) { Text($0) }
                    }
                    TextField("Extras (e.g. 2 cream, 1 sugar)", text: $extras)
                }
            }
            .navigationTitle("New Order")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let order = Order(name: name, drink: drink, size: size, extras: extras)
                        store.addOrder(order)
                        dismiss()
                    }.disabled(name.isEmpty)
                }
            }
        }
    }
}
