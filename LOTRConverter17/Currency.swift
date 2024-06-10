//
//  Currency.swift
//  LOTRConverter17
//
//  Created by Morgyn Peay on 6/4/24.
//

import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    var id: Currency { self }
    
    var image: ImageResource {
        switch self {
        case .copperPenny:
                .copperpenny
        case .silverPenny:
                .silverpenny
        case .silverPiece:
                .silverpiece
        case .goldPenny:
                .goldpenny
        case .goldPiece:
                .goldpiece
        }
    }
    
    var name: String {
        switch self {
        case .copperPenny:
                "Copper Penny"
        case .silverPenny:
                "Silver Penny"
        case .silverPiece:
                "SilverPiece"
        case .goldPenny:
                "GoldPenny"
        case .goldPiece:
                "Gold Piece"
        }
    }
    
    func convert(_ amountStrg: String,to currencyType: Currency) -> String {
        guard let doubleAmount = Double(amountStrg) else {
            return ""
        }
        
        let convertedAmount = (doubleAmount / self.rawValue) * currencyType.rawValue
        
        return String(format: "%.2f", convertedAmount)
    }
}
