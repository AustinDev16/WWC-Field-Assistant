//
//  NoWellAvailableViewController.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 1/19/17.
//  Copyright © 2017 Austin Blaser. All rights reserved.
//

import UIKit

class NoWellAvailableViewController: UIViewController {
    // MARK: - Properties
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.preferredContentSize = CGSize(width: 200, height: 40)

        // Do any additional setup after loading the view.
        view.addSubview(label)
        label.text = "Please select a well."
        
        label.translatesAutoresizingMaskIntoConstraints = false
        let centerY = NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 0)
        let centerX = NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0)
        view.addConstraints([centerY, centerX])
    }


}
