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
        let height = imageView.frame.height
        let width = imageView.frame.width
        imageView.layer.cornerRadius = height > width ? width / 2 : height / 2
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        nameLabel.text = "\(individual.firstName) \(individual.lastName)"
        birthdateLabel.text = individual.birthdate
        let forceString = individual.hasForce ? "The force is strong in this one." : "The force is not strong in this one."
        hasForceLabel.text = forceString
        affiliationLabel.text = individual.affiliation
    }
    
   
    
}
