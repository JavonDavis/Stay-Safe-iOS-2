//
//  Utils.swift
//  Stay Safe Jamaica
//
//  Created by Javon Davis on 7/15/17.
//  Copyright © 2017 Stay Safe Jamaica. All rights reserved.
//

import Foundation
import MapKit

func getAnnotationFromCoordinate(coordinate: CLLocationCoordinate2D) -> MKPointAnnotation {
    let lat = CLLocationDegrees(coordinate.latitude)
    let long = CLLocationDegrees(coordinate.longitude)
    
    let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
    
    let annotation = MKPointAnnotation()
    annotation.coordinate = coordinate
    
    return annotation
}

func getCoordinate(latitude: Double, longitude: Double) -> CLLocationCoordinate2D {
    let lat = CLLocationDegrees(latitude)
    let lon = CLLocationDegrees(longitude)
    return CLLocationCoordinate2DMake(lat, lon)
}

func removeAnnotations(mapView: MKMapView) {
    for _annotation in mapView.annotations {
        mapView.removeAnnotation(_annotation)
    }
}
