//
//  CurrencyIcon.swift
//  LOTRConverter17
//
//  Created by Morgyn Peay on 6/4/24.
//

import SwiftUI

struct CurrencyIcon: View {
    let currencyImg: ImageResource
    let currencyName: String
    
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Currency image
            Image(currencyImg)
                .resizable()
                .scaledToFit()
            
            // Currency name
            Text(currencyName)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(.brown.opacity(0.75))
            
        }
        .padding(3)
        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 25))
    }
}

#Preview {
    CurrencyIcon(currencyImg: .copperpenny, currencyName: "Copper Penny")
}
