//
//  FieldPhotoViewController.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 1/15/17.
//  Copyright © 2017 Austin Blaser. All rights reserved.
//

import UIKit

class FieldPhotoViewController: UIViewController {
    
    // MARK: - View Elements
    let stackView = UIStackView()
    let imageView = UIImageView()
    let date = UILabel()
    let caption = UILabel()
    
    // MARK: - View
    override func viewDidLoad() {
        super.viewDidLoad()
        configureStackView()
        configureViewElements()
        self.view.backgroundColor = UIColor.darkGray
        // Do any additional setup after loading the view.
        //        caption.translatesAutoresizingMaskIntoConstraints = false
        //        caption.textAlignment = .center
        //        caption.textColor = UIColor.black
        //        self.view.addSubview(caption)
        //        let centerY = NSLayoutConstraint(item: caption, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 0)
        //        let centerX = NSLayoutConstraint(item: caption, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0)
        //        self.view.addConstraints([centerY, centerX])
    }
    
    func updateWith(photoData: String){
        self.caption.text = photoData
        self.date.text = "July 31, 2016"
        self.imageView.image = #imageLiteral(resourceName: "RavenclawCommonRoomWallpaper")
    }
    
    func configureStackView(){
        self.view.addSubview(stackView)
        
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.spacing = 16
        
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        let top = NSLayoutConstraint(item: stackView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0)
        let leading = NSLayoutConstraint(item: stackView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0)
        let trailing = NSLayoutConstraint(item: stackView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: stackView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0)
        self.view.addConstraints([top, leading, trailing, bottom])
        
        self.stackView.addArrangedSubview(imageView)
        self.stackView.addArrangedSubview(date)
        self.stackView.addArrangedSubview(caption)
    }
    
    func configureViewElements(){
        // Image View
        imageView.contentMode = .scaleAspectFit
        
        
        // Date
        date.textColor = UIColor.white
        date.textAlignment = .center
        let dateHeight = NSLayoutConstraint(item: date, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0, constant: 40)
        stackView.addConstraint(dateHeight)
        
        // Caption
        caption.textColor = UIColor.white
        caption.lineBreakMode = .byWordWrapping
        caption.numberOfLines = 0
        let captionHeight = NSLayoutConstraint(item: caption, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0, constant: 100)
        stackView.addConstraint(captionHeight)
    }
    
    
    
}

