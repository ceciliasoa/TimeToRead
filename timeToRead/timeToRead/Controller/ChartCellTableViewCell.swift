//
//  ChartCellTableViewCell.swift
//  timeToRead
//
//  Created by Cecilia Soares on 18/08/20.
//  Copyright © 2020 Cecilia Soares. All rights reserved.
//

import UIKit
import Charts

class ChartCellTableViewCell: UITableViewCell {

    @IBOutlet weak var viewBg: UIView!
    @IBOutlet weak var readPageLabel: UILabel!
    
    @IBOutlet weak var totalPages: UILabel!
    @IBOutlet weak var chartView: PieChartView!
    
    var totalPagesBook = PieChartDataEntry(value: 0)
    var readPageBook = PieChartDataEntry(value: 0)
    
    var chartBook = [PieChartDataEntry]()
    static var xibName = "ChartCellTableViewCell"
    static var identifier = "chartCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewBg.backgroundColor = .backgroundColor
        readPageLabel.text = "Você leu \(Reading.shared.readedPage()) páginas"
        readPageLabel.font = .systemFont(ofSize: 17, weight: .regular)
        readPageLabel.textColor = .textColor
        totalPages.textColor = .textColor
        totalPages.font = .systemFont(ofSize: 17, weight: .regular)
        totalPages.text = "\(Reading.shared.convertFinalPage())/\(Reading.shared.convertTotalPage()) páginas"
        // Initialization code
        
        totalPagesBook.value = 100 - Reading.shared.totalRead()
        readPageBook.value = Reading.shared.totalRead()
        
        
        chartView.rotationEnabled = false
        chartView.entryLabelColor = .black
        
        chartBook = [readPageBook, totalPagesBook]
        updateChart()
    }
    
    func updateChart() {
        let chartset = PieChartDataSet.init(entries: chartBook, label: nil)

        
        chartset.valueColors = [UIColor.white, UIColor.primaryColor]
        
        
        let chartData = PieChartData(dataSet: chartset)
        
        
        let colors = [UIColor.secundaryColor, UIColor.primaryColor]
        chartset.colors = colors
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 1
        formatter.multiplier = 1.0
        chartData.setValueFormatter(DefaultValueFormatter(formatter: formatter))
       
        chartView.isUserInteractionEnabled = false
        chartView.legend.enabled = false
        chartView.data = chartData
        
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
}

