//
//  LoginViewController.swift
//  Masayu
//
//  Created by prk on 11/23/23.
//

import UIKit
import CoreData



struct userData {
    var email: String
    var password: String
}

class LoginViewController: UIViewController {
    
    //let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var arrUserData = [userData]()

    var context: NSManagedObjectContext!
    
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var passwordTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        context = appDelegate.persistentContainer.viewContext
    }
    

    @IBAction func loginBtn(_ sender: Any) {
        
//        fetchUserData()
        
        guard let email = emailTxt.text, !email.isEmpty else {
            showAlert(title: "Email is empty", message: "Email must not be empty")
            return
        }
        guard let password = passwordTxt.text, !password.isEmpty else {
            showAlert(title: "Password is empty", message: "Password must not be empty")
            return
        }
        
        if !(email.hasSuffix(".com") && email.contains("@")){
            showAlert(title: "Email is not valid", message: "Email must contain @ and ends with .com")
        }

    }
    
//    func fetchUserData(){
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
//        do{
//            var results = try context.fetch(request) as! [NSManagedObject]
//            for data in results{
//                arrUserData.append(userData(email: data.value(forKey: "email") as! String, password: data.value(forKey: "password") as! String))
//            }
//            print("Fetching successful")
//        }catch{
//            print("Fetching failed")
//        }
//    }
    
    
    func showAlert(title: String,message: String) {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
    
    
    
}
