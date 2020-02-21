//
//  PhotosCollectionViewCell.swift
//  Photo Collection
//
//  Created by Waseem Idelbi on 12/12/19.
//  Copyright © 2019 Waseem Idelbi. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    //MARK: -Outlets and actions-
    @IBOutlet var image: UIImageView!
    @IBOutlet var name: UILabel!
    
    //MARK: -Important variables-
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    //MARK: -Update Views-
    func updateViews() {
        
    }
    
}
