//
//  MapViewController.swift
//  LoadProject
//
//  Created by tigris on 2018. 1. 22..
//  Copyright © 2018년 SeungSAMI. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps
import GooglePlacePicker
import CoreLocation

class MapViewController: UIViewController,GMSMapViewDelegate,CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    var mapView: GMSMapView!
    let coordinate = CLLocationCoordinate2D()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self

        locationManager.requestWhenInUseAuthorization()
    
        
        
        
        
        self.locationManager.startUpdatingLocation()
        let camera = GMSCameraPosition.camera(withLatitude: (self.locationManager.location?.coordinate.latitude)!, longitude: (self.locationManager.location?.coordinate.longitude)!, zoom: 15.0)
        
        
        
       
        
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)

        //MARK: -접근성 허용
        mapView.isMyLocationEnabled = true // 자신의 위치 표시
        mapView.settings.myLocationButton = true // 자신의 위치로 이동
        //END: -접근성 허용
        
        if let mylocation = mapView.myLocation {
            print("User's location: \(mylocation)")
        } else {
            print("User's location is unknown")
        }
        
 
        
        self.view = mapView
        mapView.delegate = self // 이게 있어야 tab좌표 나옴
        
        
       
        
    } // ViewDidLoad End
    
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) { // Tab하는 좌표 가져오기
        print("You tapped at \(coordinate.latitude), \(coordinate.longitude)")
    } // func mapView End
    
} // Class End



