//
//  Coffee.swift
//  MyCoffeeList
//
//  Created by Ömer Köse on 8.12.2024.
//

import Foundation

struct Coffee: Codable, Identifiable {
    let title: String
    let description: String
    let ingredients: [String]
    let image: URL
    let id: Int
}
