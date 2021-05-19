//
//  ViewController.swift
//  SwiftDemo
//
//  Created by apple on 2021/5/16.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let apiServices : ApiServices = ApiServices();
    let tableview : UITableView = UITableView();
    var dataSource : [YearMobileDataUsage]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white;
        self.tableview.frame = self.view.bounds
        self.tableview.delegate = self;
        self.tableview.dataSource = self;
        self.tableview.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
        self.view.addSubview(self.tableview);
        
        apiServices.fetchMobileDataUsage { (resultArray: [QuarterlyMobileDataUsage]) in
            
            let yearData: [YearMobileDataUsage] = YearMobileDataUsage.transQuarterlyDataToYearData(sourceData: resultArray)
            
            self.dataSource = yearData
            self.tableview.reloadData()
        } failure: { (Error) in
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (dataSource != nil) {
            return dataSource.count;
        } else {
            return 0;
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CustomCell = tableview.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        let useage : YearMobileDataUsage = self.dataSource[indexPath.row]
        cell.timeLabel?.text = useage.year
        cell.dataLabel?.text = useage.volumeOfMobileData
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50;
    }
    
}

