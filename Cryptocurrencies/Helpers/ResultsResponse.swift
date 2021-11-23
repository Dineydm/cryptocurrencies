//
//  ResultsResponse.swift
//  Cryptocurrencies
//
//  Created by Valdiney Menezes on 19/11/21.
//

import ObjectMapper

class ResultsResponse<T: Mappable>: Mappable {
    var results = [T]()
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        results <- map["results"]
    }
}
