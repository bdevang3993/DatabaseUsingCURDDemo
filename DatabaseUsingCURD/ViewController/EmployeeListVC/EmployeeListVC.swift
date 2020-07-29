//
//  EmployeeListVC.swift
//  DatabaseUsingCURD
//
//  Created by devang bhavsar on 28/07/20.
//  Copyright © 2020 devang bhavsar. All rights reserved.
//

import UIKit

class EmployeeListVC: UIViewController {

    @IBOutlet weak var tblDisplayData: UITableView!
    
    let manager = EmployeeManager()
    var employees : [Employee]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tblDisplayData.delegate = self
        tblDisplayData.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        employees = manager.fetchEmployee()
        if(employees != nil && employees?.count != nil)
        {
            self.tblDisplayData.reloadData()
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func btnBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension EmployeeListVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.employees!.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblDisplayData.dequeueReusableCell(withIdentifier: "ListTableViewCell") as! ListTableViewCell
        let employee = self.employees![indexPath.row]
        cell.lblName.text = employee.name
        cell.imgEmployee.image = UIImage(data: employee.profilePic!)
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let objDetailsView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DetailsVC") as! DetailsVC
        objDetailsView.selectedEmployee = self.employees![indexPath.row]
        self.navigationController?.pushViewController(objDetailsView, animated: true)
    }
    
    
}
