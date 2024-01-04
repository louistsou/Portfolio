//
//  menuViewController.swift
//  iOS Group Project
//
//  Created by Gavin josh Logronio on 22/5/2023.
//

import Foundation
import UIKit
import CoreData

class menuViewController: UIViewController {
    
    @IBOutlet weak var reselectButton: UIButton!
    @IBOutlet weak var thisWeekButton: UIButton!
    @IBOutlet weak var pagesStackView: UIStackView!
    @IBOutlet weak var menuStack1: UIStackView!
    @IBOutlet weak var menuStack2: UIStackView!
    @IBOutlet weak var menuStack3: UIStackView!
    @IBOutlet weak var menuStack4: UIStackView!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    var meals: [Meal] = []
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var account: Account!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pagesStackView.layer.borderWidth = 5
        pagesStackView.layer.borderColor = CGColor(red: 52 / 255, green: 128 / 255, blue: 46 / 255, alpha: 1)
        let frame = CGRect(x: 30, y: 160, width: 330, height: 550)
        let myView = UIView(frame: frame)
        myView.layer.borderWidth = 5
        myView.layer.borderColor = CGColor(red: 52 / 255, green: 128 / 255, blue: 46 / 255, alpha: 1)
        myView.layer.cornerRadius = 40
        self.view.addSubview(myView)
        self.view.sendSubviewToBack(myView)
        pagesStackView.layer.borderWidth = 1
        pagesStackView.layer.borderColor = CGColor(red: 52 / 255, green: 128 / 255, blue: 46 / 255, alpha: 1)
        pagesStackView.layer.cornerRadius = 10
        menuStack1.layer.borderWidth = 1
        menuStack1.layer.borderColor = CGColor(red: 52 / 255, green: 128 / 255, blue: 46 / 255, alpha: 1)
        menuStack1.layer.cornerRadius = 5
        menuStack2.layer.borderWidth = 1
        menuStack2.layer.borderColor = CGColor(red: 52 / 255, green: 128 / 255, blue: 46 / 255, alpha: 1)
        menuStack2.layer.cornerRadius = 5
        menuStack3.layer.borderWidth = 1
        menuStack3.layer.borderColor = CGColor(red: 52 / 255, green: 128 / 255, blue: 46 / 255, alpha: 1)
        menuStack3.layer.cornerRadius = 5
        
        buttonSetUp()
        firstButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        thirdButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        fourthButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let fetchRequest: NSFetchRequest<Meal> = Meal.fetchRequest()
        
        do {
            meals = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Failed to fetch meals from Core Data. Error: \(error), \(error.userInfo)")
        }
        
        for meal in meals {
            print("Meal name: \(meal.name ?? "")")
            print("Meal carbs: \(meal.carbs)")
            // Access other attributes of the meal
        }
        firstButton.setTitle("\(meals[0].name!)", for: .normal)
        firstButton.setImage(UIImage(named: "\(meals[0].name!)"), for: .normal)
        secondButton.setTitle("\(meals[1].name!)", for: .normal)
        secondButton.setImage(UIImage(named: "\(meals[1].name!)"), for: .normal)
        thirdButton.setTitle("\(meals[2].name!)", for: .normal)
        thirdButton.setImage(UIImage(named: "\(meals[2].name!)"), for: .normal)
        fourthButton.setTitle("\(meals[3].name!)", for: .normal)
        fourthButton.setImage(UIImage(named: "\(meals[3].name!)"), for: .normal)
    }
    
    func buttonSetUp() {
        let buttonsArray = [firstButton, secondButton, thirdButton, fourthButton].compactMap { $0 }
        borderOfButtons(buttons: buttonsArray)
    }
    
    func borderOfButtons(buttons: [UIButton]) {
        for button in buttons {
            button.layer.borderWidth = 2.0
            button.layer.borderColor = UIColor(red: 52/255, green: 128/255, blue: 46/255, alpha: 1.0).cgColor
            button.layer.cornerRadius = 10
            button.layer.masksToBounds = true
        }
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        if sender.backgroundColor == UIColor.white {
            sender.backgroundColor = UIColor(red: 52/255, green: 128/255, blue: 46/255, alpha: 0.5)
        }
        else {
            sender.backgroundColor = UIColor(red: 52/255, green: 128/255, blue: 46/255, alpha: 0.5)
        }
    }
}
