//
//  MainCollectionViewController.swift
//  WizardWorld
//
//  Created by D i on 29.11.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var hogwartsStaff: UIButton!
    @IBOutlet weak var hogwartsStudents: UIButton!
    @IBOutlet weak var wizardSpells: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBackground()
       
        setupUI(button: hogwartsStaff)
        setupUI(button: hogwartsStudents)
        setupUI(button: wizardSpells)
    }
 

    @IBAction func goToStaffButton(_ sender: UIButton) {
        performSegue(withIdentifier: "teachers", sender: nil)
    }
    
    @IBAction func goToStudentsButton(_ sender: UIButton) {
        performSegue(withIdentifier: "students", sender: nil)
    }
    
    @IBAction func goToSpellsButton(_ sender: UIButton) {
        performSegue(withIdentifier: "spells", sender: nil)
    }
    
    //to apply Shadow
    private func setupUI(button: UIButton) {
        button.layer.shadowOpacity = 0.4
        button.layer.shadowRadius = 3.0
        button.layer.borderColor = UIColor.black.withAlphaComponent(0.25).cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
        button.layer.shadowColor = UIColor.black.cgColor //Any dark color
    }

     func setupBackground() {
        
        //create a gradient layer
        let gradientLayer = CAGradientLayer()
         gradientLayer.frame = self.view.bounds
        
        //setup colors
//        let firstColor = #colorLiteral(red: 0, green: 0.1463097036, blue: 0.4757047296, alpha: 1)
//        let secondColor = #colorLiteral(red: 0.6854977012, green: 0.5942707062, blue: 0, alpha: 1)
         gradientLayer.colors = [UIColor.blue, UIColor.red]
        
        //setup direction
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier != "spells" {
            let peopleVC = segue.destination as! PeopleTableViewController
            
            if segue.identifier == "teachers" {
                peopleVC.url = "https://hp-api.onrender.com/api/characters/staff"
           }
            if segue.identifier == "students" {
                peopleVC.url = "https://hp-api.onrender.com/api/characters/students"
            }
        }
    }
    
    
}

