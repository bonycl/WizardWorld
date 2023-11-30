//
//  StaffTableViewController.swift
//  WizardWorld
//
//  Created by D i on 29.11.2023.
//

import UIKit

class PeopleTableViewController: UITableViewController {
    
     private let url = "https://hp-api.onrender.com/api/characters/staff"
    
     var wizards: [HogwartsStaff] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        
    
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return wizards.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wizardCell", for: indexPath) as! CustomPersonCell
        
        let wizard = wizards[indexPath.row]
        print("DEBUG 38 \(wizard)")
        //настройка ячейки
        cell.activityIndicator.isHidden = false
        cell.activityIndicator.startAnimating()
        
        cell.personFullName.text = "Full name: \(wizard.name ?? "not known")"
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
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func fetchData() {
        
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            guard let data = data else { return }
            print("DEBUG 85 data: \(data)")
            
            if let error = error {
                print("DEBUG 88 error: \(error)")
            }
            
            do {
                self.wizards = try JSONDecoder().decode([HogwartsStaff].self, from: data)
                
                print("DEBUG: total wizards - \(self.wizards.count)")
                print("DEBUG: wizard name - \(self.wizards.first?.name ?? "1")")
                print("DEBUG: wizard actors name - \(self.wizards.first?.actor ?? "11")")
//                for wizard in wizards {
//                    print("DEBUG: wizard - \(wizard)")
//                }
                //print("DEBUG: wizards - \(wizards)")
                
//                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print("Decoder Error: \(error)")
            }
        }.resume()
    }
}
