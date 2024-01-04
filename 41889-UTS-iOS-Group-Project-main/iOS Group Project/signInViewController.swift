//
//  signInViewController.swift
//  iOS Group Project
//
//  Created by Jin O on 2023/05/09.
//

import Foundation
import UIKit
import CoreData

class signInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var rememberMeSwitch: UISwitch!
    @IBOutlet weak var continueButton: UIButton!
    
    var context: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rememberMeSwitch.addTarget(self, action: #selector(rememberMeSwitchChanged(_:)), for: .valueChanged)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        
        loadSavedCredentials()
        
        continueButton.layer.cornerRadius = 10
        continueButton.layer.masksToBounds = true
    }
        
    // Navigate user to the next screen
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        guard let email = emailTextField.text,
              let password = passwordTextField.text else {
            return
        }
        
        if email.isEmpty || password.isEmpty {
            displayErrorAlert(message: "Please enter your email or password")
            return
        }
        
        let request: NSFetchRequest<Account> = Account.fetchRequest()
        request.predicate = NSPredicate(format: "email = %@", email)
        
        do {
            let results = try context.fetch(request)
            if let account = results.first {
                if account.password == password {
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "adViewController") as! adViewController
                    vc.account = account
                    self.navigationController?.pushViewController(vc, animated: true)
                    
                } else {
                    displayErrorAlert(message: "Incorrect password")
                }
            } else {
                displayErrorAlert(message: "Account not found")
            }
        } catch {
            displayErrorAlert(message: "Failed to fetch account")
        }
    }
    
    // Toggle is connected to this code snippet when the toggle is on, the id is stored so user doesn't have to input again
    @IBAction func rememberMeSwitchChanged(_ switchState: UISwitch) {
        if switchState.isOn {
            guard let email = emailTextField.text,
                  let password = passwordTextField.text else {
                return
            }
            
            let request: NSFetchRequest<Account> = Account.fetchRequest()
            request.predicate = NSPredicate(format: "email = %@", email)
            
            do {
                let results = try context.fetch(request)
                if let account = results.first {
                    account.password = password
                } else {
                    let newAccount = Account(context: context)
                    newAccount.email = email
                    newAccount.password = password
                }
                
                try context.save()
            } catch {
                print("Failed to save credentials: \(error)")
            }
        } else {
            clearCredentials()
        }
    }
    
    private func loadSavedCredentials() {
        let request: NSFetchRequest<Account> = Account.fetchRequest()
        
        do {
            let results = try context.fetch(request)
            if let account = results.first {
                if rememberMeSwitch.isOn {
                    emailTextField.text = account.email
                    passwordTextField.text = account.password
                } else {
                    clearCredentials()
                }
            } else {
                clearCredentials()
            }
        } catch {
            print("Failed to fetch saved credentials: \(error)")
        }
    }
    
    private func clearCredentials() {
        emailTextField.text = nil
        passwordTextField.text = nil
    }

    private func displayErrorAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
