//
//  NumPageCollectionViewCell.swift
//  timeToRead
//
//  Created by Cecilia Soares on 14/08/20.
//  Copyright © 2020 Cecilia Soares. All rights reserved.
//

import UIKit

class NumPageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewBg: UIView!
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var textFieldNumPage: UITextField!
    
    @IBOutlet weak var percentegeButton: UIButton!
    
    @IBOutlet weak var pageButton: UIButton!
    
    static var xibName = "NumPageCollectionViewCell"
    static var identifier = "NumPageCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        viewBg.backgroundColor = .backgroundColor
        labelTitle.font = .systemFont(ofSize: 24, weight: .semibold)
        labelTitle.textColor = .textColor
        pageButton.titleLabel?.tintColor = .textColor
        pageButton.tintColor = .auxiliarColor
        pageButton.setTitleColor(.textColor, for: .normal)
        pageButton.setTitleColor(.textColor, for: .selected)
        percentegeButton.tintColor = .auxiliarColor
        percentegeButton.setTitleColor(.textColor, for: .normal)
        percentegeButton.setTitleColor(.textColor, for: .selected)
        textFieldNumPage.backgroundColor = .white
        textFieldNumPage.borderStyle = .roundedRect
        textFieldNumPage.tintColor = .secundaryColor
        textFieldNumPage.textColor = .textColor
        
//        textFieldNumPage.delegate = self
        

//        percentegeButton.setTitle("oioi", for: .normal)
        
    }

    
    
    
    @IBAction func percentBtt(_ sender: Any) {
        
        if percentegeButton.isSelected == false{
            percentegeButton.isSelected = true
            percentegeButton.tintColor = .secundaryColor
            pageButton.isSelected = false
            pageButton.tintColor = .auxiliarColor
        }
    }
    
    @IBAction func pageBt(_ sender: Any) {
        if pageButton.isSelected == false{
            pageButton.isSelected = true
            pageButton.tintColor = .secundaryColor
            percentegeButton.isSelected = false
            percentegeButton.tintColor = .auxiliarColor
        }
    }

}

//extension NumPageCollectionViewCell: UITextFieldDelegate{
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        return 1
//    }
//}
