//
//  CoffeeDetailView.swift
//  MyCoffeeList
//
//  Created by Ömer Köse on 8.12.2024.
//

import SwiftUI

struct CoffeeDetailView: View {
    // MARK: - Variables
    @Environment(\.dismiss) var dismiss
    var coffee: Coffee
    let bulletListGridItems = [
        GridItem(.fixed(10)),
        GridItem()
    ]
    
    // MARK: - View
    var body: some View {
        ScrollView(.vertical) {
            
            // Dismiss button
            HStack {
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(.black)
                        .fontWeight(.bold)
                }
                .padding(.vertical, 10)
                .padding(.trailing, 20)
            } //: HSTACK
            
            // Coffee image
            AsyncImage(url: coffee.image) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(.rect(cornerRadius: 10))
                        .frame(maxWidth: .infinity, maxHeight: 400)
                        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 3)
                        .accessibilityLabel(coffee.title)
                case .failure:
                    Image(systemName: "photo.badge.exclamationmark")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .accessibilityLabel("Image failed to load")
                case .empty:
                    ProgressView()
                        .frame(maxWidth: .infinity)
                @unknown default:
                    EmptyView()
                }
            } //: ASYNC IMAGE
            
            ZStack {
                // Background
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
                    .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 3)
                
                // Coffee attributes
                VStack(alignment: .leading) {
                    // Coffee Title
                    Text(coffee.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    // Coffee Description
                    Text(coffee.description)
                        .font(.subheadline)
                        .fontWeight(.light)
                    
                    // Coffee ingredients
                    Text("Ingredients: ")
                        .font(.headline)
                        .fontWeight(.medium)
                        .padding(.vertical)
                    
                    ForEach(coffee.ingredients, id: \.self) { ingredient in
                        LazyVGrid(columns: bulletListGridItems, alignment: .leading) {
                            GridRow {
                                VStack(alignment: .leading) {
                                    Text("•")
                                        .font(.title)
                                        .foregroundStyle(.black)
                                }
                                Text(ingredient)
                                    .font(.body)
                                    .fontWeight(.light)
                            } //: GRID ROW
                        } //: LAZY V GRID
                    } //: LOOP
                } //: VSTACK
                .padding()
                
            } //: ZSTACK
            .padding()
            
        } //: SCROLL VIEW
    } //: VIEW
}

// MARK: - Preview
#Preview {
    let mockCoffee = Coffee(title: "Iced Latte", description: "A refreshing blend of espresso and milk over ice.", ingredients: [
        "Coffee",
        "Ice",
        "Sugar*",
        "Cream*"
    ], image: URL(string: "https://upload.wikimedia.org/wikipedia/commons/d/d8/Blue_Bottle%2C_Kyoto_Style_Ice_Coffee_%285909775445%29.jpg")!
    , id: 1)
    CoffeeDetailView(coffee: mockCoffee)
}
