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
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var timerBg: UIView!
    
    static var xibName = "StopCollectionViewCell"
    static var identifier = "stopCell"
    
//    timer começa inicializaado
    var isTimerOn = true
    var timer = Timer()
    var duration = 0.0
    
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
        timerLabel.font = UIFont.monospacedSystemFont(ofSize: 60, weight: .medium)
        timerLabel.textColor = .secundaryColor
        timerLabel.text = "00:00"
        timerBg.backgroundColor = .white
        timerBg.layer.cornerRadius = 8
        toggleTimer(on: isTimerOn)
        
    }
    
    func toggleTimer(on: Bool){
        if on {
//       configurando o timer
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] (_) in
            guard let strongSelf = self else { return }
            strongSelf.duration += 1
            
            
            let formatter = DateComponentsFormatter()
            formatter.unitsStyle = .positional // Use the appropriate positioning for the current locale
            formatter.allowedUnits = [.minute, .second ] // Units to display in the formatted string
            formatter.zeroFormattingBehavior = [ .pad ] // Pad with zeroes where appropriate for the locale
            let formattedDuration = formatter.string(from: self?.duration ?? 0.0)
            
            guard let formatted = formattedDuration else {return}
            strongSelf.timerLabel.text = String(formatted)
            
        })
        }else{
//            pausa
            timer.invalidate()
        }
    }
    
    
    
    weak var delegate: StopButtonDelegate?
    @IBAction func PausePressed(_ sender: Any) {
        if pauseButton.isSelected == false{
            pauseButton.setTitle("Continuar", for: .selected)
            pauseButton.tintColor = .primaryColor
            pauseButton.isSelected = true
            isTimerOn = false
            toggleTimer(on: isTimerOn)
            
        }else{
            pauseButton.isSelected = false
            isTimerOn = true
            toggleTimer(on: isTimerOn)
            
        }
    }
    
    @IBAction func StopPressed(_ sender: Any) {
        delegate?.stop()
        timer.invalidate()
        if pauseButton.isSelected == false{
            pauseButton.setTitle("Continuar", for: .selected)
            pauseButton.tintColor = .primaryColor
            pauseButton.isSelected = true
            Duration.shared.timerDuration = duration

        }
        
    }
    
    

}
