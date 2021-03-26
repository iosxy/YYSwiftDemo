//
//  YYNetworkManager.swift
//  FirstSwiftDemo
//
//  Created by lzt on 2021/3/26.
//

import UIKit
import SwiftyJSON
import Alamofire

public struct YDResponse {
    var optionsJson: JSON?
    var options: String?
    var optionsDict: [String:Any]?
    var ext: Any?
    var value: Any? //原始响应结果仅当ERequestType = Recharge 或 网络请求返回status=0有值
}

public typealias YDFailueBlock = (_ error: Error?) -> ()
public typealias YDCompletedBlock = (_ options: YDResponse?) -> ()
public typealias YDParamterTuple = (url: String, parameters: [String : Any]?)

class YYNetworkManager: NSObject {

    static let shared: YYNetworkManager = YYNetworkManager()
    
    public func requet(url: String , para: [String: Any] , finish: YDCompletedBlock , error: YDFailueBlock) {
        
        
        Alamofire.request(url,
                                        method: .get,
                                        parameters: para
        ).responseJSON {[weak self] (response) in
            guard let `self` = self else { return }

            switch response.result {

            case .success:
                
                debugPrint("\(response.result)")
                break

            case .failure:
                debugPrint("\(response.result)")
                break
            }
        }
        
    }
}
