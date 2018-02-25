
//
//  StockDetailTableViewCell.swift
//  StocksDemo
//
//  Created by Dileep on 2/25/18.
//  Copyright © 2018 Dileep. All rights reserved.
//

import UIKit

class StockDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var exchDispLabel: UILabel!
    @IBOutlet weak var exchLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var typeDispLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
