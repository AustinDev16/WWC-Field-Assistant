//
//  AppLaunchViewController.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 1/20/17.
//  Copyright © 2017 Austin Blaser. All rights reserved.
//

import UIKit

class AppLaunchViewController: UIViewController {
    // MARK: - View Elements
    let boundingView = UIView()
    let userLabel = UILabel()
    let userPicker = UIPickerView()
    let districtLabel = UILabel()
    let districtPicker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.darkGray
        drawContainingView()
        configureViewElements()
    }
    
    func drawContainingView(){
        self.view.addSubview(boundingView)
        boundingView.layer.borderColor = UIColor.white.cgColor
        boundingView.layer.borderWidth = 3
        boundingView.layer.cornerRadius = 20
        //boundingView.frame = CGRect(x: 0, y: 0, width: 200, height: 500)
        boundingView.translatesAutoresizingMaskIntoConstraints = false
        
        let centerX = NSLayoutConstraint(item: boundingView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0)
        let centerY = NSLayoutConstraint(item: boundingView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 0)
        let width = NSLayoutConstraint(item: boundingView, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.0, constant: 400)
        let height = NSLayoutConstraint(item: boundingView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0.0, constant: 500)
        self.view.addConstraints([centerX, centerY, width, height])
    }
    
    func configureViewElements(){
        // user Label
        self.boundingView.addSubview(userLabel)
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        
        userLabel.text = "Select your name:"
        userLabel.textColor = UIColor.white
        userLabel.textAlignment = .center
        
        let ulTop = NSLayoutConstraint(item: userLabel, attribute: .top, relatedBy: .equal, toItem: boundingView, attribute: .top, multiplier: 1.0, constant: 8)
        let ulLeading = NSLayoutConstraint(item: userLabel, attribute: .leading, relatedBy: .equal, toItem: boundingView, attribute: .leading, multiplier: 1.0, constant: 0)
        let ulTrailing = NSLayoutConstraint(item: userLabel, attribute: .trailing, relatedBy: .equal, toItem: boundingView, attribute: .trailing, multiplier: 1.0, constant: 0)
        let ulHeight = NSLayoutConstraint(item: userLabel, attribute: .height, relatedBy: .equal, toItem: boundingView, attribute: .height, multiplier: 0.0, constant: 40)
        boundingView.addConstraints([ulTop, ulLeading, ulTrailing, ulHeight])
    
    }

    
}
