//
//  Ticker.swift
//  Cryptocurrencies
//
//  Created by Valdiney Menezes on 18/11/21.
//

import ObjectMapper

class Ticker: Mappable, Encodable {
    var high: String?
    var low: String?
    var vol: String?
    var last: String?
    var buy: String?
    var sell: String?
    var open: String?
    var date: Int32?
    
    required init?(map: Map) {
    }
    
    init() {
    }
    
    func mapping(map: Map) {
        high <- map["high"]
        low <- map["low"]
        vol <- map["vol"]
        last <- map["last"]
        buy <- map["buy"]
        sell <- map["sell"]
        open <- map["open"]
        date <- map["date"]
    }
}

