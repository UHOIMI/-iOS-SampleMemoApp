//
//  ConnectJson.swift
//  SampleMemoApp
//
//  Created by 石倉一平 on 2018/06/26.
//  Copyright © 2018年 Swift-Biginners. All rights reserved.
//

import UIKit

class ConnectJson: NSObject {
  
  struct JsonAll : Codable{
    var userId : Int
    var memoId : Int
    var title : String
    var memo : String
  }
  
}
