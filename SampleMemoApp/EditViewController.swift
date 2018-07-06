//
//  EditViewController.swift
//  SampleMemoApp
//
//  Created by 石倉一平 on 2018/06/12.
//  Copyright © 2018年 Swift-Biginners. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var textView: UITextView!
  
  var globalVar = GlobalVar.shared
  
  var selectedList : String = ""
  var selectedContent : String = ""
  var selectedNumber : Int? = nil
  
  override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    if (identifier == "toListViewSegue" || identifier == "toEditViewSegue"){
      if(self.textField.text?.isEmpty)! {
        let alert = UIAlertController(title: "入力エラー", message: "タイトルを入力してくだい", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
        return false
      }
    }
    return true
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if (segue.identifier == "toListViewSegue") {
      if(selectedNumber != nil){
        globalVar.list[selectedNumber!] = (textField.text!)
        globalVar.content[selectedNumber!] = (textView.text!)
      }else{
        globalVar.list.append(textField.text!)
        if(self.textView.text?.isEmpty)!{
          globalVar.content.append("")
        }else{
          globalVar.content.append(textView.text!)
        }
      }
    }
  }
  

    override func viewDidLoad() {
      if(selectedNumber != nil){
        textField.text = selectedList
        textView.text = selectedContent
      }
      super.viewDidLoad()
      textViewSetteings()
      keboardSettings()
      // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  func textViewSetteings() {
    // 枠のカラー
    textView.layer.borderColor = UIColor.gray.cgColor
    // 枠の幅
    textView.layer.borderWidth = 1.0
    // 枠を角丸にする場合
    textView.layer.cornerRadius = 10.0
    textView.layer.masksToBounds = true
  }
  @objc func commitButtonTapped (){
    self.view.endEditing(true)
    self.resignFirstResponder()
  }
  func keboardSettings(){
    // 仮のサイズでツールバー生成
    let kbToolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
    kbToolBar.barStyle = UIBarStyle.default  // スタイルを設定
    kbToolBar.sizeToFit()  // 画面幅に合わせてサイズを変更
    // スペーサー
    let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)
    // 閉じるボタン
    let commitButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(EditViewController.commitButtonTapped))
    kbToolBar.items = [spacer, commitButton]
    textView.inputAccessoryView = kbToolBar
  }

}
