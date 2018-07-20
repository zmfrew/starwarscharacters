//
//  IndividualController.swift
//  StarWarsProfiles
//
//  Created by Zachary Frew on 7/19/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

import UIKit

class IndividualController {
    
    // MARK: - Properties
    static let baseURL = URL(string: "https://starwarstest16.herokuapp.com/api/characters")
    
    // MARK: - Methods
    static func retrieveIndividuals(completion: @escaping ([Individual]?) -> Void) {
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
                completion(individuals)
            } catch {
                print("Error occurred decoding data from JSON: \(error.localizedDescription).")
                completion([])
            }
        }.resume()
    }
    
    static func retrieveIndividualImage(_ individual: Individual, completion: @escaping ((UIImage?) -> Void)) {
        guard let url = URL(string: individual.imageURLAsString) else {
            print("Error occurred with converting provided image URL.")
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error occurred retrieving the image: \(error.localizedDescription).")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("No data was received for the individual image.")
                completion(nil)
                return
            }

            let image = UIImage(data: data)
            completion(image)
        }.resume()
    }
    
}
