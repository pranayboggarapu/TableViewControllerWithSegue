//
//  CollectionsCollectionViewController.swift
//  Villains
//
//  Created by Pranay Boggarapu on 8/12/18.
//  Copyright © 2018 Pranay Boggarapu. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionsCollectionViewController: UICollectionViewController {

    var allVillains: [Villain]?

    var selectedVillain: String?
    var selectedVillainText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        allVillains = appDelegate.villains
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(VillainCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        

        // Do any additional setup after loading the view.
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (allVillains?.count)!
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let villain = self.allVillains![(indexPath as NSIndexPath).row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! VillainCollectionViewCell
        // Configure the cell
        cell.nameLabel?.text = villain.name
        cell.villainImageView?.image = UIImage(named: villain.imageName)
        
        return cell
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let villain = self.allVillains![indexPath.row]
        self.selectedVillain = villain.imageName
        self.selectedVillainText = villain.evilScheme
        
        self.performSegue(withIdentifier: "showVillainDetails", sender: self)
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let villainResultController = segue.destination as! VillainDetailViewController
        villainResultController.villainImage = self.selectedVillain
        villainResultController.villainText = self.selectedVillainText
        
    }
    

}
