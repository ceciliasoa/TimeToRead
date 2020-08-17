//
//  TimeCollectionViewCell.swift
//  timeToRead
//
//  Created by Cecilia Soares on 14/08/20.
//  Copyright © 2020 Cecilia Soares. All rights reserved.
//

import UIKit

class TimeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewTimer: UIView!
    @IBOutlet weak var labelTimer: UILabel!
    static var xibName = "TimeCollectionViewCell"
    static var identifier = "timerCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewTimer.layer.cornerRadius = 8
        labelTimer.font = UIFont.monospacedSystemFont(ofSize: 60, weight: .medium)
        labelTimer.textColor = .secundaryColor
        labelTimer.text = "00:00"
        // Initialization code
    }

}
