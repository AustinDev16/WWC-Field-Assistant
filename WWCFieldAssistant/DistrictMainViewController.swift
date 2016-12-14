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
    
    func setUpChildViews(){
        addViewsAsSubviews()
        addContraintsToWellListView()
        wellListView.backgroundColor = UIColor.blue
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
        let width = NSLayoutConstraint(item: self.wellListView, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.33, constant: 0)
        self.view.addConstraints([leading, top, bottom, width])
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
