//
//  Extentions.swift
//  WizardWorld
//
//  Created by D i on 29.11.2023.
//

import Foundation

extension PeopleTableViewController {

    
    func fetchData() {
        
        let url = "https://hp-api.onrender.com/api/characters/staff"
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            guard let data = data else { return }
            print("data: \(data)")
            
            guard let error = error else { return }
            print("error: \(error)")
            
            do {
                self.wizards = try JSONDecoder().decode([HogwartsStaff].self, from: data)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()

                }
            } catch let error {
                print("Decoder Error: \(error)")
            }
        }.resume()
    }
}
