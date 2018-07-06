//
//  ViewController.swift
//  SampleMemoApp
//
//  Created by 石倉一平 on 2018/06/12.
//  Copyright © 2018年 Swift-Biginners. All rights reserved.
//

import UIKit


class ListViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var memoTableView: UITableView!
  
  var connectApi:ConnectApi!
  
  var selectedList : String = ""
  var selectedContent : String = ""
  var selectedNumber : Int? = nil
  var globalVar = GlobalVar.shared


  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    print("list:",globalVar.list.count)
    return(globalVar.list.count)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
    cell.textLabel?.text = globalVar.list[indexPath.row] as? String
    
    return(cell)
  }
  
  // Cell が選択された場合
  func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
    selectedList = globalVar.list[indexPath.row] as! String
    selectedContent = globalVar.content[indexPath.row] as! String
    //selectedNumber = globalVar.list.index(of: selectedList)
    performSegue(withIdentifier: "toDetailViewSegue",sender: nil)
  }
  // Segue 準備
  override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
    if (segue.identifier == "toDetailViewSegue") {
      let detailViewController: DetailViewController = (segue.destination as? DetailViewController)!
      detailViewController.selectedList = selectedList
      detailViewController.selectedContent = selectedContent
      detailViewController.selectedNumber = selectedNumber!
    }
  }

  
  
  @IBAction func tappedAddButton(_ sender: Any) {
    performSegue(withIdentifier: "showMemo", sender: nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}
