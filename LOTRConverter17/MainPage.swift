//
//  ContentView.swift
//  LOTRConverter17
//
//  Created by Morgyn Peay on 5/30/24.
//

import SwiftUI
import TipKit

struct MainPage: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    @State var leftCurrency: Currency = .copperPenny
    @State var rightCurrency: Currency = .silverPenny
    
    var body: some View {
        ZStack {
            // Background image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                // Prancing pony image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                // Currency exchange text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                // Currency conversion section
                HStack {
                    // Left converion section
                    VStack {
                        // Currency
                        HStack {
                            // Currency image
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            // Currency text
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .popoverTip(CurrencyTip(),
                                    arrowEdge: .bottom)
                        
                        // Textfield
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                            
                    }
                    
                    // Equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    // Right conversion section
                    VStack {
                        // Currency
                        HStack {
                            // Currency text
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            // Currency image
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        
                        // Textfield
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping)
                            
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                
                Spacer()
                
                // Info button
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
//                        print(showExchangeInfo)
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                
                }
            }
            
            .task {
                try? Tips.configure()
            }
            
            .onChange(of: leftAmount) {
                if leftTyping {
                    rightAmount =
                    leftCurrency
                    .convert(leftAmount, to: rightCurrency)
                }
            }
            
            .onChange(of: rightAmount) {
                if rightTyping {
                    leftAmount =
                    rightCurrency
                    .convert(rightAmount, to: leftCurrency)
                }
            }
            
            .onChange(of: leftCurrency) {
                leftAmount =
                rightCurrency
                .convert(rightAmount, to: leftCurrency)
            }
            
            .onChange(of: rightCurrency) {
                rightAmount =
                leftCurrency
                .convert(leftAmount, to: rightCurrency)
            }
            
            .sheet(isPresented: $showExchangeInfo) {
                ExchangeInfoPage()
            }
            
            .sheet(isPresented: $showSelectCurrency) {
                SelectCurrencyPage(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
            }
            
        }
    }
}

#Preview {
    MainPage()
}
