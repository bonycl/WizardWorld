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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        setupUI(button: hogwartsStaff)
        setupUI(button: hogwartsStudents)
        setupUI(button: wizardSpells)
    }

    @IBAction func goToStaffButton(_ sender: UIButton) {
        performSegue(withIdentifier: "teachers", sender: nil)
        
    }
    
    @IBAction func goToStudentsButton(_ sender: UIButton) {
        
    }
    
    @IBAction func goToSpellsButton(_ sender: UIButton) {
        
    }
    
    //to apply Shadow
    func setupUI(button: UIButton) {
        button.layer.shadowOpacity = 0.4
        button.layer.shadowRadius = 3.0
        button.layer.borderColor = UIColor.black.withAlphaComponent(0.25).cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
        button.layer.shadowColor = UIColor.black.cgColor //Any dark color
    }
}
