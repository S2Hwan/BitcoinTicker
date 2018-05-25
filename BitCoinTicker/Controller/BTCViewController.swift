//
//  BTCViewController.swift
//  BitCoinTicker
//
//  Created by S2H on 2018. 5. 26..
//  Copyright © 2018년 S2H. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class BTCViewController: UIViewController {
    
    let coinURL = "https://api.korbit.co.kr/v1/ticker/detailed?currency_pair=btc_krw"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getBitcoinData(url: coinURL)
    }
    
    
    
    //MARK: - Networking
    /***************************************************************/
    
    func getBitcoinData(url: String) {
        
        Alamofire.request(url, method: .get).responseJSON { (response) in
            if response.result.isSuccess {
                
                //print("Success")
                
                let bitcoinJSON : JSON = JSON(response.result.value)
                
                self.updateBitcoinData(json: bitcoinJSON)
                

                print(bitcoinJSON)
                
            } else {
                print("Error: \(String(describing: response.result.value))")
                
            }
        }
    }
    
    /***************************************************************/
    //MARK: - JSON Parsing
    
    func updateBitcoinData(json : JSON) {
        
        let bitcoinResult = json["data"]["opening_price"].intValue
        let bitcoinResult2 = json["data"]["closing_price"].intValue
        
        
        
//        currencyLabel.text = String(bitcoinResult)
//        priceLabel.text = String(bitcoinResult2)
        
        
    }

   

}
