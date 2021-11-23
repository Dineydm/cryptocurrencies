//
//  ContentView.swift
//  Cryptocurrencies
//
//  Created by Valdiney Menezes on 17/11/21.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    
    @State private var selected = 0
    
    private var tickers = [Ticker]()
    private let apiService = ApiService()
    
    let keys: [String] = [    "AAVE",    "ACMFT", "ACORDO01",        "ADA",     "ALLFT",   "AMFT",   "ANKR",   "ARGFT",    "ASRFT",    "ATMFT",
                               "AXS",      "BAL",     "BAND",      "BARFT",       "BAT",    "BCH",    "BNT",     "BTC",    "CAIFT",      "CHZ",
                            "CITYFT",     "COMP",      "CRV",        "DAI",       "DAL",    "ENJ",    "ETH",   "GALFT",   "GALOFT",      "GRT",
                            "IMOB01",   "IMOB02",  "INTERFT",      "JUVFT",       "KNC",   "LINK",    "LTC",    "MANA",    "MATIC", "MBCCSH01",
                          "MBCONS01", "MBCONS02",   "MBFP01",     "MBFP02",    "MBFP03", "MBFP04", "MBFP05", "MBPRK01",  "MBPRK02",  "MBPRK03",
                           "MBPRK04",  "MBPRK05",  "MBPRK06", "MBSANTOS01", "MBVASCO01",   "MCO2",  "MENGO", "MENGOFT",      "MKR",   "NAVIFT",
                              "OGFT",      "OMG",     "PAXG",      "PFLFT",     "PORFT",  "PSGFT",    "REI",     "REN", "SAUBERFT",   "SCCPFT",
                               "SNX",   "SPFCFT",    "STVFT",      "SUSHI",      "THFT",  "UFCFT",    "UMA",     "UNI",     "USDC",     "WBTC",
                               "WBX",      "XRP",    "YBOFT",        "YFI",       "ZRX"]
    
    let descriptions: [String] = ["AAVE - Aave", "ACMFT - Fan Token ASR", "ACORDO01 - None", "ADA - Cardano", "ALLFT - BARFT", "AMFT - BARFT",
                                  "ANKR - ANKR", "ARGFT - BARFT", "ASRFT - Fan Token ASR", "ATMFT - Fan Token ATM", "AXS - Axie Infinity Shard",
                                  "BAL - Balancer", "BAND - Band Protocol", "BARFT - BARFT", "BAT - Basic Attention token", "BCH - Bitcoin Cash",
                                  "BNT - BANCOR", "BTC - Bitcoin", "CAIFT - Fan Token CAI", "CHZ - Chiliz", "CITYFT - BARFT", "COMP - Compound",
                                  "CRV - Curve", "DAI - Dai", "DAL - Balancer", "ENJ - Enjin", "ETH - Ethereum", "GALFT - Fan Token GAL",
                                  "GALOFT - Clube Atletico Mineiro", "GRT - The Graph", "IMOB01 - None", "IMOB02 - None",
                                  "INTERFT - Inter Milan FT", "JUVFT - Fan Token JUV", "KNC - Kyber Network", "LINK - CHAINLINK",
                                  "LTC - Litecoin", "MANA - MANA (Decentraland)", "MATIC - Polygon", "MBCCSH01 - Consorcio H01",
                                  "MBCONS01 - Cota de Consórcio 01", "MBCONS02 - Cota de Consórcio 02", "MBFP01 - None", "MBFP02 - None",
                                  "MBFP03 - None", "MBFP04 - None", "MBFP05 - None", "MBPRK01 - Precatório MB SP01",
                                  "MBPRK02 - Precatório MB SP02", "MBPRK03 - Precatório MB BR03", "MBPRK04 - Precatório MB RJ04",
                                  "MBPRK05 - Fluxo de Pagamentos 5", "MBPRK06 - Precatorio MB BR06", "MBSANTOS01 - Token da Vila",
                                  "MBVASCO01 - MBVASCO01", "MCO2 - MCO2", "MENGO - None", "MENGOFT - Flamengo", "MKR - Maker", "NAVIFT - BARFT",
                                  "OGFT - Fan Token ASR", "OMG - Omg Network", "PAXG - PAX Gold", "PFLFT - BARFT",
                                  "PORFT - Portugal National Team FT", "PSGFT - Fan Token PSG", "REI - Ren", "REN - Ren", "SAUBERFT - BARFT",
                                  "SCCPFT - Corinthians", "SNX - Synthetix", "SPFCFT - SPFC", "STVFT - Sint-Truidense FT", "SUSHI - SushiSwap",
                                  "THFT - BARFT", "UFCFT - UFC FT", "UMA - Uma", "UNI - Uniswap", "USDC - USD Coin", "WBTC - Wrapped Bitcoin",
                                  "WBX - WiBX", "XRP - XRP", "YBOFT - BSC Young Boys", "YFI - Yearn", "ZRX - 0x"]
    
    var body: some View {
        VStack {
            Text("Select a coin:")
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: UIScreen.main.bounds.size.width-18, height: 32)
                    .foregroundColor(.green)
                        
                Picker("", selection: $selected) {
                    ForEach(0 ..< descriptions.count) {
                        Text(descriptions[$0])
                    }
                }
                .pickerStyle(WheelPickerStyle())
            }
            Button(action: {
                _ = apiService.get(completionHandler: self.onCompleteLoadConsultas)
            }) {
                Text("API")
            }
        }
    }
    
    private func onCompleteLoadConsultas(response: DataResponse<ResultsResponse<Ticker>, AFError>) {
        switch response.result {
        case let .success(crudResponse):
            print(crudResponse.results)
            /*DispatchQueue.main.async {
                self.tableView.reloadData()
                self.refreshControl?.endRefreshing()
            }*/
        case let .failure(error):
            DispatchQueue.main.async {
                var errorMessage = error.errorDescription ?? "Erro desconhecido, por favor tente novamente"
                if response.data != nil {
                    let message = String(bytes: response.data!, encoding: .utf8)!
                    if !message.isEmpty {
                        errorMessage = message
                    }
                }
                /*let alert = UIUtilities.createDefaultAlert(
                    title: "Erro",
                    message: errorMessage)*/
                /*self.loadingIndicator
                    .dismiss(animated: true,
                             completion: { UIUtilities.showAlert(controller: self, alert: alert) })*/
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
