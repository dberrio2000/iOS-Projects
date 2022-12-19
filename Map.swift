//
//  Map.swift
//  ShowSelectorProject
//
//  Created by Darion Berrios on 12/10/22.
//

import Foundation
import UIKit
import SwiftUI
import MapKit
import CoreLocation
class MapView: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mapView)
        mapView.frame = view.bounds
        map()
    }
    
    @IBOutlet weak var mapView: MKMapView!
    
    func map(){
        let lat:CLLocationDegrees = 38.8315
        let long:CLLocationDegrees = 77.3117
        
        let regionDistance:CLLocationDistance = 1000
        
    }
    
}

