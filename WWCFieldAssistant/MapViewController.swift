//
//  MapViewController.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 12/29/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import UIKit
import MapKit

protocol ExpandableMapDelegate: class {
    func adjustMapView()
    var isExpanded: Bool {get}
}

class MapViewController: UIViewController {

    let mapView = MKMapView()
    var selectedDistrict: District? {
        didSet{
            drawWellsInDistrict()
        }
    }
    
    /// This variable indicates when a well is selected from another view rather than from a user tap on the annotation
    var notifiedFromExternal: Bool = false
    
    weak var expandableMapDelegate: ExpandableMapDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 37/255.0, green: 137/255.0, blue: 189/255.0, alpha: 1)

        configureMapView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateDistrict(notification:)), name: Notification.Name(rawValue: "SelectedDistrictUpdated"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateWell(notification:)), name: Notification.Name(rawValue: "SelectedWellUpdated"), object: nil)
        // Do any additional setup after loading the view.
    }
    
    func updateDistrict(notification: Notification) {
        guard let newDistrict = notification.object as? District else { return }
        self.selectedDistrict = newDistrict
    }
    
    func updateWell(notification: Notification){
        guard let newWell = notification.object as? Well else { return }
        self.notifiedFromExternal = true
        guard let annotation = findAnnotationFor(selectedWell: newWell) else { return }
        mapView.selectAnnotation(annotation, animated: true)
    }

    func findAnnotationFor(selectedWell: Well) -> MKAnnotation? {
        let wells = self.selectedDistrict?.wells.flatMap{$0 as? Well }
        let index = wells!.index(of: selectedWell)
        
        return mapView.annotations[index!]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func drawWellsInDistrict(){
        guard let selectedDistrict = self.selectedDistrict else { return }
        // remove old annotations
        mapView.removeAnnotations(mapView.annotations)
        // Add new annotations
        let newAnnotations = MockDataController.mockMapAnnotations(district: selectedDistrict)
        mapView.addAnnotations(newAnnotations)
        
    }
    // MARK: - Initial Configuration of map
    
    func configureMapView(){
        mapView.delegate = self
        self.view.addSubview(mapView)
        addConstraintsToMapView()
        mapView.mapType = .satellite
        mapView.isZoomEnabled = true
        mapView.showsCompass = true
        let center = CLLocationCoordinate2D(latitude: 43.4917, longitude: -112.0340)
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        mapView.region = MKCoordinateRegion(center: center, span: span)
    }

    func addConstraintsToMapView(){
        mapView.translatesAutoresizingMaskIntoConstraints = false
        let top = NSLayoutConstraint(item: mapView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0)
        let leading = NSLayoutConstraint(item: mapView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0)
        let trailing = NSLayoutConstraint(item: mapView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: mapView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0)
        self.view.addConstraints([top, leading, trailing, bottom])
    }

    func toggleExpandableMapButtonTapped(){
        guard let delegate = expandableMapDelegate else { return }
        if delegate.isExpanded{
            delegate.adjustMapView()
        }
    }

}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("Annotation tapped")
        UIView.animate(withDuration: 0.21, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 8.0, options: .curveLinear, animations: {view.image = #imageLiteral(resourceName: "AnnotationLarge")}, completion: nil)
        
        if !self.notifiedFromExternal { // User tapped on map annotation, notify other views of change
            guard let selectedAnnotation = view.annotation as? WellAnnotation else { return }
            let selectedWell = selectedAnnotation.well
            
            let notification = Notification(name: Notification.Name(rawValue: "MapViewUpdatedWell"), object: selectedWell, userInfo: nil)
            NotificationCenter.default.post(notification)
            self.notifiedFromExternal = false
        } else { // User selected well from other view; no further notification
            self.notifiedFromExternal = false
        }
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 2.0, options: .curveEaseInOut, animations: {view.image = #imageLiteral(resourceName: "AnnotationSmall")}, completion: nil)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation { // Return blue dot for the user's location
            return nil
        }
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: nil)
        annotationView.canShowCallout = true
        
        let button = UIButton(type: .contactAdd)
        button.tintColor = UIColor.blue
        annotationView.rightCalloutAccessoryView = button
        
        annotationView.image = #imageLiteral(resourceName: "AnnotationSmall")
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("Call out tapped")
        toggleExpandableMapButtonTapped()
    }
}
