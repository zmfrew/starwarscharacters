//
//  IndividualTableViewCell.swift
//  StarWarsProfiles
//
//  Created by Zachary Frew on 7/19/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

import UIKit

class IndividualTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var individualImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - Properties
    var individual: Individual? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Methods
    func updateViews() {
        guard let individual = individual else { return }
        IndividualController.retrieveIndividualImage(individual) { (image) in
            DispatchQueue.main.async {
                // FIXIT: Update image check to use nil coalescing
                if let image = image {
                    self.individualImageView.image = image
                } else {
                    self.individualImageView.image = UIImage(named: "starwars")
                }
            }
        }
        nameLabel.text = "\(individual.firstName) \(individual.lastName)"
    }
    
}
