//
//  NetworkUtil.swift
//  SwiftDemo
//
//  Created by apple on 2021/5/16.
//

import UIKit

class NetworkUtil: NSObject {
    

    func get(url: String,
             params: [String:String],
             success: @escaping (Any) -> Void,
             failure: @escaping (Error) -> Void) -> Void {
        
        
        var items = [URLQueryItem]()
        for (key,value) in params {
            items.append(URLQueryItem(name: key, value: value))
        }
        let urlComp = NSURLComponents(string: url)!
        if !items.isEmpty {
            urlComp.queryItems = items
        }
        
        var urlRequest = URLRequest(url: urlComp.url!)
        urlRequest.httpMethod = "GET"
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in

        })
        task.resume()
    }
    
}
