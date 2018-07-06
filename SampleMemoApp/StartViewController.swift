//
//  StartViewController.swift
//  SampleMemoApp
//
//  Created by 石倉一平 on 2018/07/06.
//  Copyright © 2018年 Swift-Biginners. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        ConnectApi().selectAll()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  @IBAction func tappedStartButton(_ sender: Any) {
    performSegue(withIdentifier: "toListViewController", sender: nil)
  }
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
