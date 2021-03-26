//
//  YYTestNetWorkViewController.swift
//  FirstSwiftDemo
//
//  Created by lzt on 2021/3/26.
//

import UIKit

class YYTestNetWorkViewController: YYBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


        let url = "http://pic.news.163.com/photocenter/api/list/0031/6LRK0031,6LRI0031/1/1/data.json"
        
        
        YYNetworkManager.shared.requet(url: url, para: [:]) { (respone) in
            
        } error: { (error) in
            
            
            
        }

        
    }
    

}
