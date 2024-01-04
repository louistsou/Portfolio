//
//  detailsViewController.swift
//  iOS Group Project
//
//  Created by K on 10/6/2023.
//

import Foundation
import UIKit
import UserNotifications
import CoreData

class addressViewController: UIViewController {
    
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var addressLine1Text: UITextField!
    @IBOutlet weak var addressLine2Text: UITextField!
    @IBOutlet weak var cityText: UITextField!
    @IBOutlet weak var postalCodeText: UITextField!
    @IBOutlet weak var phoneNumberText: UITextField!
    @IBOutlet weak var deliveryInstructionsText: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    
    var userEmail: String = ""
    var checkEmpty: Bool = false
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var account: Account!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if account == nil {
            print("ADDr ACCOUNT EMPTY")
        }else {
            print("ADDr ACCOUNT NOT EMPTY")

        }
        continueButton.layer.cornerRadius = 10
        continueButton.layer.masksToBounds = true
//        print(account)
        greenBorder(to : [firstNameText, lastNameText, addressLine1Text, addressLine2Text, cityText, postalCodeText, phoneNumberText, deliveryInstructionsText])
    }
    // Check whether user did input all the textfield
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        if self.firstNameText.text == "" {
            checkEmpty = true
        }
        else {
            account.fName = firstNameText.text
        }
        
        if self.lastNameText.text == "" {
            checkEmpty = true
        }
        else {
            account.lname = lastNameText.text
        }
        
        if self.addressLine1Text.text == "" {
            checkEmpty = true
        } else {
            account.address = addressLine1Text.text
        }
        
        if self.addressLine2Text.text == "" {
            checkEmpty = true
        } else {
            account.address2 = addressLine2Text.text
        }
        
        if self.cityText.text == "" {
            checkEmpty = true
        } else {
            account.city = cityText.text
        }
        
        if let postalCode = postalCodeText.text, let postCode = Int64(postalCode) {
            account.postal = postCode
        } else {
            checkEmpty = true
            
        }
        
        if self.phoneNumberText.text == "" {
            checkEmpty = true
        } else {
         
            account.phone = phoneNumberText.text
        }
        
        if (checkEmpty == false) {

            try! context.save()
            print("SAVED")
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "menuViewController") as! menuViewController
            vc.account = account
            self.navigationController?.pushViewController(vc, animated: true)
            
        } else if(checkEmpty == true) {
            let alertController = UIAlertController(title: "Error", message: "Please fill in all the required text fields", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
    }
    // textfield style
    private func greenBorder(to textFields: [UITextField]) {
        let greenBorderColor = UIColor(red: 52/255, green: 128/255, blue: 46/255, alpha: 1.0).cgColor
        let borderWidth: CGFloat = 2.0
        let cornerRadius: CGFloat = 10
        
        for textField in textFields {
            textField.layer.borderColor = greenBorderColor
            textField.layer.borderWidth = borderWidth
            textField.layer.cornerRadius = cornerRadius
        }
    }
}
