//
//  CoffeRunTimer.swift
//  iOSApp1
//
//  Created by Muhammad Abrar Khan on 2025-09-17.
//

import SwiftUI

struct CoffeeRunTimer: View {
    @State private var timeRemaining = 300 // 5 minutes
    @State private var timerRunning = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            Text("Coffee Run Countdown")
                .font(.headline)

            Text("\(timeRemaining / 60):\(String(format: "%02d", timeRemaining % 60))")
                .font(.largeTitle)
                .padding()

            Button(timerRunning ? "Pause" : "Start") {
                timerRunning.toggle()
            }
        }
        .onReceive(timer) { _ in
            if timerRunning && timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
        .padding()
    }
}
