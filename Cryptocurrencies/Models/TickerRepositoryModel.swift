//
//  Ticker.swift
//  Cryptocurrencies
//
//  Created by Valdiney Menezes on 19/11/21.
//

import Foundation

struct TickerResponse: Codable {
  let items: [TickerRepositoryModel]?
}

struct TickerRepositoryModel: Codable {
  
  let high: String
  let low: String
  let vol: String
  let last: String
  let buy: String
  let sell: String
  let open: String
  let date: Int32
    
  enum CodingKeys: String, CodingKey {
    case high
    case low
    case vol
    case last
    case buy
    case sell
    case open
    case date
  }
}
