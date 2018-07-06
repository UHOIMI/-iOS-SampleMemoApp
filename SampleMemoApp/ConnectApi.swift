//
//  ConnectApi.swift
//  SampleMemoApp
//
//  Created by 石倉一平 on 2018/06/26.
//  Copyright © 2018年 Swift-Biginners. All rights reserved.
//

import UIKit

class ConnectApi: NSObject {
  
  var globalVar = GlobalVar.shared

  
  func selectAll(){
//    let url = URL(string: "http://192.168.100.102:3000/api/v1/selectmemo/all?userid=1")
    let url = URL(string: "http://192.168.100.102:3000/api/v1/selectmemo/all?userid=1")
    let request = URLRequest(url: url!)
    let session = URLSession.shared
    session.dataTask(with: request) { (data, response, error) in
      if error == nil, let data = data, let response = response as? HTTPURLResponse {
        // HTTPヘッダの取得
        print("Content-Type: \(response.allHeaderFields["Content-Type"] ?? "")")
        // HTTPステータスコード
        print("statusCode: \(response.statusCode)")
        print(String(data: data, encoding: String.Encoding.utf8) ?? "")
        let jsonString = String(data: data, encoding: .utf8)!
        let personalData: Data =  jsonString.data(using: String.Encoding.utf8)!
        do {
          let json = try JSONSerialization.jsonObject(with: personalData, options: JSONSerialization.ReadingOptions.allowFragments)
          // JSONパース。optionsは型推論可(".allowFragmets"等)
          let top = json as! NSArray // トップレベルが配列
          //var count = 0
          for roop in top {
            let next = roop as! NSDictionary
            print(next["user_id"]!) // 1, 2 が表示
            print(next["memo"]!)
            
            let title = next["title"]! as Any
            let text = next["memo"]! as Any
    
            self.globalVar.list.append(title)
            self.globalVar.content.append(text)
            
            print(self.globalVar.list[0])
          }
        } catch {
          print(error) // パースに失敗したときにエラーを表示
        }
      }
    }.resume()

  }
}
