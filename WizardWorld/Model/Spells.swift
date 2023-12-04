//
//  Spells.swift
//  WizardWorld
//
//  Created by D i on 30.11.2023.
//

import Foundation

struct Spells: Decodable {
    let name: String?
    let description: String?
    
    init(spellsBook: [String: Any]) {
        name = spellsBook["name"] as? String
        description = spellsBook["description"] as? String
        
    }
    
    static func getSpells(from jsonData: Any) -> [Spells] {
        guard let jsonData = jsonData as? Array<[String: Any]> else { return [] }
        return jsonData.compactMap { Spells(spellsBook: $0) }
    }
    
    
}
