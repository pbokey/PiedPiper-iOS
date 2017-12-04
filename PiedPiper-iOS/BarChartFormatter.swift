//
//  BarChartFormatter.swift
//  PiedPiper-iOS
//
//  Created by Sunwoo Yim on 12/4/17.
//  Copyright © 2017 Pranav Bokey. All rights reserved.
//

import UIKit
import Foundation
import Charts

@objc(BarChartFormatter)
public class BarChartFormatter: NSObject, IAxisValueFormatter{
    
    var times: [String]! = []
    
    public func addTime(newTime: String) {
        times.append(newTime)
    }
    
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return times[Int(value)]
    }
}
