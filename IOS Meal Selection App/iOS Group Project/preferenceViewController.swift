//
//  preferenceViewController.swift
//  iOS Group Project
//
//  Created by Jin O on 2023/05/12.
//

import Foundation
import UIKit
import CoreData

class preferenceViewController: UIViewController {

    @IBOutlet weak var meatLover: UIButton!
    @IBOutlet weak var lowCarb: UIButton!
    @IBOutlet weak var lowCalories: UIButton!
    @IBOutlet weak var vegan: UIButton!
    @IBOutlet weak var highProtein: UIButton!
    @IBOutlet weak var asian: UIButton!
    @IBOutlet weak var halal: UIButton!
    @IBOutlet weak var upForEverything: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    var selectFlag = false
    var account: Account!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var meals: [Meal] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSetUp()
        
        meatLover.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        lowCarb.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        lowCalories.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        vegan.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        highProtein.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        asian.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        halal.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        upForEverything.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        if account == nil {
            print("PREF ACCOUNT EMPTY")
        }else {
            print("PREF ACCOUNT NOT EMPTY")

        }
        continueButton.layer.cornerRadius = 10
        continueButton.layer.masksToBounds = true
    }
// buttons in preferenceViewController
    func buttonSetUp() {
        let buttonsArray = [meatLover, lowCarb, lowCalories, vegan, highProtein, asian, halal, upForEverything].compactMap { $0 }
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
    
    // When the button is pressed, the color changes
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
        
        
        if sender == meatLover {
            let meal1 = Meal(context: context )
            meal1.name = "Creamy tarragon chicken bake"
            meal1.mealNum = "N3"
            meal1.calories = 320
            meal1.carbs = 18
            meal1.protein = 40
            meal1.glutenF = true
            meal1.vege = false
            
            let meal2 = Meal(context: context)
            meal2.name = "Peanut butter chicken"
            meal2.mealNum = "DF1"
            meal2.calories = 572
            meal2.carbs = 33
            meal2.protein = 13
            meal2.glutenF = true
            meal2.vege = false
            
            let meal3 = Meal(context: context)
            meal3.name = "Honey chicken"
            meal3.mealNum = "DF2"
            meal3.calories = 333
            meal3.carbs = 35
            meal3.protein = 36
            meal3.glutenF = false
            meal3.vege = false
            
            let meal4 = Meal(context: context)
            meal4.name = "Crispy sesame lemon chicken"
            meal4.mealNum = "DF3"
            meal4.calories = 280
            meal4.carbs = 26
            meal4.protein = 26
            meal4.glutenF = false
            meal4.vege = false
            do {
                        try context.save()
                        print("Meal saved to Core Data")
                        print(meal1)
                        print(meal2)
                        print(meal3)
                        print(meal4)
                    } catch let error as NSError {
                        print("Failed to save meal to Core Data. Error: \(error), \(error.userInfo)")
                    }
        }
        else if sender == lowCarb {
            let meal1 = Meal(context: context )
            meal1.name = "Paneer korma"
            meal1.mealNum = "GF2"
            meal1.calories = 509
            meal1.carbs = 21
            meal1.protein = 33
            meal1.glutenF = true
            meal1.vege = true
            
            let meal2 = Meal(context: context)
            meal2.name = "Lazy cheesy vegetable hotpot"
            meal2.mealNum = "N2"
            meal2.calories = 308
            meal2.carbs = 19
            meal2.protein = 15
            meal2.glutenF = true
            meal2.vege = false
            
            let meal3 = Meal(context: context)
            meal3.name = "Chicken Shawarma Quinoa Bowl"
            meal3.mealNum = "F2"
            meal3.calories = 702
            meal3.carbs = 6
            meal3.protein = 56
            meal3.glutenF = false
            meal3.vege = false
            
            let meal4 = Meal(context: context)
            meal4.name = "Peanut butter chicken"
            meal4.mealNum = "DF1"
            meal4.calories = 572
            meal4.carbs = 33
            meal4.protein = 13
            meal4.glutenF = true
            meal4.vege = false
            
            do {
                        try context.save()
                        print("Meal saved to Core Data")
                        print(meal1)
                        print(meal2)
                        print(meal3)
                        print(meal4)
                    } catch let error as NSError {
                        print("Failed to save meal to Core Data. Error: \(error), \(error.userInfo)")
                    }
            
        } else if sender == lowCalories {
            let meal1 = Meal(context: context )
            meal1.name = "Burnt aubergine veggie chilli"
            meal1.mealNum = "V1"
            meal1.calories = 316
            meal1.carbs = 38
            meal1.protein = 15
            meal1.glutenF = true
            meal1.vege = true
            
            let meal2 = Meal(context: context)
            meal2.name = "Lazy cheesy vegetable hotpot"
            meal2.mealNum = "N2"
            meal2.calories = 308
            meal2.carbs = 19
            meal2.protein = 15
            meal2.glutenF = true
            meal2.vege = true
            
            let meal3 = Meal(context: context)
            meal3.name = "Honey chicken"
            meal3.mealNum = "DF2"
            meal3.calories = 333
            meal3.carbs = 35
            meal3.protein = 36
            meal3.glutenF = false
            meal3.vege = false
            
            let meal4 = Meal(context: context)
            meal4.name = "Creamy tarragon chicken bake"
            meal4.mealNum = "N3"
            meal4.calories = 320
            meal4.carbs = 18
            meal4.protein = 40
            meal4.glutenF = true
            meal4.vege = true
            
            do {
                        try context.save()
                        print("Meal saved to Core Data")
                        print(meal1)
                        print(meal2)
                        print(meal3)
                        print(meal4)
                    } catch let error as NSError {
                        print("Failed to save meal to Core Data. Error: \(error), \(error.userInfo)")
                    }
        } else if sender == vegan {
            
            let meal1 = Meal(context: context )
            meal1.name = "Auberine parmigiana lasagne"
            meal1.mealNum = "V2"
            meal1.calories = 466
            meal1.carbs = 41
            meal1.protein = 20
            meal1.glutenF = true
            meal1.vege = true
            
            let meal2 = Meal(context: context)
            meal2.name = "One-pot vegan rice and beans"
            meal2.mealNum = "N1"
            meal2.calories = 507
            meal2.carbs = 85
            meal2.protein = 13
            meal2.glutenF = true
            meal2.vege = true
            
            let meal3 = Meal(context: context)
            meal3.name = "Zeljanica (cheese & spinach pie)"
            meal3.mealNum = "V3"
            meal3.calories = 445
            meal3.carbs = 27
            meal3.protein = 15
            meal3.glutenF = false
            meal3.vege = true
            
            let meal4 = Meal(context: context)
            meal4.name = "Paneer korma"
            meal4.mealNum = "GF2"
            meal4.calories = 509
            meal4.carbs = 33
            meal4.protein = 21
            meal4.glutenF = false
            meal4.vege = true
            
            do {
                        try context.save()
                        print("Meal saved to Core Data")
                        print(meal1)
                        print(meal2)
                        print(meal3)
                        print(meal4)
                    } catch let error as NSError {
                        print("Failed to save meal to Core Data. Error: \(error), \(error.userInfo)")
                    }
        } else if sender == highProtein {
            
            let meal1 = Meal(context: context )
            meal1.name = "Chicken Shawarma Quinoa Bowl"
            meal1.mealNum = "F2"
            meal1.calories = 722
            meal1.carbs = 6
            meal1.protein = 56
            meal1.glutenF = false
            meal1.vege = false
            
            let meal2 = Meal(context: context)
            meal2.name = "One-pot vegan rice and beans"
            meal2.mealNum = "N1"
            meal2.calories = 758
            meal2.carbs = 93
            meal2.protein = 40
            meal2.glutenF = false
            meal2.vege = false
            
            let meal3 = Meal(context: context)
            meal3.name = "Creamy tarragon chicken bake"
            meal3.mealNum = "N3"
            meal3.calories = 320
            meal3.carbs = 18
            meal3.protein = 40
            meal3.glutenF = true
            meal3.vege = false
            
            let meal4 = Meal(context: context)
            meal4.name = "Honey chicken"
            meal4.mealNum = "DF2"
            meal4.calories = 509
            meal4.carbs = 33
            meal4.protein = 36
            meal4.glutenF = false
            meal4.vege = false
            
            do {
                        try context.save()
                        print("Meal saved to Core Data")
                        print(meal1)
                        print(meal2)
                        print(meal3)
                        print(meal4)
                    } catch let error as NSError {
                        print("Failed to save meal to Core Data. Error: \(error), \(error.userInfo)")
                    }
        } else if sender == asian { //gluten free
            
            let meal1 = Meal(context: context )
            meal1.name = "Jerk-seasoned chicken pilaf"
            meal1.mealNum = "GF1"
            meal1.calories = 411
            meal1.carbs = 53
            meal1.protein = 22
            meal1.glutenF = true
            meal1.vege = false
            
            let meal2 = Meal(context: context)
            meal2.name = "Gluten-free salmon pasta"
            meal2.mealNum = "GF3"
            meal2.calories = 587
            meal2.carbs = 86
            meal2.protein = 24
            meal2.glutenF = true
            meal2.vege = false
            
            let meal3 = Meal(context: context)
            meal3.name = "Paneer korma"
            meal3.mealNum = "GF2"
            meal3.calories = 509
            meal3.carbs = 21
            meal3.protein = 33
            meal3.glutenF = true
            meal3.vege = true
            
            let meal4 = Meal(context: context)
            meal4.name = "Peanut butter chicken"
            meal4.mealNum = "DF1"
            meal4.calories = 572
            meal4.carbs = 11
            meal4.protein = 33
            meal4.glutenF = true
            meal4.vege = false
            
            do {
                        try context.save()
                        print("Meal saved to Core Data")
                        print(meal1)
                        print(meal2)
                        print(meal3)
                        print(meal4)
                    } catch let error as NSError {
                        print("Failed to save meal to Core Data. Error: \(error), \(error.userInfo)")
                    }
            
        } else if sender == halal {
            let meal1 = Meal(context: context )
            meal1.name = "Jerk-seasoned chicken pilaf"
            meal1.mealNum = "GF1"
            meal1.calories = 411
            meal1.carbs = 53
            meal1.protein = 22
            meal1.glutenF = true
            meal1.vege = false
            
            let meal2 = Meal(context: context)
            meal2.name = "Gluten-free salmon pasta"
            meal2.mealNum = "GF3"
            meal2.calories = 587
            meal2.carbs = 86
            meal2.protein = 24
            meal2.glutenF = true
            meal2.vege = false
            
            let meal3 = Meal(context: context)
            meal3.name = "Paneer korma"
            meal3.mealNum = "GF2"
            meal3.calories = 509
            meal3.carbs = 21
            meal3.protein = 33
            meal3.glutenF = true
            meal3.vege = true
            
            let meal4 = Meal(context: context)
            meal4.name = "Peanut butter chicken"
            meal4.mealNum = "DF1"
            meal4.calories = 572
            meal4.carbs = 11
            meal4.protein = 33
            meal4.glutenF = true
            meal4.vege = false
            
            do {
                        try context.save()
                        print("Meal saved to Core Data")
                        print(meal1)
                        print(meal2)
                        print(meal3)
                        print(meal4)
                    } catch let error as NSError {
                        print("Failed to save meal to Core Data. Error: \(error), \(error.userInfo)")
                    }
        } else if sender == upForEverything { //////////////up for everythinggg///////////
            
            let meal1 = Meal(context: context ) //////////////////////////////Creamy tarragon chicken bake
            meal1.name = "Creamy tarragon chicken bake"
            meal1.mealNum = "N3"
            meal1.calories = 320
            meal1.carbs = 18
            meal1.protein = 40
            meal1.glutenF = true
            meal1.vege = false
            
            let meal2 = Meal(context: context) /////////////////////////////Lazy cheesy vegetable hotpot
            meal2.name = "Lazy cheesy vegetable hotpot"
            meal2.mealNum = "N2"
            meal2.calories = 308
            meal2.carbs = 19
            meal2.protein = 15
            meal2.glutenF = true
            meal2.vege = false
            
            let meal3 = Meal(context: context) ///////////////////////////Honey chicken
            meal3.name = "Honey chicken"
            meal3.mealNum = "DF2"
            meal3.calories = 333
            meal3.carbs = 35
            meal3.protein = 36
            meal3.glutenF = false
            meal3.vege = false
            
            let meal4 = Meal(context: context) /////////////////////////Crispy sesame lemon chicken
            meal4.name = "Crispy sesame lemon chicken"
            meal4.mealNum = "DF3"
            meal4.calories = 280
            meal4.carbs = 26
            meal4.protein = 26
            meal4.glutenF = false
            meal4.vege = false
            
            let meal5 = Meal(context: context) /////////////////////Paneer korma
            meal5.name = "Paneer korma"
            meal5.mealNum = "GF2"
            meal5.calories = 509
            meal5.carbs = 21
            meal5.protein = 33
            meal5.glutenF = true
            meal5.vege = true
            
            let meal6 = Meal(context: context) ///////////////////Peanut butter chicken
            meal6.name = "Peanut butter chicken"
            meal6.mealNum = "DF1"
            meal6.calories = 572
            meal6.carbs = 11
            meal6.protein = 33
            meal6.glutenF = true
            meal6.vege = false
            
            let meal7 = Meal(context: context) ///////////////////////Gluten-free salmon pasta
            meal7.name = "Gluten-free salmon pasta"
            meal7.mealNum = "GF3"
            meal7.calories = 587
            meal7.carbs = 86
            meal7.protein = 24
            meal7.glutenF = true
            meal7.vege = false
            
            let meal8 = Meal(context: context ) /////////////////////////////Jerk-seasoned chicken pilaf
            meal8.name = "Jerk-seasoned chicken pilaf"
            meal8.mealNum = "GF1"
            meal8.calories = 411
            meal8.carbs = 53
            meal8.protein = 22
            meal8.glutenF = true
            meal8.vege = false
            
            let meal9 = Meal(context: context)//////////////////One-pot vegan rice and beans
            meal9.name = "One-pot vegan rice and beans"
            meal9.mealNum = "N1"
            meal9.calories = 758
            meal9.carbs = 93
            meal9.protein = 40
            meal9.glutenF = false
            meal9.vege = false
            
            let meal10 = Meal(context: context ) ////////////////////Chicken Shawarma Quinoa Bowl
            meal10.name = "Chicken Shawarma Quinoa Bowl"
            meal10.mealNum = "F2"
            meal10.calories = 722
            meal10.carbs = 6
            meal10.protein = 56
            meal10.glutenF = false
            meal10.vege = false
            
            let meal11 = Meal(context: context) ///////////////////////Zeljanica (cheese & spinach pie)
            meal11.name = "Zeljanica (cheese & spinach pie)"
            meal11.mealNum = "V3"
            meal11.calories = 445
            meal11.carbs = 27
            meal11.protein = 15
            meal11.glutenF = false
            meal11.vege = true
            
            do {
                        try context.save()
                        print("Everything saved to Core Data")
                        print(meal1)
                        print(meal2)
                        print(meal3)
                        print(meal4)
                    } catch let error as NSError {
                        print("Failed to save meal to Core Data. Error: \(error), \(error.userInfo)")
                    }
        }
        
    }
    // Navigate user to the next screen
    @IBAction func continueButtonPressed(_ sender: UIButton) {
        if selectFlag {
                   let vc = self.storyboard?.instantiateViewController(withIdentifier: "portionViewController") as! portionViewController
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
        print("Its RUNNING")
        if account == nil {
            print("HANG ON ITS EMPTY ")
        } else{
            print("NOT EMPTY")
        }
        if let porpVc = segue.destination as? portionViewController {
            porpVc.account = account
            print(porpVc.account)
            
        }
    }
    
    
}
