//
//  ContentView.swift
//  iOSApp1
//
//  Created by Muhammad Abrar Khan on 2025-09-17.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var store = OrderStore()

    var body: some View {
        TabView {
            OrdersView(store: store)
                .tabItem {
                    Label("Orders", systemImage: "cup.and.saucer.fill")
                }

            CoffeeRunTimer()
                .tabItem {
                    Label("Timer", systemImage: "timer")
                }
        }
    }
}
