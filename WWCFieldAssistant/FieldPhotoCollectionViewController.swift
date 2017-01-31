//
//  FieldPhotoCollectionViewController.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 1/15/17.
//  Copyright © 2017 Austin Blaser. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoThumbnailCell"

class FieldPhotoCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var collectionView: UICollectionView!
    var well: Well?
    var fieldPhotos: [FieldPhoto] {
        let fieldPhotos = self.well?.fieldPhotos.flatMap{$0 as? FieldPhoto}
        return fieldPhotos ?? []
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updatePhotos), name: Notification.Name(rawValue: "FieldPhotoUpdated"), object: nil)
        
    }
    
    override func viewDidLayoutSubviews() {
        // To ensure the view has the right bounds before configuring the collection view
       configureCollectionView()
    }
    
    func configureCollectionView(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 90, height: 90)
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.backgroundColor = UIColor.white
        self.view.addSubview(collectionView)
        
        // Register cell classes
        self.collectionView!.register(FieldPhotoThumbnailCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    // MARK: - Notification methods
    
    func updatePhotos(){
        self.collectionView.reloadData()
    }
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        if self.well == nil || self.well?.fieldPhotos.count == 0 {
            let view = UIView(frame: self.collectionView.frame)
            view.backgroundColor = UIColor.white
            collectionView.backgroundView = view
            let label = UILabel()
            label.text = "No photos available"
            label.textColor = UIColor.lightGray
            label.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(label)
            let centerY = NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0)
            let centerX = NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0)
            view.addConstraints([centerY, centerX])
            return 0
        } else {
        collectionView.backgroundView = nil
            
        return 1
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.well?.fieldPhotos.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? FieldPhotoThumbnailCollectionViewCell
        guard let fieldPhoto = self.well?.fieldPhotos[indexPath.row] as? FieldPhoto, let photo = fieldPhoto.photo else { return UICollectionViewCell() }
        cell?.configureCell()
        cell?.updateWith(image: photo)
        
        // Configure the cell
        
        return cell ?? UICollectionViewCell()
    }
    
    // MARK: - Collection View Delegate methods
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pageView = RootPhotoPagesViewController()
        pageView.fieldPhotos = self.fieldPhotos
        pageView.indexOfSelectedPhoto = indexPath.row
        self.navigationController?.pushViewController(pageView, animated: true)
    }
    
}
