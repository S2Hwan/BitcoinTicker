//
//  ETHViewController.swift
//  BitCoinTicker
//
//  Created by S2H on 2018. 5. 26..
//  Copyright © 2018년 S2H. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ETHViewController: UIViewController {

    @IBOutlet weak var lastLabel: UILabel!
    @IBOutlet weak var bidLabel: UILabel!
    @IBOutlet weak var askLabel: UILabel!
    @IBOutlet weak var lowLabel: UILabel!
    @IBOutlet weak var highLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    
    let coinURL = "https://api.korbit.co.kr/v1/ticker/detailed?currency_pair=eth_krw"
    
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
                
                let bitcoinJSON : JSON = JSON(response.result.value as Any)
                
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
        
        let lastResult = json["last"].intValue
        let bidResult = json["bid"].intValue
        let askResult = json["ask"].intValue
        let lowResult = json["low"].intValue
        let highResult = json["high"].intValue
        let percentResult = json["changePercent"].doubleValue
        
        lastLabel.text = String(lastResult) + " 원"
        bidLabel.text = String(bidResult) + " 원"
        askLabel.text = String(askResult) + " 원"
        lowLabel.text = String(lowResult) + " 원"
        highLabel.text = String(highResult) + " 원"
        percentLabel.text = String(percentResult) + " %"
        
    }
}
