//
//  ShowBookCollectionViewCell.swift
//  timeToRead
//
//  Created by Cecilia Soares on 21/08/20.
//  Copyright © 2020 Cecilia Soares. All rights reserved.
//

import UIKit

class ShowBookCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewBG: UIView!
    
    @IBOutlet weak var livroLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var pageLabel: UILabel!
    
    static var xibName = "ShowBookCollectionViewCell"
    static var identifier = "showBookCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewBG.layer.cornerRadius = 8
        livroLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        livroLabel.textColor = .textColor
        titleLabel.font = .systemFont(ofSize: 20, weight: .medium)
        titleLabel.textColor = .secundaryColor
        authorLabel.font = .systemFont(ofSize: 20, weight: .medium)
        authorLabel.textColor = .secundaryColor
        pageLabel.font = .systemFont(ofSize: 20, weight: .medium)
        pageLabel.textColor = .secundaryColor
        
        
    }

}
