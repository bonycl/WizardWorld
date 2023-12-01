//
//  StaffDetailViewController.swift
//  WizardWorld
//
//  Created by D i on 29.11.2023.
//

import UIKit

class WizardDetailViewController: UIViewController {
    
    var wizardDetails: HogwartsPeople?
    
    @IBOutlet weak var wizardPhoto: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var house: UILabel!
    @IBOutlet weak var dateOfBirth: UILabel!
    @IBOutlet weak var ancestry: UILabel!
    @IBOutlet weak var species: UILabel!
    @IBOutlet weak var patronus: UILabel!
    @IBOutlet weak var actor: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.8857646585, green: 0.8026774526, blue: 0.6788902283, alpha: 1)
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        setupUI()
    }
    
    func setupUI() {
        if let wizardDetail = wizardDetails {
            name.text = "Name: \(wizardDetail.name)"
            gender.text = "Gender: \(wizardDetail.gender ?? "")"
            house.text = "House: \(wizardDetail.house ?? "")"
            dateOfBirth.text = "Date of birth: \(wizardDetail.dateOfBirth ?? "")"
            ancestry.text = "Ancestry: \(wizardDetail.ancestry ?? "")"
            species.text = "Species: \(wizardDetail.species ?? "")"
            patronus.text = "Patronus: \(wizardDetail.patronus ?? "")"
            actor.text = "Actor: \(wizardDetail.actor ?? "")"
            
            //shadow on image
            wizardPhoto.layer.shadowOpacity = 0.4
            wizardPhoto.layer.shadowRadius = 3.0
            wizardPhoto.layer.borderColor = UIColor.black.withAlphaComponent(0.3).cgColor
            wizardPhoto.layer.shadowOffset = CGSize(width: 0, height: 5)
            wizardPhoto.layer.shadowColor = UIColor.black.cgColor
            
            //        загрузка изображения
            if let imageUrlString = wizardDetail.image,
               let imageUrl = URL(string: imageUrlString) {
                
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: imageUrl),
                       let image = UIImage(data: data) {
                        
                        DispatchQueue.main.async {
                            self.wizardPhoto.image = image
                            self.activityIndicator.stopAnimating()
                            self.activityIndicator.isHidden = true
                        }
                    } else {
                        //if there is no URL image set default image
                        DispatchQueue.main.async {
                            self.wizardPhoto.image = UIImage(systemName: "photo",
                                                             variableValue: 0,
                                                             configuration: UIImage.SymbolConfiguration(weight: .ultraLight))?
                                .withTintColor(.secondaryLabel,
                                               renderingMode: .alwaysOriginal)
                            self.activityIndicator.stopAnimating()
                            self.activityIndicator.isHidden = true
                        }
                    }
                }
            } else {
                print("DEBUG: wizard image did not load -> go to default image")
                DispatchQueue.main.async {
                    self.wizardPhoto.image = UIImage(systemName: "photo",
                                                     variableValue: 0,
                                                     configuration: UIImage.SymbolConfiguration(weight: .ultraLight))?
                        .withTintColor(.secondaryLabel,
                                       renderingMode: .alwaysOriginal)
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.isHidden = true
                }
            }
            
        }
        
    }
}
