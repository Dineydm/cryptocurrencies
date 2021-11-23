//
//  ConsultaService.swift
//  Cryptocurrencies
//
//  Created by Valdiney Menezes on 19/11/21.
//

import AlamofireObjectMapper
import Alamofire


class ApiService: NSObject {
    private let baseUrl = "\(Constants.url)"
    
    let headers: HTTPHeaders = [
        .accept("application/json")
    ]
    
    func get(completionHandler: @escaping (DataResponse<ResultsResponse<Ticker>, AFError>) -> Void) -> DataRequest {
        return AF.request(baseUrl, headers: headers)
            .validate()
            .responseObject(completionHandler: completionHandler)
    }
}
