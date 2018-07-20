//
//  Individual.swift
//  StarWarsProfiles
//
//  Created by Zachary Frew on 7/19/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

import UIKit

struct Individual: Codable {
    
    // MARK: - Properties
    let firstName: String
    let lastName: String
    let birthdate: String
    let imageURLAsString: String
    let hasForce: Bool
    let affiliation: String
    
    // MARK: - Coding Keys Enum
    enum CodingKeys: String, CodingKey {
        case firstName
        case lastName
        case birthdate
        case imageURLAsString = "profilePicture"
        case hasForce = "forceSensitive"
        case affiliation
    }
    
}
