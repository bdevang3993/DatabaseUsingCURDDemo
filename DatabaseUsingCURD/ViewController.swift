//
//  ViewController.swift
//  DatabaseUsingCURD
//
//  Created by devang bhavsar on 27/07/20.
//  Copyright © 2020 devang bhavsar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSubmitClicked(_ sender: Any) {
        let employeeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "EmployeeVC") as! EmployeeVC
        
        self.navigationController?.pushViewController(employeeViewController, animated: true)
    }
    
}

