//
//  PagesBookCollectionViewCell.swift
//  timeToRead
//
//  Created by Cecilia Soares on 18/08/20.
//  Copyright © 2020 Cecilia Soares. All rights reserved.
//

import UIKit

class PagesBookCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewBG: UIView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var pagesTextField: UITextField!
    
    static var xibName = "PagesBookCollectionViewCell"
    static var identifier = "PagesBooksCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        viewBG.backgroundColor = .backgroundColor
        labelTitle.text = "Quantas páginas tem o livro?"
        labelTitle.textColor = .textColor
        labelTitle.font = .systemFont(ofSize: 24, weight: .semibold)
        pagesTextField.borderStyle = .roundedRect
        pagesTextField.tintColor = .secundaryColor
        pagesTextField.textColor = .textColor
//        pagesTextField.setUnderLine()

    }
    

}
//extension UITextField {
//
//    func setUnderLine() {
//        let border = CALayer()
//        let width = CGFloat(0.5)
//        border.borderColor = UIColor.darkGray.cgColor
//        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width - 10, height: self.frame.size.height)
//        border.bounds = CGRect(x: 0, y: 0, width:  self.frame.size.width, height: self.frame.size.height)
//        border.borderWidth = width
//        self.layer.addSublayer(border)
//        self.layer.masksToBounds = true
//
//    }

//}
