//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by Waseem Idelbi on 12/12/19.
//  Copyright © 2019 Waseem Idelbi. All rights reserved.
//

import UIKit

class PhotosCollectionVC: UICollectionViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
        setTheme()
    }
    
    //MARK: -Important variables-
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    //MARK: -Important methods-
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddSegue" {
            guard let photoDetailVC = segue.destination as? PhotoDetailVC else {return}
            photoDetailVC.themeHelper = themeHelper
            photoDetailVC.photoController = photoController
            
        } else if segue.identifier == "CellSegue" {
            guard let photoDetailVC = segue.destination as? PhotoDetailVC else {return}
            photoDetailVC.themeHelper = themeHelper
            photoDetailVC.photoController = photoController
            
        } else if segue.identifier == "SelectThemeSegue" {
            guard let selectorVC = segue.destination as? ThemeSelectionVC else {return}
            selectorVC.themeHelper = themeHelper
            
        }
    }
    
    func setTheme() {
        guard let theme = themeHelper.themePreference else {return}
        if theme == "Dark" {
            self.collectionView.backgroundColor = .darkGray
        } else if theme == "Green" {
            self.collectionView.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        }
    }
    
    // MARK: -UICollectionViewDataSource-
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
        
        cell.photo = photoController.photos[indexPath.item]
        
        return cell
    }
    
    // MARK: -UICollectionViewDelegate-
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}

