//
//  FieldPhotoTableViewCell.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 12/23/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import UIKit

class FieldPhotoTableViewCell: UITableViewCell {
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell<T: UIViewController>(parentView: T){
        configureCollectionView(parentView: parentView)
    }
    
    func configureCollectionView<T: UIViewController>(parentView: T){
        let collectionView = FieldPhotoCollectionViewController()
        contentView.addSubview(collectionView.view)
        
        // Layout Constraints
        collectionView.view.translatesAutoresizingMaskIntoConstraints = false
        let top = NSLayoutConstraint(item: collectionView.view, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: collectionView.view, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1.0, constant: 0)
        let leading = NSLayoutConstraint(item: collectionView.view, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1.0, constant: 0)
        let trailing = NSLayoutConstraint(item: collectionView.view, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1.0, constant: 0)
        self.contentView.addConstraints([top, bottom, leading, trailing])
        parentView.addChildViewController(collectionView)
        collectionView.didMove(toParentViewController: parentView)
    }

}
