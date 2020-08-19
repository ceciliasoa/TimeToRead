//
//  StartCollectionViewCell.swift
//  timeToRead
//
//  Created by Cecilia Soares on 14/08/20.
//  Copyright © 2020 Cecilia Soares. All rights reserved.
//

import UIKit


protocol StartButtonDelegate: UICollectionViewController {
    func start()
}
class StartCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var startButton: UIButton!
    var theValue = 0.1
    static var xibName = "StartCollectionViewCell"
    static var identifier = "startCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        startButton.tintColor = .white
        startButton.backgroundColor = .primaryColor
        startButton.layer.cornerRadius = 8
        startButton.titleLabel?.font = .systemFont(ofSize: 24, weight: .medium)
        
       
    }
    weak var delegate: StartButtonDelegate?
    @IBAction func startBt(_ sender: Any) {
        delegate?.start()
    }
    
    
}
