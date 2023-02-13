//
//  ChartVC.swift
//  CryptoCoin
//
//  Created by Ilfeld, Yehuda on 10/02/2023.
//

import UIKit
import Charts


class ChartVC: BaseViewController, ChartViewDelegate, Bindable {
    
    var chartView = BarChartView()
    
    var marketInfo = MarketInfo(title: "", data: [CoinData]())
    var viewModel = ChartViewModel(marketInfo: MarketInfo(title: "", data: [CoinData]()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel()
        self.viewModel.marketInfo = self.marketInfo
        self.viewModel.getData()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        chartView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height * 0.7)
        chartView.center = view.center
        view.addSubview(self.chartView)
    }
    
    func bindViewModel() {
        self.viewModel.data.valueChanged = { [weak self] barChartEntries in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.setBarChartDataSet(entries: barChartEntries)
                self.setupChart()
            }
        }
    }
    
    func setBarChartDataSet(entries: [BarChartDataEntry]) {
        let set = BarChartDataSet(entries: entries)
        set.setColor(.red)
        set.highlightColor = .systemPink
        set.highlightAlpha = 1
        
        let data = BarChartData(dataSet: set)
        data.setDrawValues(false)
        data.setValueTextColor(.blue)
        self.chartView.data = data
    }
    
    func setupChart() {
        chartView.delegate = self
        
        // Hightlight
        chartView.highlightPerTapEnabled = true
        chartView.highlightFullBarEnabled = true
        chartView.highlightPerDragEnabled = false
        
        // disable zoom function
        chartView.pinchZoomEnabled = false
        chartView.setScaleEnabled(false)
        chartView.doubleTapToZoomEnabled = false
        
        // Bar, Grid Line, Background
        chartView.drawBarShadowEnabled = false
        chartView.drawGridBackgroundEnabled = false
        chartView.drawBordersEnabled = false
        chartView.borderColor = .blue
        
        // Legend
        chartView.legend.enabled = false
        
        // Chart Offset
        chartView.setExtraOffsets(left: 10, top: 20, right: 20, bottom: 50)
        
        // Animation
        chartView.animate(yAxisDuration: 1.5 , easingOption: .easeOutBounce)
        
        // Setup X axis
        let xAxis = chartView.xAxis
        xAxis.labelPosition = .bottom
        xAxis.drawAxisLineEnabled = true
        xAxis.drawGridLinesEnabled = false
        xAxis.granularityEnabled = false
        xAxis.labelRotationAngle = -25
        xAxis.setLabelCount(self.viewModel.items.count, force: false)
        xAxis.valueFormatter = IndexAxisValueFormatter(values: self.viewModel.items.map { $0.coin })
        xAxis.axisMaximum = Double(self.viewModel.items.count)
        xAxis.axisLineColor = .blue
        xAxis.labelTextColor = .blue
                
        // Setup left axis
        let leftAxis = chartView.leftAxis
        leftAxis.drawTopYLabelEntryEnabled = true
        leftAxis.drawAxisLineEnabled = true
        leftAxis.drawGridLinesEnabled = true
        leftAxis.granularityEnabled = false
        leftAxis.axisLineColor = .blue
        leftAxis.labelTextColor = .blue
        
        leftAxis.setLabelCount(6, force: true)
        leftAxis.axisMinimum = self.viewModel.coinMinimum
        leftAxis.axisMaximum = self.viewModel.coinMaximum
        
        // Remove right axis
        let rightAxis = chartView.rightAxis
        rightAxis.enabled = false
    }
    
}
