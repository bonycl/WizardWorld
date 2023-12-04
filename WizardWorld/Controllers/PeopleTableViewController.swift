//
//  StaffTableViewController.swift
//  WizardWorld
//
//  Created by D i on 29.11.2023.
//

import UIKit

class PeopleTableViewController: UITableViewController {
    
    
    var url: String!
    var wizards: [HogwartsPeople] = []
    var filteredWizards = [HogwartsPeople]()
    
    var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    //при поиске сам VC будет отображать сортировку не другой VC
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light
        setupSearchController()
        fetchPersonData()
        tableView.reloadData()
        
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if isFiltering {
            return filteredWizards.count
        }
            return wizards.count
        }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wizardCell", for: indexPath) as! CustomPersonViewCell
        
        var wizard: HogwartsPeople
        
        if isFiltering {
            wizard = filteredWizards[indexPath.row]
        } else {
            wizard = wizards[indexPath.row]
        }
        // print("DEBUG 38 \(wizard)")
        //настройка ячейки
        cell.activityIndicator.isHidden = false
        cell.activityIndicator.startAnimating()
        
        cell.personFullName.text = "Full name: \(wizard.name )"
        cell.personHouse.text = "House: \(wizard.house ?? "not known")"
        cell.personActor.text = "Actor: \(wizard.actor ?? "not known")"
        
        //        загрузка изображения
        if let imageUrlString = wizard.image,
           let imageUrl = URL(string: imageUrlString) {
            
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: imageUrl),
                   let image = UIImage(data: data) {
                    
                    DispatchQueue.main.async {
                        cell.personImage.image = image
                        cell.activityIndicator.stopAnimating()
                        cell.activityIndicator.isHidden = true
                    }
                } else {
                    //if there is no URL image set default image
                    DispatchQueue.main.async {
                        cell.personImage.image = UIImage(systemName: "photo",
                                                         variableValue: 0,
                                                         configuration: UIImage.SymbolConfiguration(weight: .ultraLight))?
                            .withTintColor(.secondaryLabel,
                                           renderingMode: .alwaysOriginal)
                        cell.activityIndicator.stopAnimating()
                        cell.activityIndicator.isHidden = true
                    }
                }
            }
        } else {
            DispatchQueue.main.async {
                cell.personImage.image = UIImage(systemName: "photo",
                                                 variableValue: 0,
                                                 configuration: UIImage.SymbolConfiguration(weight: .ultraLight))?
                    .withTintColor(.secondaryLabel,
                                   renderingMode: .alwaysOriginal)
                cell.activityIndicator.stopAnimating()
                cell.activityIndicator.isHidden = true
            }
        }
        
        return cell
    }
    
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDetails" {
            
            if let indexPath = tableView.indexPathForSelectedRow {
                
                let selectedWizard: HogwartsPeople
                
                if isFiltering {
                     selectedWizard = filteredWizards[indexPath.row]
                } else {
                     selectedWizard = wizards[indexPath.row]
                }
                
                let detailVC = segue.destination as! WizardDetailViewController
                detailVC.wizardDetails = selectedWizard
            }
        }
    }
    
    
}
