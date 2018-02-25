//
//  StocksModel.swift
//  StocksDemo
//
//  Created by Dileep on 2/25/18.
//  Copyright © 2018 Dileep. All rights reserved.
//

import UIKit

class StocksModel: NSObject {
    
    @objc dynamic var symbol: String = ""
     @objc dynamic var name: String = ""
    @objc dynamic var exch: String = ""
    @objc dynamic var type: String = ""
    @objc dynamic var exchDisp: String = ""
    @objc dynamic var typeDisp: String = ""
    
    convenience init(stockDict: [String:Any]) {
        self.init()
        symbol = stockDict["symbol"] as? String ?? ""
        name = stockDict["name"] as? String ?? ""
        exch = stockDict["exch"] as? String ?? ""
        type = stockDict["type"] as? String ?? ""
        exchDisp = stockDict["exchDisp"] as? String ?? ""
        typeDisp = stockDict["typeDisp"] as? String ?? ""
        
        
    }
    
    
}
