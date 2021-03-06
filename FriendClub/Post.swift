//
//  Post.swift
//  FriendClub
//
//  Created by Michael Aubie on 2017-10-25.
//  Copyright © 2017 Michael Aubie. All rights reserved.
//
import Foundation
import CoreLocation
import UIKit

class Post: NSObject {
    var title = ""
    var content = ""
    var location = CLLocation()
    var image: UIImage? = nil
    var imageURLstr = ""
    var createdBy = 999
    var dateCreated = Date()
    
    init(title: String,  content: String, location: CLLocation, image: UIImage,
         imageURLstr: String, createdBy:Int, dateCreated: Date) {
        self.title = title
        self.content  = content
        self.location = location
        self.image = image
        self.createdBy = createdBy
        self.dateCreated = Date()/////dateCreated
        self.imageURLstr = imageURLstr
    }
}
