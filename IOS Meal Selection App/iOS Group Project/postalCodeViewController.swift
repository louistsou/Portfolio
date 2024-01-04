//
//  postalCodeViewController.swift
//  iOS Group Project
//
//  Created by Jin O on 2023/05/09.
//

import Foundation
import UIKit
// Check whether user's address is included in the delivery zone or not
class postalCodeViewController: UIViewController {



    @IBOutlet weak var postalCodeTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        postalCodeTextField.layer.cornerRadius = 10
        postalCodeTextField.layer.masksToBounds = true
        
        submitButton.layer.cornerRadius = 10
        submitButton.layer.masksToBounds = true
    }
// Check if the address is valid or not using regex
    func isValid(text: String) -> Bool {
        let range = NSRange(location: 0, length: postalCodeTextField.text!.count)
        let regex = try! NSRegularExpression(pattern: "^[0-9]{4}$")
        guard !text.isEmpty else {
            return false
        }
        if (regex.firstMatch(in: text, range: range) != nil) {
            return true
        }
        else {
            return false
        }
    }
// Check if the address is included in delivery zone or not using regex
    func isDeliveryAvailable(text: String) -> Bool {
        let range = NSRange(location: 0, length: postalCodeTextField.text!.count)
        let basicRegex = try! NSRegularExpression(pattern: "^2[0-5][0-9][0-9]$")
        guard !text.isEmpty else {
            return false
        }
        if (basicRegex.firstMatch(in: text, range: range) != nil) {
            return true
        }
        else {
            return false
        }
    }
// When the button is tapped, navigate user to the next screen
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        let postalCode = postalCodeTextField.text!
        
        if(isValid(text: postalCode)) {
            if(isDeliveryAvailable(text: postalCode)){
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "signUpViewController") as! signUpViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else {// When user's address is not included in delivery zone
                let alertController = UIAlertController(title: "Error", message: "Apologies, we don't deliver to your area", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alertController, animated: true, completion: nil)
                postalCodeTextField.text = ""
            }
            }else {// When user's input is not valid postal code
                let alertController = UIAlertController(title: "Error", message: "Please fill in a 4 digit post code", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alertController, animated: true, completion: nil)
                postalCodeTextField.text = ""
            }
        }
    }

extension NSRegularExpression {
    convenience init(_ pattern: String) {
        do {
            try self.init(pattern: pattern)
        } catch {
            preconditionFailure("Illegal regular expression: \(pattern).")
        }
    }
}
