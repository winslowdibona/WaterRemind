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

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView = MKMapView(frame: .zero)
        mapView.showsUserLocation = true
        mapView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.addSubview(mapView)
        mapView <- [Left(0), Right(0), Bottom(0), Top(0)]
    }
}


extension MapViewController: MKMapViewDelegate {
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        centerOnUser()
    }
}

extension MapViewController {
    func centerOnUser() {
        let coordSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let coordRegion = MKCoordinateRegion(center: mapView.userLocation.coordinate, span: coordSpan)
        mapView.setRegion(coordRegion, animated: false)
    }
}
