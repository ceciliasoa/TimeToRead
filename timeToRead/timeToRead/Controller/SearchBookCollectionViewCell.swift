//
//  SearchBookCollectionViewCell.swift
//  timeToRead
//
//  Created by Cecilia Soares on 17/08/20.
//  Copyright © 2020 Cecilia Soares. All rights reserved.
//

import UIKit

class SearchBookCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var searchBook: UISearchBar!
    @IBOutlet weak var viewBg: UIView!
    
  
    static var xibName = "SearchBookCollectionViewCell"
    static var identifier = "searchCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
       
//        searchBook.isTranslucent = true
        searchBook.barTintColor = .backgroundColor
        searchBook.searchBarStyle = .minimal
//        searchBook.searchTextField.backgroundColor = .white
        searchBook.searchTextField.tintColor = .secundaryColor
        searchBook.searchTextField.textColor = .textColor
      

        viewBg.backgroundColor = .backgroundColor
    }

}
