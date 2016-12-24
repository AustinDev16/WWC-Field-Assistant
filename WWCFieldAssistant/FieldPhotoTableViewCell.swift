//
//  FieldPhotoTableViewCell.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 12/23/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import UIKit

class FieldPhotoTableViewCell: UITableViewCell {

    // MARK: - Cell elements
    var collectionView = UIView()
    let collectionViewController: UICollectionViewController? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(){
        self.contentView.addSubview(collectionView)
        
        setUpCollectionView()
        
    }
    
    func setUpCollectionView(){
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.green
        
        let leading = NSLayoutConstraint(item: collectionView, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leadingMargin, multiplier: 1.0, constant: 0)
        let top = NSLayoutConstraint(item: collectionView, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: collectionView, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1.0, constant: 0)
        let trailing = NSLayoutConstraint(item: collectionView, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailingMargin, multiplier: 1.0, constant: 0)
        self.contentView.addConstraints([leading, top, bottom, trailing])
        
    }

}
