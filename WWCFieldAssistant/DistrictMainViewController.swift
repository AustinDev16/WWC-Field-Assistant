//
//  DistrictMainViewController.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 12/14/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import UIKit

class DistrictMainViewController: UIViewController {
    
    
    // MARK: - View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpChildViews()
        loadViewControllers()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Child Views
    
    let wellListView: UIView = UIView()
    let mapView: UIView = UIView()
    let dataEntryListView: UIView = UIView()
    let wellInfoView: UIView = UIView()
    let dataEntryDetailView: UIView = UIView()
    let newEntryButtonView: UIView = UIView()
    
    // Proportions
    let wellListWidthProportion: CGFloat = 0.25
    let mapViewWidthProportion: CGFloat = 0.33
    let wellInfoHeightProportion: CGFloat = 0.66
    let newEntryButtonViewHeight: CGFloat = 80
    
    // View Controllers
    lazy var wellListTVC: WellListTableViewController = {
       let viewController = WellListTableViewController()
        return viewController
    }()
    /// Adds subviews and corresponding constraints.
    func setUpChildViews(){
        addViewsAsSubviews()
        
        addContraintsToWellListView()
        wellListView.backgroundColor = UIColor.blue
        
        addConstraintsToMapView()
        mapView.backgroundColor = UIColor.cyan
        
        addContraintsToDataEntryListView()
        dataEntryListView.backgroundColor = UIColor.brown
        
        addConstraintsToWellInfoView()
        wellInfoView.backgroundColor = UIColor.purple
        
        addContraintsToDataEntryDetailView()
        dataEntryDetailView.backgroundColor = UIColor.darkGray
        
        addConstraintsToNewEntryButton()
        newEntryButtonView.backgroundColor = UIColor.green
    }
    
    /// Instantiates view controllers and assigns their view to the child views.
    func loadViewControllers(){
        // WellListTVC
        self.addChildViewController(wellListTVC)
        wellListView.addSubview(wellListTVC.view)
        wellListTVC.view.frame = wellListView.bounds
        wellListTVC.didMove(toParentViewController: self)
    }
    
    func addViewsAsSubviews(){
        self.view.addSubview(wellListView)
        self.view.addSubview(mapView)
        self.view.addSubview(dataEntryListView)
        self.view.addSubview(wellInfoView)
        self.view.addSubview(dataEntryDetailView)
        self.view.addSubview(newEntryButtonView)
    }
    
    func addContraintsToWellListView(){
        self.wellListView.translatesAutoresizingMaskIntoConstraints = false
        let leading = NSLayoutConstraint(item: self.wellListView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0)
        let top = NSLayoutConstraint(item: self.wellListView, attribute: .top, relatedBy: .equal, toItem: self.topLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: self.wellListView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0)
        let width = NSLayoutConstraint(item: self.wellListView, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: wellListWidthProportion, constant: 0)
        self.view.addConstraints([leading, top, bottom, width])
    }
    
    func addConstraintsToMapView(){
        self.mapView.translatesAutoresizingMaskIntoConstraints = false
        let leading = NSLayoutConstraint(item: self.mapView, attribute: .leading, relatedBy: .equal, toItem: self.wellListView, attribute: .trailing, multiplier: 1.0, constant: 8)
        let top = NSLayoutConstraint(item: self.mapView, attribute: .top, relatedBy: .equal, toItem: self.topLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 0)
        let width = NSLayoutConstraint(item: self.mapView, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: mapViewWidthProportion, constant: 0)
        let height = NSLayoutConstraint(item: self.mapView, attribute: .height, relatedBy: .equal, toItem: self.mapView, attribute: .width, multiplier: 1.0, constant: 0)
        self.view.addConstraints([leading, top, width, height])
    }
    
    func addContraintsToDataEntryListView(){
        self.dataEntryListView.translatesAutoresizingMaskIntoConstraints = false
        let leading = NSLayoutConstraint(item: self.dataEntryListView, attribute: .leading, relatedBy: .equal, toItem: self.wellListView, attribute: .trailing, multiplier: 1.0, constant: 8)
        let top = NSLayoutConstraint(item: self.dataEntryListView, attribute: .top, relatedBy: .equal, toItem: self.mapView, attribute: .bottom, multiplier: 1.0, constant: 8)
        let bottom = NSLayoutConstraint(item: self.dataEntryListView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0)
        let width = NSLayoutConstraint(item: self.dataEntryListView, attribute: .width, relatedBy: .equal, toItem: self.mapView, attribute: .width, multiplier: 1.0, constant: 0)
        self.view.addConstraints([leading, top, bottom, width])
    }
    
    func addConstraintsToWellInfoView(){
        self.wellInfoView.translatesAutoresizingMaskIntoConstraints = false
        let leading = NSLayoutConstraint(item: self.wellInfoView, attribute: .leading, relatedBy: .equal, toItem: self.mapView, attribute: .trailing, multiplier: 1.0, constant: 8)
        let top = NSLayoutConstraint(item: self.wellInfoView, attribute: .top, relatedBy: .equal, toItem: self.topLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 0)
        let trailing = NSLayoutConstraint(item: self.wellInfoView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0)
        let height = NSLayoutConstraint(item: self.wellInfoView, attribute: .height, relatedBy: .equal, toItem: self.mapView, attribute: .height, multiplier: wellInfoHeightProportion, constant: 0)
        self.view.addConstraints([leading, top, trailing, height])
        
    }
    
    func addContraintsToDataEntryDetailView(){
        self.dataEntryDetailView.translatesAutoresizingMaskIntoConstraints = false
        let leading = NSLayoutConstraint(item: self.dataEntryDetailView, attribute: .leading, relatedBy: .equal, toItem: self.mapView, attribute: .trailing, multiplier: 1.0, constant: 8)
        let top = NSLayoutConstraint(item: self.dataEntryDetailView, attribute: .top, relatedBy: .equal, toItem: self.wellInfoView, attribute: .bottom, multiplier: 1.0, constant: 8)
        let trailing = NSLayoutConstraint(item: self.dataEntryDetailView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: self.dataEntryDetailView, attribute: .bottom, relatedBy: .equal, toItem: self.newEntryButtonView, attribute: .top, multiplier: 1.0, constant: -8)
        self.view.addConstraints([leading, top, trailing, bottom])
        
    }

    func addConstraintsToNewEntryButton(){
        self.newEntryButtonView.translatesAutoresizingMaskIntoConstraints = false
        let leading = NSLayoutConstraint(item: self.newEntryButtonView, attribute: .leading, relatedBy: .equal, toItem: self.dataEntryListView, attribute: .trailing, multiplier: 1.0, constant: 8)
        let bottom = NSLayoutConstraint(item: self.newEntryButtonView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0)
        let trailing = NSLayoutConstraint(item: self.newEntryButtonView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0)
        let height = NSLayoutConstraint(item: self.newEntryButtonView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.0, constant: newEntryButtonViewHeight)
        self.view.addConstraints([leading, bottom, trailing, height])
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
