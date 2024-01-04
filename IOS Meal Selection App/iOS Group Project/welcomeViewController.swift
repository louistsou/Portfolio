//
//  welcomeViewController.swift
//  iOS Group Project
//
//  Created by Jin O on 2023/05/09.
//

import Foundation
import UIKit
// second loading screen of the app
class welcomeViewController: UIViewController {
    
    var remainingTime = 2
    var timer = Timer()
    var trigger = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){
            timer in self.countDown()
        }
    }// Proceed to the next slides(postalCodeViewController) after 2 sec
    @objc func countDown() {
        remainingTime -= 1;
        
        if remainingTime == 0 {
            timer.invalidate()
            performSegue(withIdentifier: "goTopostalCode", sender: self)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToPostalCode" {
            _ = segue.destination as! postalCodeViewController
        }
    }
}
