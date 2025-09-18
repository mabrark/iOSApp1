//
//  Order.swift
//  iOSApp1
//
//  Created by Muhammad Abrar Khan on 2025-09-17.
//

import Foundation

struct Order: Identifiable, Codable {
    var id = UUID()
    var name: String
    var drink: String
    var size: String
    var extras: String
}
