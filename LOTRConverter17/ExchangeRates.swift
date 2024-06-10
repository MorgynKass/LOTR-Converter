//
//  ExchangeRates.swift
//  LOTRConverter17
//
//  Created by Morgyn Peay on 5/31/24.
//

import SwiftUI

struct ExchangeRates: View {
    let leftImage: ImageResource
    let conversionText: String
    let rightImage: ImageResource
    
    var body: some View {
        HStack {
            // Left image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            // Text
            Text(conversionText)
            
            
            // Right image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
        }
    }
}

#Preview {
    ExchangeRates(leftImage: .goldpiece, conversionText: "1 Gold Piece =  4 Gold Pennies", rightImage: .goldpenny)
}
