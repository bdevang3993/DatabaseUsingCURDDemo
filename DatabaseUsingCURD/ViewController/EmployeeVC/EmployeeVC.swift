//
//  EmployeeVC.swift
//  DatabaseUsingCURD
//
//  Created by devang bhavsar on 28/07/20.
//  Copyright © 2020 devang bhavsar. All rights reserved.
//

import UIKit

class EmployeeVC: UIViewController {
@IBOutlet weak var imgEmployee: UIImageView!
@IBOutlet weak var txtName: UITextField!
@IBOutlet weak var txtEmailId: UITextField!
@IBOutlet weak var btnCreate: UIButton!
let imagePicker = UIImagePickerController()
    private let manager: EmployeeManager = EmployeeManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imagePicker.delegate = self
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        debugPrint(path[0])
    }
    
    @IBAction func btnImagePickerClicked(_ sender: Any) {
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func btnCreateClicked(_ sender: Any) {
        let employee = Employee(profilePic: imgEmployee.image?.pngData(), name: txtName.text, id: UUID(), email: txtEmailId.text)
        manager.createEmployee(employee: employee)
        
        let objEmpDetails = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "EmployeeListVC") as! EmployeeListVC
        self.navigationController?.pushViewController(objEmpDetails, animated: true)
    }
    
    @IBAction func btnShowDataClicked(_ sender: Any) {
        let objEmpDetails = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "EmployeeListVC") as! EmployeeListVC
               self.navigationController?.pushViewController(objEmpDetails, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension EmployeeVC:UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // MARK: - UIImagePickerControllerDelegate Methods
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imgEmployee.contentMode = .scaleAspectFit
            imgEmployee.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
