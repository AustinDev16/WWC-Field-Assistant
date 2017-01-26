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
        self.view.backgroundColor = UIColor.white
    }
    
    func updateWith(photoData: String){
        self.caption.text = photoData
        self.date.text = "July 31, 2016"
        self.imageView.image = #imageLiteral(resourceName: "MockWellPhoto")
    }
    
    func configureStackView(){
        self.view.addSubview(stackView)
        
        stackView.alignment = .top
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 8
        
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        let top = NSLayoutConstraint(item: stackView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 8)
        let leading = NSLayoutConstraint(item: stackView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0)
        let trailing = NSLayoutConstraint(item: stackView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: stackView, attribute: .bottom, relatedBy: .lessThanOrEqual, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0)
        self.view.addConstraints([top, leading, trailing, bottom])
        
        self.stackView.addArrangedSubview(imageView)
        self.stackView.addArrangedSubview(date)
        self.stackView.addArrangedSubview(caption)
    }
    
    func configureViewElements(){
        // Image View
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let imageViewHeight = NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: self.stackView, attribute: .height, multiplier: 0.5, constant: 0)
        let imageViewWidth = NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .lessThanOrEqual, toItem: self.stackView, attribute: .width, multiplier: 1.0, constant: 0)
        stackView.addConstraints([imageViewHeight, imageViewWidth])
        
        
        // Date
        date.textColor = UIColor.black
        date.textAlignment = .center
        let dateHeight = NSLayoutConstraint(item: date, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0, constant: 40)
        let leading = NSLayoutConstraint(item: date, attribute: .leading, relatedBy: .equal, toItem: self.stackView, attribute: .leading, multiplier: 1.0, constant: 8)
        stackView.addConstraint(dateHeight)
        stackView.addConstraints([leading])
        
        // Caption
        caption.textColor = UIColor.black
        caption.numberOfLines = 0
        caption.text = "Well is leaking!"
        let captionHeight = NSLayoutConstraint(item: caption, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0, constant: 100)
        stackView.addConstraint(captionHeight)
    }
    
    
    
}

