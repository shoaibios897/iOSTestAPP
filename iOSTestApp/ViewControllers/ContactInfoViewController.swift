//
//  ContactInfoViewController.swift
//  iOSTestApp
//
//  Created by Apple on 22/06/2022.
//

import UIKit

class ContactInfoViewController: UIViewController {
    
    @IBOutlet weak var firstNameTxt: UITextField!
    @IBOutlet weak var lastNameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var phoneTxt: UITextField!
    
    
    var firstName:String?
    var lastName:String?
    var email:String?
    var phone:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = ""
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(CancelTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(SaveTapped))
        navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 1, green: 0.5490196078, blue: 0, alpha: 1)
        navigationItem.leftBarButtonItem?.tintColor = #colorLiteral(red: 1, green: 0.5490196078, blue: 0, alpha: 1)
        setData()
    }
    
    func setData(){
        firstNameTxt.text = firstName
        lastNameTxt.text = lastName
        emailTxt.text = email
        phoneTxt.text = phone
    }
    
    @objc func CancelTapped() {
        self.navigationController?.popViewController(animated: true)
        
    }
    @objc func SaveTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
