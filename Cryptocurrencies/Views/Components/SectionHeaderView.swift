//
//  SectionHeaderView.swift
//  Cryptocurrencies
//
//  Created by Valdiney Menezes on 18/11/21.
//

import SwiftUI

struct SectionHeaderView: View {
    
    var text: String

    @Binding var isClicked: Bool
    
    var body: some View {
        HStack {
            Text(text.uppercased())
                .foregroundColor(Color.gray)
                .font(.footnote)
            Spacer()
            Button(action: {
                self.isClicked.toggle()
            }) {
                Image(systemName: !self.isClicked ? "chevron.right" : "chevron.down")
                    .font(.footnote)
            }
        }
        .padding()
    }
}

struct SectionHeaderView_Previews: PreviewProvider {
    @State static var isClicked: Bool = false
    
    static var previews: some View {
        SectionHeaderView(text: "Hello, World!", isClicked: $isClicked)
            .previewLayout(.sizeThatFits)
    }
}
