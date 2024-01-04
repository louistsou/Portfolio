//
//  adViewController.swift
//  iOS Group Project
//
//  Created by Jin O on 2023/05/09.
//

import Foundation
import UIKit
import CoreData
// In-App Advertisement
class adViewController: UIViewController {

    @IBOutlet weak var appetiteButton: UIButton!
    
    var account: Account!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
//
//    
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        appetiteButton.layer.cornerRadius = 10
        appetiteButton.layer.masksToBounds = true
        appetiteButton.layer.borderWidth = 2.0
        appetiteButton.layer.borderColor = UIColor(red: 52/255, green: 128/255, blue: 46/255, alpha: 1.0).cgColor
        print(account!)
        if account == nil {
            print("ACCOUNT EMPTY")
        }else {
            print("ACCOUNT NOT EMPTY")

        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            if let prefVc = segue.destination as? preferenceViewController {
                prefVc.account = account
                print(prefVc.account)
                
            }
        
    }
    
    
}
