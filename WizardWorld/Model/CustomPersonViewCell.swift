//
//  PersonCell.swift
//  WizardWorld
//
//  Created by D i on 29.11.2023.
//

import UIKit

class CustomPersonViewCell: UITableViewCell {
    
    @IBOutlet var personImage: UIImageView!
    @IBOutlet var personFullName: UILabel!
    @IBOutlet var personHouse: UILabel!
    @IBOutlet var personActor: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    override func awakeFromNib() {
        super.awakeFromNib()
        configureImage()
    }
    func configureImage() {
  
        personImage.layer.masksToBounds = true
        personImage.contentMode = .scaleAspectFit
        personImage.backgroundColor = UIColor.white
        
        //shadow on image
        personImage.layer.shadowOpacity = 0.4
        personImage.layer.shadowRadius = 3.0
        personImage.layer.borderColor = UIColor.black.withAlphaComponent(0.25).cgColor
        personImage.layer.shadowOffset = CGSize(width: 0, height: 5)
        personImage.layer.shadowColor = UIColor.black.cgColor
        
    }
}
