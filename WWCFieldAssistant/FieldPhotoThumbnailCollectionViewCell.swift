//
//  FieldPhotoThumbnailCollectionViewCell.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 1/15/17.
//  Copyright © 2017 Austin Blaser. All rights reserved.
//

import UIKit

class FieldPhotoThumbnailCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    var image: UIImage?
    var imageView = UIImageView()
    
    
    
    // MARK: Methods
    
    func configureCell(){
        self.contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        
        imageView.frame = self.contentView.bounds
        
    }
    
    func updateWith(){
        self.image = #imageLiteral(resourceName: "RavenclawCommonRoomWallpaper")
        self.imageView.image = self.image
    }
    
    
}
