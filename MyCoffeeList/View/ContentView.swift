//
//  ContentView.swift
//  MyCoffeeList
//
//  Created by Ömer Köse on 8.12.2024.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Variables
    @StateObject private var coffeeViewModel = CoffeeViewModel.shared
    @State private var listIcedCoffee: Bool = false
    @State private var selectedCoffee: Coffee? = nil
    
    // MARK: - View
    var body: some View {
        NavigationView {
            List(coffeeViewModel.coffees, id: \.id) { coffee in
                Button {
                    selectedCoffee = coffee // Set selected coffee to show its details
                } label: {
                    CoffeeCardView(coffee: coffee)
                }
                .listRowSeparator(.hidden)
            } //: LIST
            .navigationTitle(listIcedCoffee ? "Iced Coffees" : "Hot Coffees")
            .listStyle(.plain)
            .background(.clear)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        listIcedCoffee.toggle()
                        coffeeViewModel.fetchCoffee(isIced: listIcedCoffee)
                    } label: {
                        Image(systemName: listIcedCoffee ? "sun.max.fill" : "snowflake")
                            .foregroundStyle(listIcedCoffee ? .red : .blue)
                    }
                }
            }
            .sheet(item: $selectedCoffee) { coffee in
                CoffeeDetailView(coffee: coffee)
            }
        } //: NAVIGATION VIEW
    } //: VIEW
}

// MARK: - Preview
#Preview {
    ContentView()
}
