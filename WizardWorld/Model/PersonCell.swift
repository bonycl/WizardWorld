//
//  PersonCell.swift
//  WizardWorld
//
//  Created by D i on 29.11.2023.
//

import UIKit

class PersonCell: UITableViewCell {
    
    @IBOutlet var personImage: UIImageView!
    @IBOutlet var personFullName: UILabel!
    @IBOutlet var personHouse: UILabel!
    @IBOutlet var personActor: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
//    func configure(with wizards: HogwartsStaff) {
////        personFullName.text = HogwartsStaff.name
////        numberOfLessons.text = "Number of lessons: \(course.number_of_lessons ?? 0)"
////        numberOfTests.text = "Number of tests: \(course.number_of_tests ?? 0)"
////        
//        DispatchQueue.global().async {
//            guard let imageUrl = URL(string: course.imageUrl!) else { return }
//            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
//            
//            DispatchQueue.main.async {
//                self.courseImage.image = UIImage(data: imageData)
//            }
//        }
//        
//    }
}
