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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        // To ensure the view has the right bounds before configuring the collection view
       configureCollectionView()
    }
    
    func configureCollectionView(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
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
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? FieldPhotoThumbnailCollectionViewCell
        cell?.configureCell()
        cell?.updateWith()
        
        // Configure the cell
        
        return cell ?? UICollectionViewCell()
    }
    
    // MARK: - Collection View Delegate methods
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pageView = RootPhotoPagesViewController()
        self.navigationController?.pushViewController(pageView, animated: true)
    }
    
}
