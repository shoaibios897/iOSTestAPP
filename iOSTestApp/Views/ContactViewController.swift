//
//  ContactViewController.swift
//  iOSTestApp
//
//  Created by Apple on 22/06/2022.
//

import UIKit

class ContactViewController: UIViewController {
    
    @IBOutlet weak var contactTableView: UITableView!
    
    var users: [UserStruct]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Contact"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)
        navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 1, green: 0.5490196078, blue: 0, alpha: 1)
        navigationItem.leftBarButtonItem?.tintColor = #colorLiteral(red: 1, green: 0.5490196078, blue: 0, alpha: 1)
        registerNib()
        if let usersArr = JsonFileHelper.shared.fetchDataFromJson() {
            self.users = usersArr
        }
    }
    
    func registerNib(){
        let DashboardNib = UINib(nibName:"ContactsTableViewCell" , bundle: nil)
        contactTableView.register(DashboardNib, forCellReuseIdentifier: "ContactsTableViewCell")
        contactTableView.delegate = self
        contactTableView.dataSource = self
    }
}
extension ContactViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsTableViewCell") as! ContactsTableViewCell
        let data = users![indexPath.row]
        cell.nameLbl.text = "\(data.firstName ?? "") \(data.lastName ?? "")"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ContactInfoViewController") as? ContactInfoViewController
        let data = users![indexPath.row]
        vc?.firstName = data.firstName
        vc?.lastName = data.lastName
        vc?.email = data.email
        vc?.phone = data.phone
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
}
