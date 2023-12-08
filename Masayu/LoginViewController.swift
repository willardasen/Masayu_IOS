//
//  LoginViewController.swift
//  Masayu
//
//  Created by prk on 11/23/23.
//

import UIKit
import CoreData



struct user {
    var email: String
    var username: String
    var password: String
}

class LoginViewController: UIViewController {
    
    
    var arrUser = [user]()

    var context: NSManagedObjectContext!

    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var passwordTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        initDummy()
        
        fetchUserData()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        context = appDelegate.persistentContainer.viewContext
    }
    

    func initDummy(){
        arrUser.append(user(email: "dummy@gmail.com", username: "dummy", password: "dummy"))
    }
    
    
    @IBAction func loginBtn(_ sender: Any) {
        
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

        for user in arrUser {
            if(user.email == email && user.password == password){
                if let nextPage = storyboard?.instantiateViewController(withIdentifier: "tabBarView") as? HomeTabBarController{
                    nextPage.emailCurrent = user.email
                    self.navigationController?.pushViewController(nextPage, animated: true)
                    showAlert(title: "Login Successful", message: "Welcome \(user.username)")
                }
            }            
        }
        
        showAlert(title: "Invalid Credential", message: "Email or Password is wrong")
    }
    
    func fetchUserData(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        do{
            var results = try context.fetch(request) as! [NSManagedObject]
            for data in results{
                arrUser.append(user(email: data.value(forKey: "email") as! String,
                                    username: data.value(forKey: "username") as! String,
                                    password: data.value(forKey: "password")as! String)
                )
            }
            print("Fetching successful")
        }catch{
            print("Fetching failed")
        }
    }
    
    
    func showAlert(title: String,message: String) {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
    
    
    
}
