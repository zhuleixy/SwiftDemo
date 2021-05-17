//
//  ApiServices.swift
//  SwiftDemo
//
//  Created by zhulei on 2021/5/17.
//

import UIKit

class ApiServices: NSObject {
    
    private let networkUtil : NetworkUtil = NetworkUtil();
   

    func fetchMobileDataUsage() {
        
        let parDic : [String : String] = ["resource_id": "a807b7ab-6cad-4aa6-87d0-e283a7353a0f", "limit": "5"]
        
        networkUtil.get(url: "https://data.gov.sg/api/action/datastore_search",
                        params: parDic) { (Any) in
            
        } failure: { (Error) in
            
        }

    }
    
}
