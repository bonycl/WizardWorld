//
//  StaffTableViewController.swift
//  WizardWorld
//
//  Created by D i on 29.11.2023.
//

import UIKit

class PeopleTableViewController: UITableViewController {

     var wizards: [HogwartsStaff] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

       fetchData()
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return wizards.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wizardCell", for: indexPath) as! PersonCell
        
        let wizard = wizards[indexPath.row]
        //настройка ячейки
        cell.personFullName.text = "Full name: \(wizard.name ?? "")"
        cell.personHouse.text = "House: \(wizard.house ?? "")"
        cell.personActor.text = "Actor: \(wizard.actor ?? "")"
        cell.personImage.image = UIImage(named: "placeholderImage")
        //загрузка изображения
//        guard let imageUrlString = wizard.imageUrl,
//              let imageUrl = URL(string: imageUrlString) else { return }
//            
//            DispatchQueue.global().async {
//                guard let data try? Data(contentsOf: imageUrl),
//                   let image = UIImage(data: data) else  {
//                    return
//                }
//            }
        

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

}
