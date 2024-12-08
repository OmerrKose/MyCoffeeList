//
//  CoffeeCardView.swift
//  MyCoffeeList
//
//  Created by Ömer Köse on 8.12.2024.
//

import SwiftUI

struct CoffeeCardView: View {
    // Variables
    var coffee: Coffee
    
    var body: some View {
        ZStack {
            // Background
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 3)
            
            // Coffee Details
            HStack(alignment: .center, spacing: 16) {
                // Coffee image
                AsyncImage(url: coffee.image) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .frame(width: 80, height: 80)
                            .accessibilityLabel(coffee.title)
                    case .failure:
                        Image(systemName: "photo.badge.exclamationmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.gray)
                            .accessibilityLabel("Image failed to load")
                    case .empty:
                        ProgressView()
                            .frame(width: 80, height: 80)
                    @unknown default:
                        EmptyView()
                    }
                }
                
                // Coffee
                VStack(alignment: .leading, spacing: 8) {
                    Text(coffee.title)
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Text(coffee.description)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                        .lineLimit(2)
                        .truncationMode(.tail)
                } //: VSTACK
                Spacer()
                
            } //: HSTACK
            .padding()
            
        } //: ZSTACK
        .frame(maxWidth: .infinity)
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
        
    CoffeeCardView(coffee: mockCoffee)
}
