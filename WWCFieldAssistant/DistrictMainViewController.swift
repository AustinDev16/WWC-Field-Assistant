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
        self.view.backgroundColor = UIColor.darkGray
        setUpChildViews()
        loadViewControllers()
        setUpNavigationBar()
        
        // for testing
       // newEntryButtonTapped()
    }
    
    func setUpNavigationBar(){
        self.navigationItem.titleView = returnTitleView()
        
        // Bar buttons
        let logout = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutButtonTapped))
        let settings = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: nil)
        let sync = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(syncButtonTapped))
        let folders = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: nil)
        
        self.navigationItem.leftBarButtonItems = [logout, settings]
        self.navigationItem.rightBarButtonItems = [sync, folders]
        
    }
    
    func returnTitleView() -> UIButton {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(titleButtonTapped), for: .touchUpInside)
        button.setTitle("Bonneville District", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitleColor(UIColor.gray, for: .selected)
        return button
    }
    
    // MARK: - Navigation bar actions
    
    func logoutButtonTapped(){
        print("logout button tapped")
    }
    
    func syncButtonTapped(){
        print("syncButtonTapped")
    }
    
    func titleButtonTapped(){
        let districtsPopoverController = DistrictsTableViewController()
        districtsPopoverController.modalPresentationStyle = .popover
        districtsPopoverController.preferredContentSize = CGSize(width: 350, height: 300)
        present(districtsPopoverController, animated: true, completion: nil)
        
        let presentationController = districtsPopoverController.popoverPresentationController
        //presentationController?.delegate = self
        presentationController?.permittedArrowDirections = [.up]
        presentationController?.sourceView = self.navigationItem.titleView
        let width = self.navigationItem.titleView?.frame.width ?? 0
        presentationController?.sourceRect = CGRect(x: width/2.0, y: 15, width: 1, height: 1)
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
    let mapViewWidthProportion: CGFloat = 0.5
    let mapViewHeightProportion: CGFloat = 0.66
    let wellInfoHeightProportion: CGFloat = 1.0
    let newEntryButtonViewHeight: CGFloat = 50
    
    // View Controllers
    lazy var wellListTVC: WellListTableViewController = {
       let viewController = WellListTableViewController()
        return viewController
    }()
    
    lazy var dataEntryListTVC: DataEntryListTableViewController = {
        let viewController = DataEntryListTableViewController()
        return viewController
    }()
    
    lazy var wellInfoTVC: WellInfoTableViewController = {
       let viewController = WellInfoTableViewController(style: .grouped)
        return viewController
    }()
    
    lazy var wellInfoNavigationController: UINavigationController = {
        let nc = UINavigationController(rootViewController: self.wellListTVC)
        return nc
    }()
    
    lazy var dataEntryNavigationController: UINavigationController = {
       let nc = UINavigationController(rootViewController: self.dataEntryListTVC)
        return nc 
    }()
    
    /// Adds subviews and corresponding constraints.
    func setUpChildViews(){
        addViewsAsSubviews()
        
//        addContraintsToWellListView()
//        wellListView.backgroundColor = UIColor.blue
        
        addConstraintsToMapView()
        mapView.backgroundColor = UIColor.lightGray
        
        addConstraintsToWellInfoView()
        wellInfoView.backgroundColor = UIColor.purple

        //addContraintsToDataEntryListView()
        //dataEntryListView.backgroundColor = UIColor.brown
        
        addContraintsToDataEntryDetailView()
        //dataEntryDetailView.backgroundColor = UIColor.darkGray
        
        addConstraintsToNewEntryButton()
        newEntryButtonView.backgroundColor = UIColor(red: 38/255.0, green: 145/255.0, blue: 15/255.0, alpha: 1.0)
        setUpEntryButton()
    }
    
    /// Instantiates view controllers and assigns their view to the child views.
    func loadViewControllers(){
//        // WellListTVC
//        self.addChildViewController(wellListTVC)
//        wellListView.addSubview(wellListTVC.view)
//        wellListTVC.view.frame = wellListView.bounds
//        wellListTVC.didMove(toParentViewController: self)
        
        //DataEntryListTVC
        self.addChildViewController(dataEntryListTVC)
        dataEntryListView.addSubview(dataEntryListTVC.view)
        dataEntryListTVC.view.frame = dataEntryListView.bounds
        dataEntryListTVC.didMove(toParentViewController: self)
        
//        //WellInfoTVC
//        self.addChildViewController(wellInfoTVC)
//        wellInfoView.addSubview(wellInfoTVC.view)
//        wellInfoTVC.view.frame = wellInfoView.bounds
//        wellInfoTVC.didMove(toParentViewController: self)
        
        
        //WellInfoNavigationController
        self.addChildViewController(wellInfoNavigationController)
        wellInfoView.addSubview(wellInfoNavigationController.view)
        wellInfoNavigationController.view.frame = wellInfoView.bounds
        wellInfoNavigationController.didMove(toParentViewController: self)
        wellInfoNavigationController.pushViewController(WellInfoTableViewController(style: .grouped), animated: false)
        
        // DataEntryNavigationController
        self.addChildViewController(dataEntryNavigationController)
        dataEntryDetailView.addSubview(dataEntryNavigationController.view)
        dataEntryNavigationController.view.frame = dataEntryDetailView.bounds
        dataEntryNavigationController.didMove(toParentViewController: self)
        dataEntryNavigationController.pushViewController(DataEntryDetailTableViewController(style: .grouped), animated: false)
    }
    
    func addViewsAsSubviews(){
        //self.view.addSubview(wellListView)
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
        let leading = NSLayoutConstraint(item: self.mapView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 8)
        let top = NSLayoutConstraint(item: self.mapView, attribute: .top, relatedBy: .equal, toItem: self.topLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 8)
        let width = NSLayoutConstraint(item: self.mapView, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: mapViewWidthProportion, constant: -8)
        let height = NSLayoutConstraint(item: self.mapView, attribute: .height, relatedBy: .equal, toItem: self.mapView, attribute: .width, multiplier: mapViewHeightProportion, constant: 0)
        self.view.addConstraints([leading, top, width, height])
    }
    
    func addConstraintsToWellInfoView(){
        self.wellInfoView.translatesAutoresizingMaskIntoConstraints = false
        let leading = NSLayoutConstraint(item: self.wellInfoView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 8)
        let top = NSLayoutConstraint(item: self.wellInfoView, attribute: .top, relatedBy: .equal, toItem: self.mapView, attribute: .bottom, multiplier: 1.0, constant: 0)
        let width = NSLayoutConstraint(item: self.wellInfoView, attribute: .width, relatedBy: .equal, toItem: self.mapView, attribute: .width, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: self.wellInfoView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: -8)
        self.view.addConstraints([leading, top, width, bottom])
        
    }
    
    func addContraintsToDataEntryListView(){
        self.dataEntryListView.translatesAutoresizingMaskIntoConstraints = false
        let leading = NSLayoutConstraint(item: self.dataEntryListView, attribute: .leading, relatedBy: .equal, toItem: self.mapView, attribute: .trailing, multiplier: 1.0, constant: 8)
        let top = NSLayoutConstraint(item: self.dataEntryListView, attribute: .top, relatedBy: .equal, toItem: self.topLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 0)
        let trailing = NSLayoutConstraint(item: self.dataEntryListView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0)
        let height = NSLayoutConstraint(item: self.dataEntryListView, attribute: .height, relatedBy: .equal, toItem: self.mapView, attribute: .height, multiplier: wellInfoHeightProportion, constant: 0)
        self.view.addConstraints([leading, top, trailing, height])
    }
    
    
    func addContraintsToDataEntryDetailView(){
        self.dataEntryDetailView.translatesAutoresizingMaskIntoConstraints = false
        let leading = NSLayoutConstraint(item: self.dataEntryDetailView, attribute: .leading, relatedBy: .equal, toItem: self.mapView, attribute: .trailing, multiplier: 1.0, constant: 8)
        let top = NSLayoutConstraint(item: self.dataEntryDetailView, attribute: .top, relatedBy: .equal, toItem: self.topLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 8)
        let trailing = NSLayoutConstraint(item: self.dataEntryDetailView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: -8)
        let bottom = NSLayoutConstraint(item: self.dataEntryDetailView, attribute: .bottom, relatedBy: .equal, toItem: self.newEntryButtonView, attribute: .top, multiplier: 1.0, constant: -8)
        self.view.addConstraints([leading, top, trailing, bottom])
        
    }

    func addConstraintsToNewEntryButton(){
        self.newEntryButtonView.translatesAutoresizingMaskIntoConstraints = false
        let leading = NSLayoutConstraint(item: self.newEntryButtonView, attribute: .leading, relatedBy: .equal, toItem: self.wellInfoView, attribute: .trailing, multiplier: 1.0, constant: 8)
        let bottom = NSLayoutConstraint(item: self.newEntryButtonView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: -8)
        let trailing = NSLayoutConstraint(item: self.newEntryButtonView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: -8)
        let height = NSLayoutConstraint(item: self.newEntryButtonView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.0, constant: newEntryButtonViewHeight)
        self.view.addConstraints([leading, bottom, trailing, height])
    }
    
    // MARK: - New Entry button
    func setUpEntryButton(){
        let newEntryButton = UIButton(type: .custom)
        newEntryButton.setTitle("Tap to add a new entry", for: .normal)
        newEntryButton.setTitleColor(UIColor.white, for: .normal)
        newEntryButton.addTarget(self, action: #selector(newEntryButtonTapped), for: .touchUpInside)
        newEntryButtonView.addSubview(newEntryButton)
        
        newEntryButton.translatesAutoresizingMaskIntoConstraints = false
        let top = NSLayoutConstraint(item: newEntryButton, attribute: .top, relatedBy: .equal, toItem: newEntryButtonView, attribute: .top, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: newEntryButton, attribute: .bottom, relatedBy: .equal, toItem: newEntryButtonView, attribute: .bottom, multiplier: 1.0, constant: 0)
        let leading = NSLayoutConstraint(item: newEntryButton, attribute: .leading, relatedBy: .equal, toItem: newEntryButtonView, attribute: .leading, multiplier: 1.0, constant: 0)
        let trailing = NSLayoutConstraint(item: newEntryButton, attribute: .trailing, relatedBy: .equal, toItem: newEntryButtonView, attribute: .trailing, multiplier: 1.0, constant: 0)
        newEntryButtonView.addConstraints([top, bottom, leading, trailing])
    }
    
    func newEntryButtonTapped(){
        print("New entry button tapped")
        let addNewTVC = AddNewEntryTableViewController(style: .grouped)
        let nc = UINavigationController(rootViewController: addNewTVC)
        nc.modalTransitionStyle = .coverVertical
        nc.modalPresentationStyle = .pageSheet
        //nc.preferredContentSize = CGSize(width: 100, height: 200)
        self.present(nc, animated: true, completion: nil)
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
