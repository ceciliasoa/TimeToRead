//
//  ChartCellTableViewCell.swift
//  timeToRead
//
//  Created by Cecilia Soares on 18/08/20.
//  Copyright © 2020 Cecilia Soares. All rights reserved.
//

import UIKit

class ChartCellTableViewCell: UITableViewCell {

    @IBOutlet weak var viewBg: UIView!
    @IBOutlet weak var readPageLabel: UILabel!
    
    @IBOutlet weak var totalPages: UILabel!
    
    static var xibName = "ChartCellTableViewCell"
    static var identifier = "chartCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewBg.backgroundColor = .backgroundColor
        readPageLabel.text = "Você leu 15 páginas!"
        readPageLabel.font = .systemFont(ofSize: 17, weight: .regular)
        readPageLabel.textColor = .textColor
        totalPages.textColor = .textColor
        totalPages.font = .systemFont(ofSize: 17, weight: .regular)
        totalPages.text = "50/500 páginas lidas"
        // Initialization code
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
}
