//
//  StringExtension.swift
//  Cryptocurrencies
//
//  Created by Valdiney Menezes on 17/11/21.
//

import Foundation

extension String {
    func formatNumber(decimalDigits: Int = 0) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = decimalDigits
        formatter.maximumFractionDigits = decimalDigits
        formatter.decimalSeparator = ","
        formatter.groupingSeparator = "."
        
        let number = NSNumber(value: Double(self)!)
        let formattedValue = formatter.string(from: number)!
        
        return formattedValue
    }
    
    func formatDate(dateFormat: String = "dd/MM/yyyy") -> String {
        let timeInterval = Double(self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        let date = dateFormatter.date(from: String(describing: timeInterval))
        
        return dateFormatter.string(from: date!)
    }
}
