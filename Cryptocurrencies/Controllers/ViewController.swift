//
//  ViewController.swift
//  Cryptocurrencies
//
//  Created by Valdiney Menezes on 18/11/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        AF.request("https://www.mercadobitcoin.net/api/BTC/ticker").response { response in
            debugPrint(response)
        }
    }
}
