//
//  YearMobileDataUsage.swift
//  SwiftDemo
//
//  Created by zhulei on 2021/5/19.
//

import UIKit

class YearMobileDataUsage: NSObject {

    var year: String?
    var volumeOfMobileData: String?
    var isDecrease: Bool = false
    
    var quarterlyArray = [QuarterlyMobileDataUsage]();
    
    static func transQuarterlyDataToYearData(sourceData: [QuarterlyMobileDataUsage]) -> ([YearMobileDataUsage]) {
        
        var yearDataDic: [String : YearMobileDataUsage] = [String : YearMobileDataUsage]()
       
        var lastVolume : Double = 0
        
        for data: QuarterlyMobileDataUsage in sourceData {
            let lenth = data.quarter?.count ?? 0;
            if (data.quarter != nil && lenth >= 4) {
                let year: String = String(data.quarter!.prefix(4));
                let yearData: YearMobileDataUsage? = yearDataDic[year]
                if (yearData != nil) {
                    let currentVolume: Double = Double(yearData!.volumeOfMobileData!)!
                    let additionalVolume: Double = Double(data.volumeOfMobileData!)!
                    let volumeOfYear: Double = currentVolume + additionalVolume;
                    yearData?.volumeOfMobileData = String(volumeOfYear)
                    yearData?.quarterlyArray.append(data)
                    
                    if additionalVolume < lastVolume {
                        yearData?.isDecrease = true
                    }
                    lastVolume = additionalVolume
                } else {
                    let yearData: YearMobileDataUsage = YearMobileDataUsage()
                    yearData.year = year;
                    yearData.volumeOfMobileData = data.volumeOfMobileData
                    yearData.quarterlyArray.append(data)
                    yearDataDic[year] = yearData
                    lastVolume = Double(yearData.volumeOfMobileData!)!
                }
            }
        }
        
        var yearArray: [YearMobileDataUsage] = [YearMobileDataUsage]()
        
        let dictKeys = [String](yearDataDic.keys)
        let sortedKeys = dictKeys.sorted()
        
        for (key) in sortedKeys {
            let value = yearDataDic[key]
            if (value != nil) {
                yearArray.append(value!)
            }
        }
        return yearArray
    }
    
    
}
