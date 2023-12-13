//
//  LoginViewController.swift
//  Masayu
//
//  Created by prk on 11/23/23.
//

import UIKit
import CoreData
import Firebase

struct user {
    var email: String
    var username: String
    var password: String
}

class LoginViewController: UIViewController {
    
    var arrUser = [user]()
    
    var context: NSManagedObjectContext!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        context = appDelegate.persistentContainer.viewContext
        
        initDummy()
        fetchUserData()

    }
    
    func initDummy(){
        arrUser.append(user(email: "dummy@gmail.com", username: "dummy", password: "dummy"))
    }

    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var passwordTxt: UITextField!
    
    @IBAction func loginBtn(_ sender: Any) {
        
        guard let email = emailTxt.text, !email.isEmpty else {
            showAlert(title:"Email is empty",message: "Email must not be empty.")
            return
        }
        
        guard let password = passwordTxt.text, !password.isEmpty else {
            showAlert(title:"Password is empty",message: "Password must not be empty.")
            return
        }
        
        if !(email.hasSuffix(".com") && email.contains("@")) {
            showAlert(title: "Email is not valid", message: "Email must contain @ and ends with .com")
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            
            if let err = error {
                strongSelf.showAlert(title: "Invalid Credential", message: "Email or Password is wrong")
                print("Email or Password is wrong \(err.localizedDescription)")
            }
            
            for user in strongSelf.arrUser {
                if (user.email == email && user.password == password) {
                    if let nextPage = strongSelf.storyboard?.instantiateViewController(withIdentifier: "tabBarView") as? HomeTabBarController{
                        nextPage.emailCurrent = user.email
                        strongSelf.navigationController?.pushViewController(nextPage, animated: true)
                        strongSelf.showAlert(title: "Login Successful", message: "Welcome, \(user.username)")
                    }
                }
            }
        }

    }
    
    func fetchUserData(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        do{
            let results = try context.fetch(request) as! [NSManagedObject]
            for data in results{
                arrUser.append(user(
                    email: data.value(forKey: "email") as! String,
                    username: data.value(forKey: "username") as! String,
                    password: data.value(forKey: "password") as! String)
                )
            }
            print("fetching successful")
        }catch{
            print("fetching failed")
        }
    }
        
        
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }}
