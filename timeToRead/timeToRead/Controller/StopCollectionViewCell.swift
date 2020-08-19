//
//  StopCollectionViewCell.swift
//  timeToRead
//
//  Created by Cecilia Soares on 17/08/20.
//  Copyright © 2020 Cecilia Soares. All rights reserved.
//

import UIKit

protocol StopButtonDelegate: UICollectionViewController {
    func stop()
}
class StopCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewBg: UIView!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    
    static var xibName = "StopCollectionViewCell"
    static var identifier = "stopCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewBg.backgroundColor = .backgroundColor
        stopButton.backgroundColor = .primaryColor
        stopButton.layer.cornerRadius = 8
        stopButton.setTitleColor(.white, for: .normal)
        stopButton.titleLabel?.font = .systemFont(ofSize: 24, weight: .medium)
        pauseButton.titleLabel?.font = .systemFont(ofSize: 24, weight: .medium)
        pauseButton.layer.cornerRadius = 8
        pauseButton.backgroundColor = .primaryColor
        pauseButton.setTitleColor(.white, for: .normal)
        
    }
    weak var delegate: StopButtonDelegate?
    @IBAction func PausePressed(_ sender: Any) {
        if pauseButton.isSelected == false{
            pauseButton.setTitle("Continuar", for: .selected)
            pauseButton.tintColor = .primaryColor
            pauseButton.isSelected = true
        }else{
            pauseButton.isSelected = false
            
        }
    }
    
    @IBAction func StopPressed(_ sender: Any) {
        delegate?.stop()
    }
    
    

}
