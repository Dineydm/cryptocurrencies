//
//  EndpointAPI.swift
//  Cryptocurrencies
//
//  Created by Valdiney Menezes on 18/11/21.
//

import Foundation

enum APIError: Error {
    case badURL
    case taskError
    case noResponse
    case invalidStatusCode(Int)
    case noData
    case decodeError
}


class EndpointAPI : ObservableObject {
    @Published var tickerData: Ticker?
    
    private let configuration: URLSessionConfiguration = {
        let configuration = URLSessionConfiguration.default
        configuration.allowsCellularAccess = false
        configuration.timeoutIntervalForRequest = 60
        configuration.httpAdditionalHeaders = ["Content-Type": "application/json"]
        configuration.httpMaximumConnectionsPerHost = 5
        return configuration
    }()
    
    private lazy var session = URLSession(configuration: configuration)
    
    
    func getCurrency(coin: String, onComplete: @escaping (Result<Void, APIError>) -> Void) {
        request("GET", "https://www.mercadobitcoin.net/api/\(coin)/ticker", onComplete: onComplete)
    }
    
    private func request(_ httpMethod: String, _ url: String, onComplete: @escaping (Result<Void, APIError>) -> Void) {
        let url = URL(string: url)!
                
        var urlRequest = URLRequest(url: url)
        //urlRequest.httpBody = try? JSONEncoder().encode(obj)
        urlRequest.httpMethod = httpMethod
        session.dataTask(with: urlRequest) { (data, uRLResponse, error) in
            guard let httpResponse = uRLResponse as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                
                return
            }
     
            /*if data == nil {
                onComplete(.failure(.taskError))
            } else {
                guard let data = data else {
                    onComplete(.failure(.noData))
                    return
                }
                do {
                    self.tickerData = try JSONDecoder().decode(Ticker.self, from: data)
                    print(self.tickerData?.high)
                    onComplete(.success(()))
                } catch {
                    print("Unexpected error: \(error).")
                }
                onComplete(.success(()))
            }*/
        }.resume()
    }
}

