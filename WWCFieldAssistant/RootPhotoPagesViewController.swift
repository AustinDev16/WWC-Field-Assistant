//
//  RootPhotoPagesViewController.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 1/15/17.
//  Copyright © 2017 Austin Blaser. All rights reserved.
//

import UIKit

class RootPhotoPagesViewController: UIViewController {


    // MARK: - Properties
    var pageViewController: UIPageViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        
        // Do any additional setup after loading the view.
        // Setup Page View Controller
        configurePageViewController()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateSelectedWell(notification:)), name: Notification.Name(rawValue: "SelectedWellUpdated"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.resetDataEntryView(notification:)), name: Notification.Name(rawValue:"SelectedDistrictUpdated"), object: nil)

    }
    
    func updateSelectedWell(notification: Notification){
        _ = self.navigationController?.popToRootViewController(animated: true)
    }
    
    /// Called to reset the view when no well is selected (i.e. new district is selected)
    func resetDataEntryView(notification: Notification){
        _ = self.navigationController?.popToRootViewController(animated: true)
    }
    
    func configurePageViewController(){
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageViewController?.delegate = self
        
        
        
        // For testing
        let firstView = FieldPhotoViewController()
        firstView.updateWith(photoData: fieldPhotoDataController.fieldPhotos[0])
        self.pageViewController?.setViewControllers([firstView], direction: .forward, animated: true, completion: nil)
        self.pageViewController?.dataSource = self.fieldPhotoDataController
        self.addChildViewController(self.pageViewController!)
        self.view.addSubview(self.pageViewController!.view)
        self.pageViewController!.didMove(toParentViewController: self)
    }
    
    var fieldPhotoDataController: FieldPhotoDataController {
        if _fieldPhotoDataController == nil {
            _fieldPhotoDataController = FieldPhotoDataController()
        }
        return _fieldPhotoDataController!
    }
    
    var _fieldPhotoDataController: FieldPhotoDataController? = nil
}

extension RootPhotoPagesViewController: UIPageViewControllerDelegate {
    
}
