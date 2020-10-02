//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation
import UIKit
protocol CoinManagerDelegate {
    func updateUI(_ coinObject:bitcoin)
}

struct CoinManager {
   
    let baseURL = "https://rest.coinapi.io/v1/exchangerate"
    let apiKey = "DF4F5C08-DABE-49EA-9144-64F755770549"
    
    let currencyArray = ["AUD", "BRL","CAD","EUR","GBP","HKD","IDR","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
     
    let CoinArray = ["LTC","BTC","ETH"]
    var delegate:CoinManagerDelegate?
    
       
    
    
    func getURL(_ url:String,_ currency:String?){
        var req:String = ""
        DispatchQueue.global(qos: .userInteractive).async {
            if let coinType = currency{
             req = "\(self.baseURL)/\(coinType)/\(url)?apikey=\(self.apiKey)"
               print(req)
            }else{
                 req = "\(self.baseURL)/BTC/\(url)?apikey=\(self.apiKey)"
            print(req)
            }
            let request = URL(string:req)
            self.datasession(url: request!)
        }
        
    }
    func datasession(url:URL) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) {(data,response,error) in
            if(error != nil) {
                print(error!)
            }
            if let price = data {
                let  pricebtc = String(data:price,encoding: .utf8)
               let Bitcoin = self.parseJson(price)
                if let obj = Bitcoin {
                self.delegate?.updateUI(obj)
                }
                else{
                   print(error)
                }
            }
    }
        task.resume()
    }
    func parseJson(_ pricedata:Data)->bitcoin? {
         let decoder = JSONDecoder()
        do {
            let bit = try decoder.decode(bitcoin.self, from: pricedata)
            let price = bit.rate
            let currency = bit.asset_id_quote
            let coin = bit.asset_id_base
            let bitobj =  bitcoin(asset_id_base: coin, rate: price, asset_id_quote: currency)
             return bitobj
            
                }
               catch {
                   print("error found")
                   return nil
               }
    }
}

