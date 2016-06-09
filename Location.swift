//
//  Location.swift
//  DudeWheresMyCar
//
//  Created by Oliver Short on 5/16/16.
//  Copyright © 2016 Oliver Short. All rights reserved.
//

import UIKit
import MapKit

class Location: NSObject, MKAnnotation, NSCoding {
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let latitude = aDecoder.decodeObjectForKey("latitude") as? CLLocationDegrees,
            let longitude = aDecoder.decodeObjectForKey("longitude") as? CLLocationDegrees,
            let title = aDecoder.decodeObjectForKey("title") as? String,
            let subtitle = aDecoder.decodeObjectForKey("subtitle") as? String else {
                return nil
        }
        
        let coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        
        self.init(coordinate: coordinate, title: title, subtitle: subtitle)
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(coordinate.latitude, forKey: "latitude")
        aCoder.encodeObject(coordinate.longitude, forKey: "longitude")
        aCoder.encodeObject(title, forKey: "title")
        aCoder.encodeObject(subtitle, forKey: "subtitle")
    }
}