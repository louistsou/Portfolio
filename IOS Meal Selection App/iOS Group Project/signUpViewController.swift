//
//  signUpViewController.swift
//  iOS Group Project
//
//  Created by Jin O on 2023/05/09.
//

import Foundation
import UIKit
import CoreData

class signUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//    var account: Account = Account()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        continueButton.layer.cornerRadius = 10
        continueButton.layer.masksToBounds = true
            // Do any additional setup after loading the view.
    }
    // Check if the email is valid or not
    func isValidEmail(strToValidate: String) -> Bool {
        let emailValidationRegex = "^[\\p{L}0-9!#$%&'*+\\/=?^_`{|}~-][\\p{L}0-9.!#$%&'*+\\/=?^_`{|}~-]{0,63}@[\\p{L}0-9-]+(?:\\.[\\p{L}0-9-]{2,7})*$"
        let emailValidationPredicate = NSPredicate(format: "SELF MATCHES %@", emailValidationRegex)
        return emailValidationPredicate.evaluate(with: strToValidate)
    }
    // Check if the password is valid or not
    func isValidPassword(strToValidate: String) -> Bool {
        let passwordValidationRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*])[a-zA-Z\\d!@#$%^&*]{8,}$"
        let passwordValidationPredicate = NSPredicate(format: "SELF MATCHES %@", passwordValidationRegex)
        return passwordValidationPredicate.evaluate(with: strToValidate)
    }
    // Navigate user to the next screen
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        guard let email = emailTextField.text,
              let password = passwordTextField.text else {
            return
        }
        // Error messages related to validation rules
        if email.isEmpty || password.isEmpty {
            let alertController = UIAlertController(title: "Error", message: "Please fill in all fields!", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
            return
        }
        // Error message related to email validation rule
        if !isValidEmail(strToValidate: emailTextField.text!) {
            let alertController = UIAlertController(title: "Error", message: "Please fill in a correct email!", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
            return
        }
        // Error message related to password validation rule
        if !isValidPassword(strToValidate: passwordTextField.text!) {
            let alertController = UIAlertController(title: "Error", message: "Please fill in at least 8 characters, one upper case, one lower case, one digit and one special character", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
            return
        }
        // Navigations related to signUpViewController
        let account = Account(context: context)
        account.email = emailTextField.text
        account.password = passwordTextField.text
        
        do {
            try context.save()
            performSegue(withIdentifier: "goToAd", sender: account)
            
            let alertController = UIAlertController(title: "Success", message: "Account created!", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            }))
            present(alertController, animated: true, completion: nil)
        } catch {
            print("Failed to save account: \(error)")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let adVC = segue.destination as? adViewController {
            if let account = sender as? Account {
                adVC.account = account
                //                print(account.email)
                //                print(account.password)
                //                print(account.fName)
                //                adVC.context = context
            }
        }
    }
}
