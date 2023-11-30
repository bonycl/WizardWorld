//
//  Wizards.swift
//  WizardWorld
//
//  Created by D i on 29.11.2023.
//

import Foundation

struct HogwartsStaff: Decodable {
    let name: String?
    let gender: String?
    let house: String?
    let dateOfBirth: String?
    let ancestry: String?
    let species: String?
    
    let patronus: String?
    let actor: String?
    let image: String?

}

struct HogwartsStudents: Decodable {
    let name: String?
    let gender: String?
    let house: String?
    let dateOfBirth: String?
    let ancestry: String?
    let species: String?
    
    let patronus: String?
    let actor: String?
    let image: String?

}
