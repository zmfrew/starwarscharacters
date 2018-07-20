//
//  IndividualController.swift
//  StarWarsProfiles
//
//  Created by Zachary Frew on 7/19/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

import Foundation

class IndividualController {
    
    // MARK: - Properties
    static let baseURL = URL(string: "https://starwarstest16.herokuapp.com/api/characters")
    
    // MARK: - Methods
    func retrieveIndividuals(completion: @escaping ([Individual]) -> Void) {
        guard let url = IndividualController.baseURL else { completion([]) ; return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error occurred retrieving data: \(error.localizedDescription).")
                completion([])
                return
            }
            
            guard let data = data else { completion([]) ; return }
            
            do {
                let individualsDict = try JSONDecoder().decode([String: [Individual]].self, from: data)
                guard let individuals = individualsDict["individuals"] else { completion([]) ; return }
                print(individuals)
                completion(individuals)
            } catch {
                print("Error occurred decoding data from JSON: \(error.localizedDescription).")
                completion([])
            }
        }.resume()
    }
    
    
}
