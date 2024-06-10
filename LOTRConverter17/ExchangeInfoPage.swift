//
//  ExchangeInfo.swift
//  LOTRConverter17
//
//  Created by Morgyn Peay on 5/31/24.
//

import SwiftUI

struct ExchangeInfoPage: View {
    @Environment(\.dismiss) var dismissPage
    
    var body: some View {
        ZStack {
            // Background image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)

            VStack {
                // Title
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(3)
                
                // Text block
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title2)
                    .padding()
                
                // Currency exchange rate 1
                ExchangeRates(leftImage: .goldpiece, conversionText: "1 Gold Piece =  4 Gold Pennies", rightImage: .goldpenny)
                
                ExchangeRates(leftImage: .goldpenny, conversionText: "1 Gold Penny =  4 Silver Pieces", rightImage: .silverpiece)
                
                ExchangeRates(leftImage: .silverpiece, conversionText: "1 Silver Piece =  4 Silver Pennies", rightImage: .silverpenny)
                
                ExchangeRates(leftImage: .silverpenny, conversionText: "1 Silver Penny =  4 Copper Pennies", rightImage: .copperpenny)
                
                // Done button
                Button("Done") {
                    dismissPage()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
                
            }
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    ExchangeInfoPage()
}
