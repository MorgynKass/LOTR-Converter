//
//  CurrencyTip.swift
//  LOTRConverter17
//
//  Created by Morgyn Peay on 6/10/24.
//

import SwiftUI
import TipKit

struct CurrencyTip: Tip {
    var title = Text("Change Currency")
    
    var message: Text? = Text("Tap on left or right currency to change currencies.")
}
