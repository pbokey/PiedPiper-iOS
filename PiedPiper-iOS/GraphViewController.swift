//
//  GraphViewController.swift
//  PiedPiper-iOS
//
//  Created by Pranav Bokey on 12/3/17.
//  Copyright © 2017 Pranav Bokey. All rights reserved.
//

import UIKit
import Charts

class GraphViewController: UIViewController {
    var sightingList = [RatSighting]()
    
    //    @IBOutlet weak var chtChart: LineChartView!
        @IBOutlet weak var chtChart: BarChartView!
    
    var numbers : [Double] = []
    
//    var formato:BarChartFormatter = BarChartFormatter()
    var times: [String]! = []
    
    func addTime(newTime: String) {
        times.append(newTime)
    }
    
    func setDataCount(_ count: Int, range: UInt32) {
//        let xaxis:XAxis = XAxis()
        
        let start = 1
        var ind = 0;
        let yVals = (start..<start+count+1).map { (i) -> BarChartDataEntry in
            let val = numbers[ind]
            ind += 1
//            formato.stringForValue(Double(i), axis: xaxis)
            return BarChartDataEntry(x: Double(i), y: val)
        }
        
//        xaxis.valueFormatter = formato
        //        chtChart.xAxis.valueFormatter = xaxis.valueFormatter
        chtChart.xAxis.valueFormatter = IndexAxisValueFormatter(values: times)
        chtChart.xAxis.granularity = 1
        chtChart.xAxis.labelPosition = .bottom
        chtChart.xAxis.enabled = true
        chtChart.chartDescription?.enabled = false;
        
        var set1: BarChartDataSet! = nil
        if let set = chtChart.data?.dataSets.first as? BarChartDataSet {
            set1 = set
            set1.values = yVals
            chtChart.data?.notifyDataChanged()
            chtChart.notifyDataSetChanged()
        } else {
            set1 = BarChartDataSet(values: yVals, label: "The year 2017")
            set1.colors = ChartColorTemplates.material()
            set1.drawValuesEnabled = false
            
            let data = BarChartData(dataSet: set1)
            data.setValueFont(UIFont(name: "HelveticaNeue-Light", size: 10)!)
            data.barWidth = 0.9
            chtChart.data = data
        }
        
        //        chartView.setNeedsDisplay()
    }
    
//    func updateGraph(){
//        var lineChartEntry  = [ChartDataEntry]() //this is the Array that will eventually be displayed on the graph.
//
//
//        //here is the for loop
//        for i in 0..<numbers.count {
//
//            let value = ChartDataEntry(x: Double(i), y: numbers[i]) // here we set the X and Y status in a data chart entry
//            lineChartEntry.append(value) // here we add it to the data set
//        }
//
//        let line1 = LineChartDataSet(values: lineChartEntry, label: "Number") //Here we convert lineChartEntry to a LineChartDataSet
//        line1.colors = [NSUIColor.blue] //Sets the colour to blue
//
//        let data = LineChartData() //This is the object that will be added to the chart
//        data.addDataSet(line1) //Adds the line to the dataSet
//
//
//        chtChart.data = data //finally - it adds the chart data to the chart and causes an update
//        chtChart.chartDescription?.text = "Rat Sighting Occurances" // Here we set the description for the graph
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let list = RatSightingList()
        list.databaseListUpdate { (arr) in
            self.sightingList = arr
            self.setupGraph()
        }
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        //options
//        chtChart.chartDescription?.text = "Rat Sighting Occurances" // Here we set the description for the graph
    }
    
    func setupGraph() {
        // options
        chtChart.dragEnabled = false
        chtChart.legend.enabled = false
        chtChart.doubleTapToZoomEnabled = false

        chtChart.leftAxis.drawZeroLineEnabled = false
        
        let outputDateFormatter = DateFormatter();
        outputDateFormatter.dateFormat = "MM/dd/yy";
        

        // set data
        if (self.sightingList.count == 0) {
            addTime(newTime: outputDateFormatter.string(from: Date()))
            numbers.append(0);
            self.setDataCount(numbers.count - 1, range: 1)
            return;
        }
        let dateFormatter = DateFormatter();
        dateFormatter.dateFormat = "MM/dd/yy HH:mm";
        var ratDates : [Date] = []
        for item in self.sightingList {
            var date = dateFormatter.date(from: item.createdDate);
            if let d = date {
                ratDates.append(d);
            } else {
                let newDateFormatter = DateFormatter();
                newDateFormatter.dateFormat = "MM/dd/yy";
                let newDate = newDateFormatter.date(from: item.createdDate)
                if let nd = newDate {
                    ratDates.append(nd);
                } else {
                    print (item.createdDate)
                    ratDates.append(Date())
                }
            }
        }
        ratDates.sort();
        var prevDate = outputDateFormatter.string(from: ratDates[0])
        
        var count = 0
        var maxCount = 0
        var currDate: String = ""
        var date: Date = Date()
        for _date in ratDates {
            date = _date
            currDate = outputDateFormatter.string(from: _date)
            if (currDate == prevDate) {
                count += 1;
            } else {
                addTime(newTime: outputDateFormatter.string(from: date))
                numbers.append(Double(count));
                if (count > maxCount) {
                    maxCount = count
                }
                prevDate = currDate;
                count = 0;
            }
        }
        if (count > 0) {
            addTime(newTime: outputDateFormatter.string(from: date))
            numbers.append(Double(count));
        }
        
//        addTime(newTime: dateFormatter.string(from: Date()))
        if (count > maxCount) {
            maxCount = count
        }
        maxCount += 1
//        updateGraph();
        self.setDataCount(numbers.count - 1, range: UInt32(maxCount))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
