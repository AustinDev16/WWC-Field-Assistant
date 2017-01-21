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
    let titleLabel = UILabel()
    let boundingView = UIView()
    let userLabel = UILabel()
    let userPicker = UIPickerView()
    let districtLabel = UILabel()
    let districtPicker = UIPickerView()
    let licenseLabel = UILabel()
    let beginButton = UIButton(type: .roundedRect)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(red: 37/255.0, green: 137/255.0, blue: 189/255.0, alpha: 0.8)
        drawContainingView()
        configureViewElements()
        configureTitle()
    }
    
    func configureTitle(){
        self.view.addSubview(titleLabel)
        titleLabel.font = UIFont.systemFont(ofSize: 48)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text =  "Water Meter Field Assistant"
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .center
        
        
        let bottom = NSLayoutConstraint(item: titleLabel, attribute: .bottom, relatedBy: .equal, toItem: boundingView, attribute: .top, multiplier: 1.0, constant: -24)
        let centerX = NSLayoutConstraint(item: titleLabel, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0)
        let height = NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0.0, constant: 60)
        self.view.addConstraints([bottom, centerX, height])
    }
    
    func drawContainingView(){
        self.view.addSubview(boundingView)
        boundingView.backgroundColor = UIColor(red: 37/255.0, green: 137/255.0, blue: 189/255.0, alpha: 0.3)
        boundingView.layer.borderColor = UIColor.white.cgColor
        boundingView.layer.borderWidth = 2
        boundingView.layer.cornerRadius = 20
        boundingView.translatesAutoresizingMaskIntoConstraints = false
        
        let centerX = NSLayoutConstraint(item: boundingView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0)
        let centerY = NSLayoutConstraint(item: boundingView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 0)
        let width = NSLayoutConstraint(item: boundingView, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.0, constant: 400)
        let height = NSLayoutConstraint(item: boundingView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0.0, constant: 380)
        self.view.addConstraints([centerX, centerY, width, height])
    }
    
    func configureViewElements(){
        // User label
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
        
        // User picker
        self.boundingView.addSubview(userPicker)
        userPicker.delegate = self
        userPicker.dataSource = self
        userPicker.translatesAutoresizingMaskIntoConstraints = false
        userPicker.backgroundColor = UIColor.clear
        userPicker.layer.borderWidth = 0.5
        userPicker.layer.borderColor = UIColor.white.cgColor
        
        let upTop = NSLayoutConstraint(item: userPicker, attribute: .top, relatedBy: .equal, toItem: userLabel, attribute: .bottom, multiplier: 1.0, constant: 8)
        let upLeading = NSLayoutConstraint(item: userPicker, attribute: .leading, relatedBy: .equal, toItem: boundingView, attribute: .leading, multiplier: 1.0, constant: 0)
        let upTrailing = NSLayoutConstraint(item: userPicker, attribute: .trailing, relatedBy: .equal, toItem: boundingView, attribute: .trailing, multiplier: 1.0, constant: 0)
        let upHeight = NSLayoutConstraint(item: userPicker, attribute: .height, relatedBy: .equal, toItem: boundingView, attribute: .height, multiplier: 0.0, constant: 110)
        boundingView.addConstraints([upTop, upLeading, upTrailing, upHeight])
        
        // District label
        self.boundingView.addSubview(districtLabel)
        districtLabel.translatesAutoresizingMaskIntoConstraints = false
        
        districtLabel.text = "Select a district:"
        districtLabel.textColor = UIColor.white
        districtLabel.textAlignment = .center
        
        let dlTop = NSLayoutConstraint(item: districtLabel, attribute: .top, relatedBy: .equal, toItem: userPicker, attribute: .bottom, multiplier: 1.0, constant: 8)
        let dlLeading = NSLayoutConstraint(item: districtLabel, attribute: .leading, relatedBy: .equal, toItem: boundingView, attribute: .leading, multiplier: 1.0, constant: 0)
        let dlTrailing = NSLayoutConstraint(item: districtLabel, attribute: .trailing, relatedBy: .equal, toItem: boundingView, attribute: .trailing, multiplier: 1.0, constant: 0)
        let dlHeight = NSLayoutConstraint(item: districtLabel, attribute: .height, relatedBy: .equal, toItem: boundingView, attribute: .height, multiplier: 0.0, constant: 40)
        boundingView.addConstraints([dlTop, dlLeading, dlTrailing, dlHeight])
        
        // District Picker
        self.boundingView.addSubview(districtPicker)
        districtPicker.translatesAutoresizingMaskIntoConstraints = false
        districtPicker.backgroundColor = UIColor.clear
        districtPicker.delegate = self
        districtPicker.dataSource = self
        districtPicker.layer.borderWidth = 0.5
        districtPicker.layer.borderColor = UIColor.white.cgColor
        
        let dpTop = NSLayoutConstraint(item: districtPicker, attribute: .top, relatedBy: .equal, toItem: districtLabel, attribute: .bottom, multiplier: 1.0, constant: 8)
        let dpLeading = NSLayoutConstraint(item: districtPicker, attribute: .leading, relatedBy: .equal, toItem: boundingView, attribute: .leading, multiplier: 1.0, constant: 0)
        let dpTrailing = NSLayoutConstraint(item: districtPicker, attribute: .trailing, relatedBy: .equal, toItem: boundingView, attribute: .trailing, multiplier: 1.0, constant: 0)
        let dpHeight = NSLayoutConstraint(item: districtPicker, attribute: .height, relatedBy: .equal, toItem: boundingView, attribute: .height, multiplier: 0.0, constant: 100)
        boundingView.addConstraints([dpTop, dpLeading, dpTrailing, dpHeight])
        
        // License label
        self.boundingView.addSubview(licenseLabel)
        licenseLabel.translatesAutoresizingMaskIntoConstraints = false
        licenseLabel.text = "\u{00A9} 2017 Aptian Software"
        licenseLabel.textAlignment = .center
        licenseLabel.textColor = UIColor.white
        licenseLabel.font = UIFont.systemFont(ofSize: 10)
        //licenseLabel.adjustsFontSizeToFitWidth = false
        
        let llBottom = NSLayoutConstraint(item: licenseLabel, attribute: .bottom, relatedBy: .equal, toItem: boundingView, attribute: .bottom, multiplier: 1.0, constant: -8)
        let llLeading = NSLayoutConstraint(item: licenseLabel, attribute: .leading, relatedBy: .equal, toItem: boundingView, attribute: .leading, multiplier: 1.0, constant: 4)
        let llTrailing = NSLayoutConstraint(item: licenseLabel, attribute: .trailing, relatedBy: .equal, toItem: boundingView, attribute: .trailing, multiplier: 1.0, constant: 4)
        let llHeight = NSLayoutConstraint(item: licenseLabel, attribute: .height, relatedBy: .equal, toItem: boundingView, attribute: .height, multiplier: 0.0, constant: 40)
        boundingView.addConstraints([llBottom, llLeading, llTrailing, llHeight])
        
        // begin Button
        self.view.addSubview(beginButton)
        beginButton.addTarget(self, action: #selector(beginSessionTapped), for: .touchUpInside)
        beginButton.translatesAutoresizingMaskIntoConstraints = false
        beginButton.setTitle("Begin Session", for: .normal)
        beginButton.setTitleColor(UIColor.white, for: .normal)
        beginButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        beginButton.layer.borderWidth = 1
        beginButton.layer.borderColor = UIColor.lightGray.cgColor
        beginButton.layer.cornerRadius = 15
        beginButton.backgroundColor = UIColor(red: 38/255.0, green: 145/255.0, blue: 15/255.0, alpha: 1.0)

        
        
        let bbTop = NSLayoutConstraint(item: beginButton, attribute: .top, relatedBy: .equal, toItem: boundingView, attribute: .bottom, multiplier: 1.0, constant: 24)
        let bbWidth = NSLayoutConstraint(item: beginButton, attribute: .width, relatedBy: .equal, toItem: boundingView, attribute: .width, multiplier: 1.0, constant: 0)
        let bbHeight = NSLayoutConstraint(item: beginButton, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0, constant: 60)
        let centerX = NSLayoutConstraint(item: beginButton, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0)
        self.view.addConstraints([bbTop, bbWidth, bbHeight, centerX])
    
    }
    
    // MARK: - Button Actions
    func beginSessionTapped(){
        
    }

    
}

extension AppLaunchViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: "Test", attributes: [NSForegroundColorAttributeName : UIColor.white])
    }
}
