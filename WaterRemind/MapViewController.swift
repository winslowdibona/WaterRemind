//
//  MapViewController.swift
//  WaterRemind
//
//  Created by winslowdibona on 4/14/17.
//  Copyright © 2017 winslowdibona. All rights reserved.
//

import UIKit
import MapKit
import EasyPeasy

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    var overlayRadius: CLLocationDistance = 100
    var rendered: Bool = false
    var centered: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView = MKMapView(frame: .zero)
        mapView.showsUserLocation = true
        mapView.delegate = self
        mapView.userTrackingMode = .follow
        
        let stepper = UIStepper()
        stepper.value = 100
        stepper.stepValue = 20
        stepper.maximumValue = 1000
        stepper.minimumValue = 20
        stepper.addTarget(self, action: #selector(stepperChanged(_:)), for: UIControlEvents.valueChanged)
        
        
        let scheduleButton = UIButton(type: .system)
        scheduleButton.setTitle("Schedule", for: .normal)
        scheduleButton.addTarget(self, action: #selector(scheduleNotification), for: .touchUpInside)
        
        
        view.addSubview(mapView)
        mapView <- [Left(0), Right(0), Bottom(0), Top(0)]
        view.addSubview(stepper)
        stepper <- [Right(20), Bottom(10), Width(100), Height(44)]
        view.addSubview(scheduleButton)
        scheduleButton <- [Left(20), Bottom(10), Size(100)]
    }
    
    func stepperChanged(_ sender: UIStepper) {
        overlayRadius = sender.value as CLLocationDistance
        addOverlay()
    }
}


extension MapViewController: MKMapViewDelegate {
    
    func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
        if fullyRendered && !rendered {
            rendered = true
        }
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let circle = MKCircleRenderer(overlay: overlay)
        circle.strokeColor = UIColor.red
        circle.fillColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.1)
        circle.lineWidth = 1
        return circle
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        if rendered && !centered {
            centered = true
            centerOnUser()
        }
        addOverlay()
    }
}

extension MapViewController {
    func centerOnUser() {
        let coordSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let coordRegion = MKCoordinateRegion(center: mapView.userLocation.coordinate, span: coordSpan)
        mapView.setRegion(coordRegion, animated: false)
    }
    
    func addOverlay() {
        mapView.removeOverlays(mapView.overlays)
        let circle = MKCircle(center: mapView.userLocation.coordinate, radius: overlayRadius)
        mapView.add(circle)
    }
    
    func scheduleNotification() {
        let triggerType = NotificationTriggerType.location(coordinate: mapView.userLocation.coordinate, radius: overlayRadius)
        NotificationManager.scheduleNotification(triggerType: triggerType, title: "Test", body: "Test")
    }
}
