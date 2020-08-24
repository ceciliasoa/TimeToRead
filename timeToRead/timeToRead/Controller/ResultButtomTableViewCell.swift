//
//  ResultButtomTableViewCell.swift
//  timeToRead
//
//  Created by Cecilia Soares on 18/08/20.
//  Copyright © 2020 Cecilia Soares. All rights reserved.
//

import UIKit

protocol ResultButtonDelegate: UIViewController {
    func unwind()
}
class ResultButtomTableViewCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var resultButton: UIButton!
    static var xibName = "ResultButtomTableViewCell"
    static var identifier = "buttonCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        view.backgroundColor = .backgroundColor
        resultButton.backgroundColor = .textColor
        resultButton.layer.cornerRadius = 8
        resultButton.setTitle("Finalizar", for: .normal)
        resultButton.setTitleColor(.white, for: .normal)
        resultButton.titleLabel?.font = .systemFont(ofSize: 24, weight: .medium)

    }
    
    weak var delegate: ResultButtonDelegate?

    @IBAction func ResultUnwind(_ sender: Any) {
        delegate?.unwind()
    }
    
}
