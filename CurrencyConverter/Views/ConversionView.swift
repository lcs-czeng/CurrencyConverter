//
//  ConversionView.swift
//  CurrencyConverter
//
//  Created by 曾梓恒 on 2025-01-23.
//

import SwiftUI

struct ConversionView: View {
    
    let somePriorConversion: Conversion
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Text("\(somePriorConversion.cad.formatted(.number.precision(.fractionLength(2)))) CAD")
                
                Text("is")
                
                Text("\(somePriorConversion.usd.formatted(.number.precision(.fractionLength(2)))) USD")

            }
        }
    }
}

#Preview {
    ConversionView(somePriorConversion: conversionForPreview)
}
