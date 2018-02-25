//
//  StocksDetailViewController.swift
//  StocksDemo
//
//  Created by Dileep on 2/25/18.
//  Copyright © 2018 Dileep. All rights reserved.
//

import UIKit
//StockDetailTableViewCellIdentifier
class StocksDetailViewController: UIViewController {
    var stockDataObj = StocksModel()
    @IBOutlet weak var stockDetailTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Stock Detail List"
        stockDetailTableView.rowHeight = UITableViewAutomaticDimension

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension StocksDetailViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StockDetailTableViewCellIdentifier", for: indexPath as IndexPath) as! StockDetailTableViewCell
        cell.companyNameLabel.text = self.stockDataObj.name
        cell.exchDispLabel.text = self.stockDataObj.exchDisp
        cell.symbolLabel.text = self.stockDataObj.symbol
        cell.exchLabel.text = self.stockDataObj.exch
        cell.typeLabel.text = self.stockDataObj.type
        cell.typeDispLabel.text = self.stockDataObj.typeDisp
      return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 300
        
    }
    
    
    
}



