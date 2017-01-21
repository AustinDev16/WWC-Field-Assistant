//
//  DistrictMainViewController.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 12/14/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import UIKit

class DistrictMainViewController: UIViewController {
    
    // MARK: - Model Interface
    var district: District? {
        didSet{
            let notification = Notification(name: Notification.Name(rawValue: "SelectedDistrictUpdated"), object: self.district, userInfo: nil)
            NotificationCenter.default.post(notification)
            self.selectedWell = nil // reset for all child views
        }
    }
    var selectedWell: Well? {
        didSet {
           let notification = Notification(name: Notification.Name(rawValue: "SelectedWellUpdated"), object: self.selectedWell, userInfo: nil)
            NotificationCenter.default.post(notification)
        }
    }
    
    // MARK: - View
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 37/255.0, green: 137/255.0, blue: 189/255.0, alpha: 0.5)// UIColor.darkGray
        setUpChildViews()
        loadViewControllers()
        setUpNavigationBar()
        
        // for testing
       // newEntryButtonTapped()
        NotificationCenter.default.addObserver(self, selector: #selector(mapViewUpdatedWellWith(notification:)), name: Notification.Name(rawValue:"MapViewUpdatedWell"), object: nil)
        

    }
    
    func mapViewUpdatedWellWith(notification: Notification){
        guard let updatedWell = notification.object as? Well else { return }
        self.selectedWell = updatedWell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let district = AppDataController.shared.districts[1]
        updateViewControllerWith(district: district)
    }
    
    func setUpNavigationBar(){
        //self.navigationItem.titleView = returnTitleView()
        self.title = self.district?.name ?? "Please select a district"
        self.navigationController?.navigationBar.isTranslucent = false//true

        
        // Bar buttons
        let district = UIBarButtonItem(title: "Districts", style: .plain, target: self, action: #selector(districtsButtonTapped))
        district.tag = 10
        let employees = UIBarButtonItem(title: "Employees", style: .plain, target: self, action: #selector(logoutButtonTapped))
        employees.tag = 20
        //let settings = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: nil)
        let sync = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(syncButtonTapped))
        let folders = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: nil)
        let camera = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(cameraButtonTapped))
        camera.tag = 30
        self.navigationItem.leftBarButtonItems = [district, employees]//, settings]
        self.navigationItem.rightBarButtonItems = [sync, camera, folders]
        
    }
    
    func returnTitleView() -> UIButton {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(titleButtonTapped), for: .touchUpInside)
        let title = self.district?.name ?? "Tap to select a district"
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitleColor(UIColor.gray, for: .selected)
        return button
    }
    
    func updateViewControllerWith(district: District){
        self.district = district
        setUpNavigationBar()
        
        // Pass district on to well info view
        wellListTVC.updateViewControllerWith(selectedDistrict: district)
    }
    
    func updateViewControllerWith(selectedWell: Well){
        self.selectedWell = selectedWell
    }
    
    // MARK: - Navigation bar actions
    
    func districtsButtonTapped(){
        let districtsPopoverController = DistrictsTableViewController()
        districtsPopoverController.selectedDistrict = self.district
        districtsPopoverController.updateSelectedDistrictDelegate = self
        districtsPopoverController.modalPresentationStyle = .popover
        districtsPopoverController.preferredContentSize = CGSize(width: 350, height: 300)
        present(districtsPopoverController, animated: true, completion: nil)
        
        let presentationController = districtsPopoverController.popoverPresentationController
        //presentationController?.delegate = self
        presentationController?.permittedArrowDirections = [.up]
        let barButton = self.navigationItem.leftBarButtonItems?.filter{$0.tag == 10}.first
        presentationController?.barButtonItem = barButton
    }
    
    func logoutButtonTapped(){
        let usersPopoverController = UsersTableViewController()
        usersPopoverController.loggedInUser = AppDataController.shared.loggedInUser
        usersPopoverController.updateLoggedInUserDelegate = AppDataController.shared
        usersPopoverController.modalPresentationStyle = .popover
        usersPopoverController.preferredContentSize = CGSize(width: 200, height: 300)
        present(usersPopoverController, animated: true, completion: nil)
        
        let presentationController = usersPopoverController.popoverPresentationController
        presentationController?.permittedArrowDirections = [.any]
        guard let barButtons = self.navigationItem.leftBarButtonItems
             else { return }
        let logout = barButtons.filter{ $0.tag == 20 }.first
        presentationController?.barButtonItem = logout
    }
    
    func syncButtonTapped(){
        print("syncButtonTapped")
        
    }
    
    
    func titleButtonTapped(){
        let districtsPopoverController = DistrictsTableViewController()
        districtsPopoverController.selectedDistrict = self.district
        districtsPopoverController.updateSelectedDistrictDelegate = self
        districtsPopoverController.modalPresentationStyle = .popover
        districtsPopoverController.preferredContentSize = CGSize(width: 350, height: 300)
        present(districtsPopoverController, animated: true, completion: nil)
        
        let presentationController = districtsPopoverController.popoverPresentationController
        presentationController?.permittedArrowDirections = [.up]
        presentationController?.sourceView = self.navigationItem.titleView
        let width = self.navigationItem.titleView?.frame.width ?? 0
        presentationController?.sourceRect = CGRect(x: width/2.0, y: 15, width: 1, height: 1)
    }
    
    func cameraButtonTapped(){
        if self.selectedWell != nil {
            let vc = AddNewFieldPhotoViewController()
            vc.selectedWell = self.selectedWell
            let nc = UINavigationController(rootViewController: vc)
            nc.modalPresentationStyle = .pageSheet
            present(nc, animated: true, completion: nil)
        } else {
            let vc = NoWellAvailableViewController()
            vc.modalPresentationStyle = .popover
            present(vc, animated: true, completion: nil)
            let presentationController = vc.popoverPresentationController
            presentationController?.permittedArrowDirections = [.up]
            let barButton = self.navigationItem.rightBarButtonItems?.filter{$0.tag == 30}.first
            presentationController?.barButtonItem = barButton
        }
    }
    
    // MARK: - Child Views
    
    // StackViews
    let fullScreenStackView = UIStackView()
    let leftPanelStackView = UIStackView()
    let rightPanelStackView = UIStackView()
    
    //let wellListView: UIView = UIView()
    let mapView: UIView = UIView()
    let wellInfoView: UIView = UIView()
    let dataEntryDetailView: UIView = UIView()
    let newEntryButtonView: UIView = UIView()
    
    // Proportions
    let newEntryButtonViewHeight: CGFloat = 50
    
    // MARK: - View Controllers
    
    lazy var mapViewController: MapViewController = {
        let viewController = MapViewController()
        viewController.expandableMapDelegate = self
        return viewController
    }()
    
    lazy var wellListTVC: WellListTableViewController = {
       let viewController = WellListTableViewController()
        viewController.updateSelectedWellDelegate = self
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
       let nc = UINavigationController(rootViewController: self.wellSummaryTVC)
        return nc 
    }()
    
    lazy var wellSummaryTVC: WellSummaryTableViewController = {
        let viewController = WellSummaryTableViewController(style: .grouped)
        return viewController
    }()
    
    /// Adds subviews and corresponding constraints.
    func setUpChildViews(){
        configureStackViews()
        newEntryButtonView.backgroundColor = UIColor(red: 38/255.0, green: 145/255.0, blue: 15/255.0, alpha: 1.0)
        setUpEntryButton()
    }
    
    func configureStackViews(){
        self.view.addSubview(fullScreenStackView)
        self.view.addSubview(leftPanelStackView)
        self.view.addSubview(rightPanelStackView)
        
        addConstraintsToFullScreenStackView()
        setUpLeftPanelStackView()
        setUpRightPanelStackView()
    }
    
    func addConstraintsToFullScreenStackView(){
        fullScreenStackView.translatesAutoresizingMaskIntoConstraints = false
        fullScreenStackView.alignment = .fill
        fullScreenStackView.axis = .horizontal
        fullScreenStackView.distribution = .fillEqually // Splits the view equally in half
        fullScreenStackView.spacing = 8
        
        let leading = NSLayoutConstraint(item: fullScreenStackView,
                                         attribute: .leading,
                                         relatedBy: .equal,
                                         toItem: self.view,
                                         attribute: .leading,
                                         multiplier: 1.0,
                                         constant: 8)
        let top = NSLayoutConstraint(item: fullScreenStackView,
                                     attribute: .top,
                                     relatedBy: .equal,
                                     toItem: self.topLayoutGuide,
                                     attribute: .bottom,
                                     multiplier: 1.0,
                                     constant: 8)
        let trailing = NSLayoutConstraint(item: fullScreenStackView,
                                          attribute: .trailing,
                                          relatedBy: .equal,
                                          toItem: self.view,
                                          attribute: .trailing,
                                          multiplier: 1.0,
                                          constant: -8)
        let bottom = NSLayoutConstraint(item: fullScreenStackView,
                                        attribute: .bottom,
                                        relatedBy: .equal,
                                        toItem: self.view,
                                        attribute: .bottom,
                                        multiplier: 1.0,
                                        constant: -8)
        self.view.addConstraints([leading, top, trailing, bottom])
        
        fullScreenStackView.addArrangedSubview(leftPanelStackView)
        fullScreenStackView.addArrangedSubview(rightPanelStackView)
    }
    
    func setUpLeftPanelStackView(){
        leftPanelStackView.addArrangedSubview(mapView)
        leftPanelStackView.addArrangedSubview(wellInfoView)
        leftPanelStackView.axis = .vertical
        leftPanelStackView.alignment = .fill
        leftPanelStackView.distribution = .fillEqually
        leftPanelStackView.spacing = 8
        
        // Map view
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        
        // Well info view
        wellInfoView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setUpRightPanelStackView(){
        rightPanelStackView.addArrangedSubview(dataEntryDetailView)
        rightPanelStackView.addArrangedSubview(newEntryButtonView)
        rightPanelStackView.axis = .vertical
        rightPanelStackView.alignment = .fill
        rightPanelStackView.distribution = .fill
        rightPanelStackView.spacing = 8
        
        // DataEntry
        dataEntryDetailView.translatesAutoresizingMaskIntoConstraints = false
        
        // NewEntry Button
        newEntryButtonView.translatesAutoresizingMaskIntoConstraints = false
        let buttonHeight = NSLayoutConstraint(item: newEntryButtonView,
                                              attribute: .height,
                                              relatedBy: .equal,
                                              toItem: rightPanelStackView,
                                              attribute: .height,
                                              multiplier: 0.0,
                                              constant: newEntryButtonViewHeight)
        rightPanelStackView.addConstraint(buttonHeight)
    }
    
    /// Instantiates view controllers and assigns their view to the child views.
    func loadViewControllers(){

        // MapView
        self.addChildViewController(mapViewController)
        mapView.addSubview(mapViewController.view)
        mapViewController.view.frame = mapView.bounds
        mapViewController.didMove(toParentViewController: self)
        
        //WellInfoNavigationController
        self.addChildViewController(wellInfoNavigationController)
        wellInfoView.addSubview(wellInfoNavigationController.view)
        wellInfoNavigationController.view.frame = wellInfoView.bounds
        wellInfoNavigationController.didMove(toParentViewController: self)
        wellInfoNavigationController.navigationBar.isTranslucent = false
        
        // DataEntryNavigationController
        self.addChildViewController(dataEntryNavigationController)
        dataEntryDetailView.addSubview(dataEntryNavigationController.view)
        dataEntryNavigationController.view.frame = dataEntryDetailView.bounds
        dataEntryNavigationController.didMove(toParentViewController: self)
        dataEntryNavigationController.navigationBar.isTranslucent = false
    }
    
    // MARK: - New Entry button
    func setUpEntryButton(){
        let newEntryButton = UIButton(type: .roundedRect)
        newEntryButton.setTitle("Tap to add a new entry", for: .normal)
        newEntryButton.setTitleColor(UIColor.white, for: .normal)
        newEntryButton.setTitleColor(UIColor.lightGray, for: .selected)
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
        if self.selectedWell != nil {
            let addNewTVC = AddNewEntryTableViewController(style: .grouped)
            let nc = UINavigationController(rootViewController: addNewTVC)
            nc.modalTransitionStyle = .coverVertical
            nc.modalPresentationStyle = .pageSheet
            self.present(nc, animated: true, completion: nil)
        } else {
            let vc = NoWellAvailableViewController()
            vc.modalPresentationStyle = .popover
            present(vc, animated: true, completion: nil)
            let presentationController = vc.popoverPresentationController
            presentationController?.permittedArrowDirections = [.down]
            presentationController?.sourceView = newEntryButtonView
            presentationController?.sourceRect = CGRect(x: Double(newEntryButtonView.frame.width/2), y: 16, width: 1, height: 1)
        }
    }
}

extension DistrictMainViewController: DistrictUpdateDelegate {
    func updateSelectedDistrict(district: District) {
        updateViewControllerWith(district: district)
    }
}

extension DistrictMainViewController: WellUpdateDelegate {
    func updateSelectedWell(selectedWell: Well) {
        self.selectedWell = selectedWell
    }
}

extension DistrictMainViewController: ExpandableMapDelegate {
    func adjustMapView(){
        if self.rightPanelStackView.isHidden == false {
            UIView.animate(withDuration: 0.8, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 2.0, options: .curveEaseInOut, animations: {
                self.rightPanelStackView.isHidden = true
                self.wellInfoView.isHidden = true
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
                self.wellInfoView.isHidden = false
                self.rightPanelStackView.isHidden = false
            }, completion: nil)
        }
        
    }
    
    var isExpanded: Bool {
        return self.rightPanelStackView.isHidden
    }
}
