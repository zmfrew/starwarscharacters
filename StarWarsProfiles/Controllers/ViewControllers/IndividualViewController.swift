//
//  IndividualViewController.swift
//  StarWarsProfiles
//
//  Created by Zachary Frew on 7/19/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

import UIKit

class IndividualViewController: UIViewController {

    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdateLabel: UILabel!
    @IBOutlet weak var hasForceLabel: UILabel!
    @IBOutlet weak var affiliationLabel: UILabel!
    
    // MARK: - Properties
    var individual: Individual?
    
    // MARK: - Methods
    func updateViews() {
        guard let individual = individual else { return }
        imageView.image = UIImage(named: individual.firstName.lowercased())
        nameLabel.text = "\(individual.firstName) \(individual.lastName)"
        birthdateLabel.text = individual.birthdate
        let forceString = individual.hasForce ? "The force is strong in this one." : "This one does not use the force."
        hasForceLabel.text = forceString
        affiliationLabel.text = individual.affiliation
    }
    
    
}
