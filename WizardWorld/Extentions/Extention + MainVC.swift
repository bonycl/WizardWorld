////
////  Extentions.swift
////  WizardWorld
////
////  Created by D i on 29.11.2023.
////
//
////import Foundation
////
////extension PeopleTableViewController {
////
////    
////    func fetchData() {
////        
////        let url = "https://hp-api.onrender.com/api/characters/staff"
////        guard let url = URL(string: url) else { return }
////        
////        URLSession.shared.dataTask(with: url) { (data, _, error) in
////            
////            guard let data = data else { return }
////            print("data: \(data)")
////            
////            guard let error = error else { return }
////            print("error: \(error)")
////            
////            do {
////                self.wizards = try JSONDecoder().decode([HogwartsStaff].self, from: data)
////                
////                DispatchQueue.main.async {
////                    self.tableView.reloadData()
////
////                }
////            } catch let error {
////                print("Decoder Error: \(error)")
////            }
////        }.resume()
////    }
////}
//
//
//override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cell = tableView.dequeueReusableCell(withIdentifier: "wizardCell", for: indexPath) as! CustomPersonCell
//    
//    let wizard = wizards[indexPath.row]
//    
//    // Настройка ячейки
//    cell.activityIndicator.isHidden = false
//    cell.activityIndicator.startAnimating()
//    
//    cell.personFullName.text = "Full name: \(wizard.name ?? "1")"
//    cell.personHouse.text = "House: \(wizard.house ?? "11")"
//    cell.personActor.text = "Actor: \(wizard.actor ?? "111")"
//
//    // Загрузка изображения
//    if let imageUrlString = wizard.image,
//       let imageUrl = URL(string: imageUrlString) {
//        DispatchQueue.global().async {
//            if let data = try? Data(contentsOf: imageUrl),
//               let image = UIImage(data: data) {
//                DispatchQueue.main.async {
//                    cell.personImage.image = image
//                    cell.activityIndicator.stopAnimating()
//                    cell.activityIndicator.isHidden = true
//                }
//            } else {
//                DispatchQueue.main.async {
//                    cell.personImage.image = UIImage(systemName: "photo")
//                    cell.activityIndicator.stopAnimating()
//                    cell.activityIndicator.isHidden = true
//                }
//            }
//        }
//    } else {
//        // Если нет URL изображения, установим изображение-заполнитель
//        DispatchQueue.main.async {
//            cell.personImage.image = UIImage(systemName: "photo")
//            cell.activityIndicator.stopAnimating()
//            cell.activityIndicator.isHidden = true
//        }
//    }
//
//    return cell
//}
