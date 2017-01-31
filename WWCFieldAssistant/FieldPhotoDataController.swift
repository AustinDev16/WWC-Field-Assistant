//
//  FieldPhotoDataController.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 1/15/17.
//  Copyright © 2017 Austin Blaser. All rights reserved.
//

import UIKit

class FieldPhotoDataController: NSObject {
    var fieldPhotos: [FieldPhoto] = []
    
    func updateWith(well: Well){
        self.fieldPhotos = well.fieldPhotos.flatMap{$0 as? FieldPhoto}
    }
}

extension FieldPhotoDataController: UIPageViewControllerDataSource {
    // MARK: - Helper Functions
    func viewControllerAtIndex(index: Int) -> FieldPhotoViewController? {
        if (self.fieldPhotos.count == 0) || (index >= self.fieldPhotos.count) {
            return nil
        }
        
        let fieldPhotoViewController = FieldPhotoViewController()
        fieldPhotoViewController.updateWith(fieldPhoto: self.fieldPhotos[index])
        return fieldPhotoViewController
    }
    
    func indexOfViewController(viewController: FieldPhotoViewController) -> Int {
        let fieldPhoto = viewController.imageView.image
        let filteredArray = self.fieldPhotos.filter{$0.photo == fieldPhoto}
        guard let result = filteredArray.first else {return NSNotFound }
        return fieldPhotos.index(of: result) ?? NSNotFound
    }
    
    // MARK: - Datasource methods
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController: viewController as! FieldPhotoViewController)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        return self.viewControllerAtIndex(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController: viewController as! FieldPhotoViewController)
        if index == NSNotFound {
            return nil
        }
        index += 1
        if index == self.fieldPhotos.count {
            return nil
        }
        return self.viewControllerAtIndex(index: index)
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.fieldPhotos.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        //let currentView = pageViewController.viewControllers?.first
        return 0
    }
}

