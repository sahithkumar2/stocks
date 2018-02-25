//
//  ViewController.swift
//  StocksDemo
//
//  Created by Dileep on 2/25/18.
//  Copyright © 2018 Dileep. All rights reserved.
//

import UIKit
import SwiftyJSON
import CoreLocation
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var stockDetailTableView: UITableView!
    var stockDataArray = [StocksModel]()
   
    
    // MARK: - Custom Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Stocks List"
        
        stockDetailTableView.rowHeight = UITableViewAutomaticDimension
        let reachability = Reachability()!
        let networkStatus = reachability.currentReachabilityStatus.description
        
        if networkStatus == "No Connection" {
            showAlert(message: noInternetMessage, title: alertTitle)
        }
        else{
            let loadingNotification = MBProgressHUD.showAdded(to: self.view, animated: true)
            loadingNotification?.mode = MBProgressHUDMode.indeterminate
            loadingNotification?.labelText = loading
            
            let serialQueue = DispatchQueue(label: "com.StockDemo.queue")
            serialQueue.sync {
              makeServiceRequest("https://autoc.finance.yahoo.com/autoc?query=A&region=2&lang=en")
            }
            serialQueue.sync {
                makeServiceRequest("https://autoc.finance.yahoo.com/autoc?query=G&region=2&lang=en")
            }
            serialQueue.sync {
                 makeServiceRequest("https://autoc.finance.yahoo.com/autoc?query=F&region=2&lang=en")
            }

            serialQueue.sync {
                makeServiceRequest("https://autoc.finance.yahoo.com/autoc?query=M&region=2&lang=en")
            }

            
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Custom Methods
    
    func makeServiceRequest(_ urlString : String)  {
        let loadingNotification = MBProgressHUD.showAdded(to: self.view, animated: true)
        loadingNotification?.mode = MBProgressHUDMode.indeterminate
        loadingNotification?.labelText = loading
        let url = URL(string: urlString)
        ModelHelper.makeGetRequestWithURL(url!) { (result, data, eror_message) -> () in
            DispatchQueue.main.async {
                MBProgressHUD.hideAllHUDs(for: self.view, animated: true)
            }
            if(result){
                
                    if let resultSetArray = data["ResultSet"]["Result"].arrayObject as? [NSDictionary] {
                        DispatchQueue.main.async {
                            self.stockDataArray.append(contentsOf: ModelHelper.createModelObject(recievedDataArray: resultSetArray))
                                
                            self.stockDetailTableView.reloadData()
                        }
                    }

                    
                
                
            }
            else{
                self.showAlert(message: gereErrMessage, title: alertTitle)
                
            }
        }
    }
    
    func showAlert(message: String, title: String)
    {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alertView, animated: true, completion: nil)
    }
    
   
    
}

// MARK: - UITableView DataSource abd Delegate

extension ViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCellIdentifier", for: indexPath as IndexPath) as! TableViewCell
        let stockObject = self.stockDataArray[indexPath.row]
        cell.companyNameLabel.text = stockObject.name
        cell.exchDispLabel.text = stockObject.exchDisp
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.stockDataArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return UITableViewAutomaticDimension
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        if let stockVc = self.storyboard?.instantiateViewController(withIdentifier: "StocksDetailViewControllerID") as? StocksDetailViewController {
            stockVc.stockDataObj = stockDataArray[indexPath.row]
            self.navigationController?.pushViewController(stockVc, animated: true)
        }
        
        
    }
    
    
}


