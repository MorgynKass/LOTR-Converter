//
//  SelectCurrencyPage.swift
//  LOTRConverter17
//
//  Created by Morgyn Peay on 5/31/24.
//

import SwiftUI

struct SelectCurrencyPage: View {
    @Environment(\.dismiss) var dismissPage
    @Binding var topCurrency: Currency
    @Binding var bottomCurrency: Currency
    
    var body: some View {
        ZStack {
            // Background image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                // Starting currency text
                Text("Select ther currency you are starting with:")
                    .fontWeight(.bold)
                
                // Starting images
                IconGrid(selectedCurrency: $topCurrency)
                
                // Selected currency text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                
                // Selected image
                IconGrid(selectedCurrency: $bottomCurrency)
                
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
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SelectCurrencyPage(topCurrency: .constant(.copperPenny), bottomCurrency: .constant(.silverPenny))
}
