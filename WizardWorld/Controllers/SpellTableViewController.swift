//
//  SpellTableViewController.swift
//  WizardWorld
//
//  Created by D i on 29.11.2023.
//

import UIKit

class SpellTableViewController: UITableViewController {
    
    private let url = "https://hp-api.onrender.com/api/spells"
   
    var spells: [Spells] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

      fetchSpellData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return spells.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "spellCell", for: indexPath) as! CustomSpellViewCell
        
        let spell = spells[indexPath.row]
      //  print("DEBUG 38 \(spell)")
        
        //настройка ячейки
        cell.spellLabel.text = "Spell: \(spell.name)"
        cell.descriptionLabel.text = "Description: \(spell.description)"
    
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
    func fetchSpellData() {
        
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            guard let data = data else { return }
            print("DEBUG 65 data: \(data)")
            
            if let error = error {
                print("DEBUG 68 error: \(error)")
            }
            
            do {
                self.spells = try JSONDecoder().decode([Spells].self, from: data)
                
                print("DEBUG: total spells - \(self.spells.count)")

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print("Decoder Error from spells Data: \(error)")
            }
        }.resume()
    }
}
