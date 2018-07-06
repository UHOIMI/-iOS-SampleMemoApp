//
//  DetailViewController.swift
//  SampleMemoApp
//
//  Created by 石倉一平 on 2018/06/12.
//  Copyright © 2018年 Swift-Biginners. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var listLabel: UILabel!
  @IBOutlet weak var contentLabel: UILabel!
  
  var globalVar = GlobalVar.shared
  
  var selectedList : String = ""
  var selectedContent : String = ""
  var selectedNumber : Int? = nil
  
  override func viewDidLoad() {
        super.viewDidLoad()
    listLabel.text = selectedList
    contentLabel.text = selectedContent

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
    if(segue.identifier == "toEditViewSegue"){
      let editViewController: EditViewController = (segue.destination as? EditViewController)!
      editViewController.selectedList = selectedList
      editViewController.selectedContent = selectedContent
      editViewController.selectedNumber = selectedNumber!
    }
  }
    
  @IBAction func tappedDeleteButton(_ sender: Any) {
    globalVar.list.remove(at: (selectedNumber)!)
    globalVar.content.remove(at: (selectedNumber)!)
    performSegue(withIdentifier: "deleteListViewSegue", sender: nil)
  }
  
  
}
