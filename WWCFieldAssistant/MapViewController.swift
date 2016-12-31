//
//  MapViewController.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 12/29/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    let mapView = MKMapView()
    var selectedDistrict: District? {
        didSet{
            drawWellsInDistrict()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 37/255.0, green: 137/255.0, blue: 189/255.0, alpha: 1)

        configureMapView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateDistrict(notification:)), name: Notification.Name(rawValue: "SelectedDistrictUpdated"), object: nil)
        // Do any additional setup after loading the view.
    }
    
    func updateDistrict(notification: Notification) {
        guard let newDistrict = notification.object as? District else { return }
        self.selectedDistrict = newDistrict
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("Annotation tapped")
        guard let selectedAnnotation = view.annotation as? WellAnnotation else { return }
        let selectedWell = selectedAnnotation.well
        
        let notification = Notification(name: Notification.Name(rawValue: "MapViewUpdatedWell"), object: selectedWell, userInfo: nil)
        NotificationCenter.default.post(notification)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let view = MKAnnotationView(annotation: annotation, reuseIdentifier: nil)
        view.canShowCallout = true
        view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        return nil
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("Call out tapped")
    }
}
