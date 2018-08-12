//
//  VillainDetailsViewController.swift
//  Villains
//
//  Created by Pranay Boggarapu on 8/12/18.
//  Copyright © 2018 Pranay Boggarapu. All rights reserved.
//

import UIKit

class VillainDetailViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var villainImage: String?
    var villainText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(villainText)")
        if let villainImage = villainImage {
            imageView.image = UIImage(named: villainImage)
        }
        
        textLabel.text = villainText
    }
    
    
}
