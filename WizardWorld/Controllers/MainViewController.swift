//
//  MainCollectionViewController.swift
//  WizardWorld
//
//  Created by D i on 29.11.2023.
//

import UIKit

class MainViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
    }

    @IBAction func goToStaffButton(_ sender: UIButton) {
        performSegue(withIdentifier: "teachers", sender: nil)
        
    }
    
    @IBAction func goToStudentsButton(_ sender: UIButton) {
        
    }
    
    @IBAction func goToSpellsButton(_ sender: UIButton) {
        
    }
}
