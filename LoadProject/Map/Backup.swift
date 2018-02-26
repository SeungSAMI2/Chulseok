////
////  TEST_MapVC.swift
////  LoadProject
////
////  Created by tigris on 2018. 1. 30..
////  Copyright © 2018년 SeungSAMI. All rights reserved.
////
//
//import UIKit
//import GoogleMaps
//import GooglePlaces
//import SwiftyJSON
//import Alamofire
//
//enum Location {
//    case startLocation
//    case destinationLocation
//}
//
//class NaviCenter: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate, GMSAutocompleteViewControllerDelegate{
//
//    let key = "AIzaSyBlCJWOyRD8MM59fQrO3Pm4LB4AnG2YwSk"
//    var locationMarker: GMSMarker!
//    var SegmentControlSwitch = true
//
//
//
//    @IBOutlet weak var googleMaps: GMSMapView!
//    @IBOutlet weak var startLocation: UITextField!
//    @IBOutlet weak var destinationLocation: UITextField!
//
//
//
//    @IBAction func MakeLocation(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
//    }
//
//    var locationManager = CLLocationManager() // 클래스 초기화
//    var locationSelected = Location.startLocation
//
//    var locationStart = CLLocation()
//    var locationEnd = CLLocation()
//
//
//    //MARK: - ViewDidLoad
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        locationManager = CLLocationManager()
//        locationManager.delegate = self
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.startUpdatingLocation()
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.startMonitoringSignificantLocationChanges()
//
//        // Map initation code
//        let camera =  GMSCameraPosition.camera(withLatitude: (self.locationManager.location?.coordinate.latitude)!, longitude: (self.locationManager.location?.coordinate.longitude)!, zoom: 12.0) // 시작 위치
//
//        self.googleMaps.camera = camera
//        self.googleMaps.delegate = self
//        self.googleMaps?.isMyLocationEnabled = true
//        self.googleMaps.settings.myLocationButton = true
//        self.googleMaps.settings.compassButton = true
//        self.googleMaps.settings.zoomGestures = true
//
//        isSlideMenuHidden = false // SlideMenu initiallize
//        transitModeInitiallize() // SlideMenu initiallize
//
//    }
//
//
//
//
//
//    // MARK: - Loaction Manager delegates
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print("Error to get location : \(error)")
//    }
//
//
//
//
//
//    // MARK: - 시작위치 검색버튼
//    @IBAction func openStartLocation(_ sender: UIButton) {
//
//        let autoCompleteController = GMSAutocompleteViewController()
//        autoCompleteController.delegate = self
//
//        // selected location
//        locationSelected = .startLocation
//
//        self.locationManager.stopUpdatingLocation()
//
//        self.present(autoCompleteController, animated: true, completion: nil)
//    }
//
//    // MARK: - 도착위치 검색버튼
//    @IBAction func openDestinationLocation(_ sender: UIButton) {
//
//        let autoCompleteController = GMSAutocompleteViewController()
//        autoCompleteController.delegate = self
//
//        // selected location
//        locationSelected = .destinationLocation
//
//        self.locationManager.stopUpdatingLocation()
//
//        self.present(autoCompleteController, animated: true, completion: nil)
//    }
//
//    // MARK: - 마커생성
//    var StartLatitude:[Any] = []
//    var StartLongitude:[Any] = []
//
//    var EndLatitude:[Any] = []
//    var EndLongitude:[Any] = []
//
//    let marker = GMSMarker()
//    let DestinationMarker = GMSMarker()
//
//
//    func createMarker(titleMarker: String, iconMarker: UIImage, latitude: CLLocationDegrees, longitude: CLLocationDegrees){ // 출발 마커 생성
//        //let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2DMake(latitude, longitude)
//        marker.title = titleMarker
//        marker.icon = iconMarker
//        marker.map = googleMaps
//
//    }
//
//
//    func deleteMarker(latitude: CLLocationDegrees, longitude: CLLocationDegrees){ // 출발 마커 삭제
//        //let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2DMake(latitude, longitude)
//        marker.map = nil
//    }
//
//
//    func DestinationCreateMarker(titleMarker: String, iconMarker: UIImage, latitude: CLLocationDegrees, longitude: CLLocationDegrees){ // 도착 마커 생성
//        DestinationMarker.position = CLLocationCoordinate2DMake(latitude, longitude)
//        DestinationMarker.title = titleMarker
//        DestinationMarker.icon = iconMarker
//        DestinationMarker.map = googleMaps
//
//    }
//
//    func DestinationDeleteMarker(latitude: CLLocationDegrees, longitude: CLLocationDegrees){ // 도착 마커 삭제
//        //        let marker = GMSMarker()
//        DestinationMarker.position = CLLocationCoordinate2DMake(latitude, longitude)
//        DestinationMarker.map = nil
//    }
//
//
//    @IBOutlet weak var seg: UISegmentedControl!
//    @IBAction func IndexChanged(_ sender: UISegmentedControl) { // 출발,도착 Mode
//        if seg.selectedSegmentIndex == 0{
//            SegmentControlSwitch = true
//            print("출발Mode")
//        } else {
//            SegmentControlSwitch = false
//            print("도착Mode")
//        }
//
//    }
//
//
//    // MARK: - 현재위치눌렀을때 마커표시
//    @IBAction func MyLocationButton(_ sender: Any) { // 현재위치 버튼
//        locationManager.delegate = self
//        locationManager.requestWhenInUseAuthorization()
//        let MyLatitude = (self.locationManager.location?.coordinate.latitude)!
//        let MyLongitude = (self.locationManager.location?.coordinate.longitude)!
//
//        transitModeInitiallize()
//
//        if SegmentControlSwitch == true{
//
//            if StartLatitude.isEmpty{
//                StartLatitude.insert(MyLatitude, at: 0)
//                StartLongitude.insert(MyLongitude, at: 0)
//            } else{
//                StartLatitude[0] = MyLatitude
//                StartLongitude[0] = MyLongitude
//
//            }
//            createMarker(titleMarker: "출발지점", iconMarker: #imageLiteral(resourceName: "StartIcon") , latitude: StartLatitude[0] as! CLLocationDegrees, longitude: StartLongitude[0] as! CLLocationDegrees)
//            removePolyline()
//
//            popStartName()
//            print("Mylatitude: \(MyLatitude) &&& MyLongtitude: \(MyLongitude)") // when you tapped coordinate
//        } else {
//
//            if EndLatitude.isEmpty{
//                EndLatitude.insert(MyLatitude, at: 0)
//                EndLongitude.insert(MyLongitude, at: 0)
//            } else{
//                EndLatitude[0] = MyLatitude
//                EndLongitude[0] = MyLongitude
//
//            }
//
//            DestinationCreateMarker(titleMarker: "도착지점", iconMarker: #imageLiteral(resourceName: "DestinationIcon") , latitude: EndLatitude[0] as! CLLocationDegrees, longitude: EndLongitude[0] as! CLLocationDegrees)
//            removePolyline()
//            popEndName()
//            print("Mylatitude: \(MyLatitude) &&& MyLongtitude: \(MyLongitude)") // when you tapped coordinate
//
//        }
//    }
//
//
//    // MARK: - 지도를 터치했을때 마커표시
//    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
//        // 지도를 터치하였을때의 반응
//
//
//
//        if sideMenu.constant == 0{
//            transitModeInitiallize()
//        }else{
//            if SegmentControlSwitch == true{
//
//                if StartLatitude.isEmpty{
//                    StartLatitude.insert(coordinate.latitude, at: 0)
//                    StartLongitude.insert(coordinate.longitude, at: 0)
//                } else{
//                    StartLatitude[0] = coordinate.latitude
//                    StartLongitude[0] = coordinate.longitude
//
//                }
//
//                createMarker(titleMarker: "출발지점", iconMarker: #imageLiteral(resourceName: "StartIcon") , latitude: StartLatitude[0] as! CLLocationDegrees, longitude: StartLongitude[0] as! CLLocationDegrees)
//                removePolyline()
//
//                let camera =  GMSCameraPosition.camera(withLatitude: StartLatitude[0] as! CLLocationDegrees, longitude: StartLongitude[0] as! CLLocationDegrees, zoom: 12.0)
//                self.googleMaps.animate(to: camera)
//                self.googleMaps.delegate = self
//
//                popStartName()
//            } else {
//
//                if EndLatitude.isEmpty{
//                    EndLatitude.insert(coordinate.latitude, at: 0)
//                    EndLongitude.insert(coordinate.longitude, at: 0)
//                } else{
//                    EndLatitude[0] = coordinate.latitude
//                    EndLongitude[0] = coordinate.longitude
//
//                }
//
//                DestinationCreateMarker(titleMarker: "도착지점", iconMarker: #imageLiteral(resourceName: "DestinationIcon") , latitude: EndLatitude[0] as! CLLocationDegrees, longitude: EndLongitude[0] as! CLLocationDegrees)
//                removePolyline()
//
//                let camera =  GMSCameraPosition.camera(withLatitude: EndLatitude[0] as! CLLocationDegrees, longitude: EndLongitude[0] as! CLLocationDegrees, zoom: 12.0)
//                self.googleMaps.animate(to: camera)
//                self.googleMaps.delegate = self
//
//                popEndName()
//            }
//        }
//
//    }
//
//
//
//
//    // MARK: - GMSAutocompeteViewController delegate
//    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
//        // 사용 가능한 자동 완성 예상 검색어에서 장소를 선택하면 호출됩니다.
//        // Change map location
//
//        let camera = GMSCameraPosition.camera(withLatitude: place.coordinate.latitude, longitude: place.coordinate.longitude, zoom: 12.0) // 검색이후 검색한 위치로 이동
//
//
//
//        // set coordinate to text
//        if locationSelected == .startLocation {
//            //            startLocation.text = "\(place.coordinate.latitude), \(place.coordinate.longitude)"
//            locationStart = CLLocation(latitude: place.coordinate.latitude, longitude: place.coordinate.longitude)
//
//            if StartLatitude.isEmpty{
//            } else {
//                deleteMarker(latitude: StartLatitude[0] as! CLLocationDegrees, longitude: StartLongitude[0] as! CLLocationDegrees)
//                StartLatitude.removeAll()
//                StartLongitude.removeAll()
//            }
//
//            createMarker(titleMarker: "출발지점", iconMarker: #imageLiteral(resourceName: "StartIcon") , latitude: place.coordinate.latitude, longitude: place.coordinate.longitude)
//
//            StartLatitude.insert(place.coordinate.latitude, at: 0)
//            StartLongitude.insert(place.coordinate.longitude, at: 0)
//            popStartName()
//            removePolyline()
//        } else {
//            //            destinationLocation.text = "\(place.coordinate.latitude), \(place.coordinate.longitude)"
//            locationEnd = CLLocation(latitude: place.coordinate.latitude, longitude: place.coordinate.longitude)
//
//            if EndLatitude.isEmpty{
//            } else {
//                DestinationDeleteMarker(latitude: EndLatitude[0] as! CLLocationDegrees, longitude: EndLongitude[0] as! CLLocationDegrees)
//                EndLatitude.removeAll()
//                EndLongitude.removeAll()
//            }
//
//            DestinationCreateMarker(titleMarker: "도착지점", iconMarker: #imageLiteral(resourceName: "DestinationIcon") , latitude: place.coordinate.latitude, longitude: place.coordinate.longitude)
//
//            EndLatitude.insert(place.coordinate.latitude, at: 0)
//            EndLongitude.insert(place.coordinate.longitude, at: 0)
//            popEndName()
//            removePolyline()
//        }
//
//        self.googleMaps.camera = camera
//        self.dismiss(animated: true, completion: nil)
//    }
//
//    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
//        print("Error \(error)")
//        // 자동 완성 예상 검색어 또는 장소 세부 정보를 검색 할 때 재 시도 할 수없는 오류가 발생하면 호출됩니다.
//    }
//
//    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
//        // 사용자가 GMSAutocompleteViewController의 [Cancel] 버튼을 누를 때 호출됩니다.
//        self.dismiss(animated: true, completion: nil)
//    }
//
//    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
//        // 자동 완성 예상 요청이 발생한 직후에 한 번 호출됩니다.
//        UIApplication.shared.isNetworkActivityIndicatorVisible = true
//    }
//
//    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
//        // 새로운 자동 완성 예측이 수신 될 때마다 한 번 호출됩니다.
//        UIApplication.shared.isNetworkActivityIndicatorVisible = false
//    }
//    // GMSAutocompeteViewController delegate END
//
//
//    //MARK: - 좌표이름표시
//    func popStartName(){
//
//        let popCoordinate = "\(StartLatitude[0]),\(StartLongitude[0])"
//
//        print(popCoordinate)
//        let url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=\(popCoordinate)&key=\(key)"
//
//        Alamofire.request(url, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
//            if let json = try? JSON(data: response.data!){
//                let startAddress = json["results"][0]["formatted_address"].stringValue
//                self.startLocation.text = startAddress
//
//            } else{
//                print("Error")
//            }
//        }
//    }
//
//    func popEndName(){
//
//        let popCoordinate = "\(EndLatitude[0]),\(EndLongitude[0])"
//
//        print(popCoordinate)
//        let url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=\(popCoordinate)&key=\(key)"
//
//        Alamofire.request(url, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
//            if let json = try? JSON(data: response.data!){
//                let endAddress = json["results"][0]["formatted_address"].stringValue
//                self.destinationLocation.text = endAddress
//
//            } else{
//                print("Error")
//            }
//        }
//    }
//
//
//
//    //MARK: - 시간파싱
//    var Momo = 1
//    @IBAction func TestButton(_ sender: UIButton) {
//        let timeInterval = NSDate().timeIntervalSince1970
//        print(timeInterval)
//        let timeInterval2 = NSDate().timeIntervalSinceNow
//        print(timeInterval2)
//
//
//    }
//
//
//    //MARK: - 폴리라인 그리기
//    func drawPath(startLocation: CLLocation, endLocation: CLLocation)
//    {
//
//        if StartLatitude.isEmpty && EndLatitude.isEmpty{
//            print("시작점,도착점 미입력")
//        }
//        else if StartLatitude.isEmpty{
//            print("시작점 미입력")
//        }
//        else if EndLatitude.isEmpty{
//            print("도착점 미입력")
//        }
//        else{
//
//
//            print("시작 좌표 \(StartLatitude[0]),\(StartLongitude[0])")
//            print("도착 좌표 \(EndLatitude[0]),\(EndLongitude[0])")
//            let origin = "\(StartLatitude[0]),\(StartLongitude[0])"
//            let destination = "\(EndLatitude[0]),\(EndLongitude[0])"
//            var transitMode = ""
//            let receiveTransitMode = transitNum()
//            var mode = ""
//
//
//            switch receiveTransitMode{
//            case 1:
//                mode = "transit"
//                transitMode = "bus"
//            case 2:
//                mode = "transit"
//                transitMode = "subway"
//            case 3:
//                mode = "driving"
//                transitMode = ""
//            default:
//                transitMode = "Error"
//            }
//            print(mode)
//            print(transitMode)
//
//            let url = "https://maps.googleapis.com/maps/api/directions/json?origin=\(origin)&destination=\(destination)&avoid=highways&mode=\(mode)&transit_mode=\(transitMode)&alternatives=true&key=\(key)"
//
//            Alamofire.request(url, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
//                if let json = try? JSON(data: response.data!){
//                    //                print("JSON data 출력")
//                    //                print(json)
//                    let routes = json["routes"].arrayValue
//
//                    var routeOverviewPolyline = routes[0]["overview_polyline"].dictionary
//
//                    routeOverviewPolyline = routes[0]["overview_polyline"].dictionary
//                    var points = routeOverviewPolyline?["points"]?.stringValue
//                    self.drawPolySub(points: points!)
//
//                    routeOverviewPolyline = routes[1]["overview_polyline"].dictionary
//                    points = routeOverviewPolyline?["points"]?.stringValue
//                    self.drawPolySub(points: points!)
//
//                    routeOverviewPolyline = routes[2]["overview_polyline"].dictionary
//                    points = routeOverviewPolyline?["points"]?.stringValue
//                    self.drawPolySub(points: points!)
//
//                    if let routeOverviewPolyline = routes[3]["overview_polyline"].dictionary{
//                        points = routeOverviewPolyline["points"]?.stringValue
//                        self.drawPolySub(points: points!)} else{
//
//                    }
//
//                } else{
//                    print("Error")
//                }
//            }
//        }
//    }
//
//    func drawPolySub( points : String){
//        let path = GMSPath.init(fromEncodedPath: points)
//        let polyline = GMSPolyline.init(path: path)
//        polyline.strokeWidth = 3
//        polyline.geodesic = true
//        let redBlue = GMSStrokeStyle.gradient(from: .red, to: .blue)
//        polyline.spans = [GMSStyleSpan(style: redBlue)]
//        polyline.map = self.googleMaps
//
//
//    }
//
//
//    @IBAction func ShowDirenction(_ sender: Any) {
//        removePolyline()
//        self.drawPath(startLocation: locationStart, endLocation: locationEnd)
//        transitModeInitiallize()
//
//    }
//
//
//    //MARK: - 표시된 경로 삭제
//    func removePolyline(){
//        googleMaps.clear()
//        if StartLatitude.isEmpty && EndLatitude.isEmpty{
//
//        } else if StartLatitude.isEmpty{
//            DestinationCreateMarker(titleMarker: "도착지점", iconMarker: #imageLiteral(resourceName: "DestinationIcon") , latitude: EndLatitude[0] as! CLLocationDegrees, longitude: EndLongitude[0] as! CLLocationDegrees)
//        } else if EndLatitude.isEmpty{
//            createMarker(titleMarker: "출발지점", iconMarker: #imageLiteral(resourceName: "StartIcon") , latitude: StartLatitude[0] as! CLLocationDegrees, longitude: StartLongitude[0] as! CLLocationDegrees)
//        } else{
//            createMarker(titleMarker: "출발지점", iconMarker: #imageLiteral(resourceName: "StartIcon") , latitude: StartLatitude[0] as! CLLocationDegrees, longitude: StartLongitude[0] as! CLLocationDegrees)
//            DestinationCreateMarker(titleMarker: "도착지점", iconMarker: #imageLiteral(resourceName: "DestinationIcon") , latitude: EndLatitude[0] as! CLLocationDegrees, longitude: EndLongitude[0] as! CLLocationDegrees)
//        }
//
//    }
//
//
//    //MARK: - 교통수단선택
//    var isSlideMenuHidden = true
//
//    @IBOutlet weak var sideMenu: NSLayoutConstraint!
//
//    @IBOutlet weak var sideMenuMain: UIView!
//
//
//    @IBAction func transitMode(_ sender: UIButton) {
//        if isSlideMenuHidden {
//            sideMenu.constant = 0
//            UIView.animate(withDuration: 0.3, animations: {
//                self.view.layoutIfNeeded()
//            })
//        } else {
//            sideMenu.constant = -150
//            UIView.animate(withDuration: 0.3, animations: {
//                self.view.layoutIfNeeded()
//                print("현재 저장된 번호")
//                print(UserDefaults.standard.integer(forKey: "TransitMode"))
//            })
//        }
//        isSlideMenuHidden = !isSlideMenuHidden
//    }
//
//
//    func transitModeInitiallize(){ // 사이드바 초기화
//        if sideMenu.constant == -150{
//            isSlideMenuHidden = true
//        } else {
//            sideMenu.constant = -150
//            UIView.animate(withDuration: 0.1, animations: {
//                self.view.layoutIfNeeded()
//            })
//            isSlideMenuHidden = !isSlideMenuHidden
//        }
//    }
//
//
//
//
//    func transitNum() -> Int{
//        let transitNum = UserDefaults.standard.integer(forKey: "TransitMode")
//        return transitNum
//    }
//
//}
//
//
//var arrayData = json["history"]["dailysummary"][0]["stuff"].
//arrayData is a dictionary.




//    //MARK: - 경로종류탐색
//    var isRouteKindMenuHidden = true
//
//
//    @IBOutlet weak var routeMenu: NSLayoutConstraint!
//    @IBOutlet weak var routeMenuMain: UIView!
//
//    @IBAction func RouteKind(_ sender: UIButton) {
//        if isRouteKindMenuHidden {
//            routeMenu.constant = 0
//            UIView.animate(withDuration: 0.3, animations: {
//                self.view.layoutIfNeeded()
//            })
//        } else {
//            routeMenu.constant = -227
//            UIView.animate(withDuration: 0.3, animations: {
//                self.view.layoutIfNeeded()
//            })
//        }
//        isRouteKindMenuHidden = !isRouteKindMenuHidden
//    }
//
//
//    func routeMenuInitiallize(){ // 사이드바 초기화
//        if routeMenu.constant == -227{
//            isRouteKindMenuHidden = true
//        } else {
//            routeMenu.constant = -227
//            UIView.animate(withDuration: 0.1, animations: {
//                self.view.layoutIfNeeded()
//            })
//            isRouteKindMenuHidden = !isRouteKindMenuHidden
//        }
//    }


