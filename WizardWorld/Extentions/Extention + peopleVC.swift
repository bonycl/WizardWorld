


import UIKit

extension PeopleTableViewController: UISearchResultsUpdating {
    
    
    
     func setupSearchController() {
        //получатель информации об изменении текста - булет наш класс
        searchController.searchResultsUpdater = self
        //параметр дает возможность взаимодействовать с отфильтрованными данными
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        //отпуск строки поиска при переходе на другой экран
        definesPresentationContext = true
    }
    
    
    
    
    
    
    
    
    
    
    
    
    //MARK: - Fetch data
    func fetchPersonData() {
        guard let newUrl = URL(string: url) else { return }
        
            URLSession.shared.dataTask(with: newUrl) { (data, _, error) in
            
            guard let data = data else { return }
            print("DEBUG 119 person data: \(data)")
            
            if let error = error {
                print("DEBUG 122 person error: \(error)")
            }
            
            do {
                self.wizards.removeAll()
                self.wizards = try JSONDecoder().decode([HogwartsPeople].self, from: data)
                
                print("DEBUG: total wizards - \(self.wizards.count)")
                print("DEBUG: wizard name - \(self.wizards.first?.name ?? "not known")")
                print("DEBUG: wizard actors name - \(self.wizards.first?.actor ?? "not known")")
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print("Decoder Error from person Data: \(error)")
            }
        }.resume()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    
}
