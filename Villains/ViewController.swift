//
//  ViewController.swift
//  Villains
//
//  Created by Pranay Boggarapu on 8/12/18.
//  Copyright © 2018 Pranay Boggarapu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: Properties
    
    // Get ahold of some villains, for the table
    // This is an array of Villain instances
    let allVillains = Villain.allVillains
    
    var selectedVillain: String?
    var selectedVillainText: String?
    
    // MARK: Table View Data Source
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Villains"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.allVillains.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let villain = self.allVillains[(indexPath as NSIndexPath).row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "VillainCell")
        
        
        // Set the name and image
        cell?.textLabel?.text = villain.name
        cell?.imageView?.image = UIImage(named: villain.imageName)
        
        // If the cell has a detail label, we will put the evil scheme in.
        if let detailTextLabel = cell?.detailTextLabel {
            detailTextLabel.text = "Scheme: \(villain.evilScheme)"
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let villain = self.allVillains[indexPath.row]
        self.selectedVillain = villain.imageName
        self.selectedVillainText = villain.evilScheme
        
        self.performSegue(withIdentifier: "showVillainDetails", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let villainResultController = segue.destination as! VillainDetailViewController
        villainResultController.villainImage = self.selectedVillain
        villainResultController.villainText = self.selectedVillainText
        
    }

}

