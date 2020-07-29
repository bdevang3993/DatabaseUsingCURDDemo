//
//  DetailsVC.swift
//  DatabaseUsingCURD
//
//  Created by devang bhavsar on 28/07/20.
//  Copyright © 2020 devang bhavsar. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    private let manager = EmployeeManager()
    var selectedEmployee:Employee? = nil
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imagePicker.delegate = self
        self.setUpdate()
    }
    func setUpdate() {
        self.txtName.text = selectedEmployee?.name
        self.txtEmail.text = selectedEmployee?.email
        self.imgView.image = UIImage(data: (selectedEmployee?.profilePic)!)
    }
    
    @IBAction func btnBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnUpdateClicked(_ sender: Any) {
        
        let employee = Employee(profilePic: self.imgView.image?.pngData(), name: txtName.text, id: selectedEmployee!.id, email: txtEmail.text)
        if(manager.updateEmployee(employee: employee)) {
            self.showAlert(message: "your data update sucessfully")
        } else {
             self.showAlert(message: "Error to update try again")
        }
    }
    @IBAction func btnDeleteClicked(_ sender: Any) {
        
        if (manager.deleteEmployee(id: (selectedEmployee?.id!)!)) {
             self.showAlert(message: "your data deleted sucessfully")
        } else {
            self.showAlert(message: "Error to update try again")
        }
    }
    func showAlert(message:String) {
        let alert = UIAlertController(title: "DataBase", message:message , preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func btnImageClicked(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
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
extension DetailsVC:UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // MARK: - UIImagePickerControllerDelegate Methods
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imgView.contentMode = .scaleAspectFit
            imgView.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
