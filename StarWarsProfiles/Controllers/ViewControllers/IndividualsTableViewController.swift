//
//  IndividualsTableViewController.swift
//  StarWarsProfiles
//
//  Created by Zachary Frew on 7/19/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

import UIKit

class IndividualsTableViewController: UITableViewController {

    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        IndividualController.retrieveIndividuals { (individuals) in
            guard let individuals = individuals else { return }
            self.individuals = individuals
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Properties
    var individuals: [Individual] = []
    
    // MARK: - Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return individuals.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "individualCell", for: indexPath) as? IndividualTableViewCell else { return UITableViewCell() }
        let individual = individuals[indexPath.row]
        cell.individual = individual
        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toIndividualDetail" {
            guard let destinationVC = segue.destination as? IndividualViewController, let indexPath = tableView.indexPathForSelectedRow else { return }
            let individual = individuals[indexPath.row]
            destinationVC.individual = individual
        }
    }

}
