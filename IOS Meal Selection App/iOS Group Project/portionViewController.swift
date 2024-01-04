//
//  portionViewController.swift
//  iOS Group Project
//
//  Created by Jin O on 2023/05/12.
//

import Foundation
import UIKit
import CoreData

class portionViewController: UIViewController {
    
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    var selectFlag = false
    var account: Account!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSetUp()
        oneButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        twoButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        if account == nil {
            print("PORP ACCOUNT EMPTY")
        } else {
            print("PORP ACCOUNT NOT EMPTY")

        }
        continueButton.layer.cornerRadius = 10
        continueButton.layer.masksToBounds = true
    }
    // button set up
    func buttonSetUp() {
        let buttonsArray = [oneButton, twoButton].compactMap { $0 }
        borderOfButtons(buttons: buttonsArray)
    }
    // button style
    func borderOfButtons(buttons: [UIButton]) {
        for button in buttons {
            button.layer.borderWidth = 2.0
            button.layer.borderColor = UIColor(red: 52/255, green: 128/255, blue: 46/255, alpha: 1.0).cgColor
            button.layer.cornerRadius = 10
            button.layer.masksToBounds = true
        }
    }
    // when the button is pressed, color changes
    @objc func buttonPressed(_ sender: UIButton) {
        if !selectFlag {
            sender.backgroundColor = UIColor(red: 52/255, green: 128/255, blue: 46/255, alpha: 1.0)
            sender.setTitleColor(UIColor.white, for: .normal)
            selectFlag = true
        }
        else if sender.backgroundColor == UIColor(red: 52/255, green: 128/255, blue: 46/255, alpha: 1.0) {
            sender.backgroundColor = UIColor.white
            sender.setTitleColor(UIColor(red: 52/255, green: 128/255, blue: 46/255, alpha: 1.0), for: .normal)
            selectFlag = false
        }
    }
    // Navigate user to the next screen
    @IBAction func continueButtonPressed(_ sender: UIButton) {
        if selectFlag {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "recipeViewController") as! recipeViewController
            vc.account = account
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else {
            let alertController = UIAlertController(title: "Error", message: "Please select one preference", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
            if let recVc = segue.destination as? recipeViewController{
                recVc.account = account
//                recVc.context = context
            }
    }
}
