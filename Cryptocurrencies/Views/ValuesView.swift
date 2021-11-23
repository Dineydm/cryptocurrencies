//
//  ValuesView.swift
//  Cryptocurrencies
//
//  Created by Valdiney Menezes on 17/11/21.
//

import SwiftUI

struct ValuesView: View {
    
    var data = Array(0...8).map { "\($0)" }
    @State private var selected = 3
    @State var isClicked: Bool = false
    
    var body: some View {
        VStack {
            /*Picker("Deicimal digitis", selection: $selected) {
                ForEach(0 ..< data.count) {
                    Text(data[$0])
                }
            }*/
            
            HStack {
                Image("monero_adobespark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                
                VStack(alignment: .leading) {
                    Text("BTC".uppercased())
                        .fontWeight(.bold)
                        .font(.largeTitle)
                    
                    Text("Bitcoin")
                        .foregroundColor(Color.gray)
                }
                
                Spacer()
                
                HStack {
                    Text("+3,68%")
                        .foregroundColor(Color.white)
                    Image(systemName: "arrowtriangle.up.fill")
                        .foregroundColor(Color.white)
                        .font(.footnote)
                }
                .padding(.horizontal, 5)
                .padding(.vertical, 5)
                .background(Color("Color"))
                .cornerRadius(9)
            }
            .padding(.bottom)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("High".uppercased())
                        .foregroundColor(Color.gray)
                    Text("330300.00001000".formatNumber(decimalDigits: selected))
                        .fontWeight(.bold)
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Low".uppercased())
                        .foregroundColor(Color.gray)
                    Text("330300.00001000".formatNumber(decimalDigits: selected))
                        .fontWeight(.bold)
                }
                
                if (selected < 4) {
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text("Average".uppercased())
                            .foregroundColor(Color.gray)
                        Text("330300.00001000".formatNumber(decimalDigits: selected))
                            .fontWeight(.bold)
                    }
                }
            }
            .padding(.bottom)
            
            List {
                Section(header: SectionHeaderView(text: "More Aliquots", isClicked: $isClicked)) {
                    if isClicked {
                        SectionRowView(text: "High:".uppercased(), value: "330300.00001000".formatNumber(decimalDigits: selected))
                        SectionRowView(text: "Low:".uppercased(), value: "330300.00001000".formatNumber(decimalDigits: selected))
                        SectionRowView(text: "Last:".uppercased(), value: "336826.98000000".formatNumber(decimalDigits: selected))
                        SectionRowView(text: "Buy:".uppercased(), value: "336826.98000000".formatNumber(decimalDigits: selected))
                        SectionRowView(text: "Sell:".uppercased(), value: "336829.96998000".formatNumber(decimalDigits: selected))
                        SectionRowView(text: "Open:".uppercased(), value: "341396.00000000".formatNumber(decimalDigits: selected))
                    } else {
                        EmptyView()
                    }
                }
                .padding(0)
            }
            
            Spacer()
        }
        .padding(.horizontal, 30)
        .padding(.vertical)
    }
    
    public func date(text: String) -> String {
        var date = Date()
        let isoDateFormatter = ISO8601DateFormatter()
        if let isoDate = isoDateFormatter.date(from: text) {
          date = isoDate
        }
        
        let dateFormatter = DateFormatter()

        return dateFormatter.string(from: date)
    }
}

struct ValuesView_Previews: PreviewProvider {
    static var previews: some View {
        ValuesView()
    }
}
