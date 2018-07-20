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
    var individualImage: UIImage?
    
    // MARK: - Methods
    func updateViews() {
        guard let individual = individual,
            let individualImage = individualImage ?? UIImage(named: "starwars")
            else { return }
        nameLabel.text = "\(individual.firstName) \(individual.lastName)"
        individualImageView.image = individualImage
    }
    
}
