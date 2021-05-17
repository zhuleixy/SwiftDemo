//
//  ViewController.swift
//  SwiftDemo
//
//  Created by apple on 2021/5/16.
//

import UIKit

class ViewController: UIViewController {

    let apiServices : ApiServices = ApiServices();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiServices.fetchMobileDataUsage();
        // Do any additional setup after loading the view.
    }


}

