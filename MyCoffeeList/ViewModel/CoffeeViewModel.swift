//
//  CoffeeViewModel.swift
//  MyCoffeeList
//
//  Created by Ömer Köse on 8.12.2024.
//

import Foundation

class CoffeeViewModel: ObservableObject {
    // MARK: - Variables
    static let shared = CoffeeViewModel()
    @Published var coffees: [Coffee] = []
    
    // MARK: - Initializer
    private init() {
        fetchCoffee(isIced: false)
    }
    
    // MARK: - Fetch Data
    func fetchCoffee(isIced: Bool) {
        guard let url = URL(string: "https://api.sampleapis.com/coffee/\(isIced ? "iced" : "hot")") else {
            print("Invalid URL")
            return
        }
        fetchCoffeeList(from: url)
    }
    
    private func fetchCoffeeList(from url: URL) {
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                print("Error: \(error)")
                return
            }
            
            guard let data else {
                print("No data received")
                return
            }
            
            do {
                let coffees = try JSONDecoder().decode([Coffee].self, from: data)
                DispatchQueue.main.async {
                    self.coffees = coffees
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        task.resume()
    }
}
