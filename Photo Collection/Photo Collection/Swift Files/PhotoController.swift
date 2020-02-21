//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Waseem Idelbi on 12/11/19.
//  Copyright © 2019 Waseem Idelbi. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func Create(image: Data, title: String) {
        photos.append(Photo(imageData: image, title: title))
    }
    
    func Update(Photo: Photo, Data: Data, name: String) {
        
    }
}
