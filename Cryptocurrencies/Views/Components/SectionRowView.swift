//
//  SectionRowView.swift
//  Cryptocurrencies
//
//  Created by Valdiney Menezes on 18/11/21.
//

import SwiftUI

struct SectionRowView: View {
    
    var text: String
    var value: String
    
    var body: some View {
        HStack {
            Text(text)
            
            Spacer()
             
            Text(value)
        }
    }
}

struct SectionRowView_Previews: PreviewProvider {
    static var previews: some View {
        SectionRowView(text: "High:".uppercased(), value: "330300.00001000")
            .previewLayout(.sizeThatFits)
    }
}
