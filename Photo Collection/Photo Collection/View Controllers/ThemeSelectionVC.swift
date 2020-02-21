//
//  ThemeSelectionVC.swift
//  Photo Collection
//
//  Created by Waseem Idelbi on 2/20/20.
//  Copyright © 2020 Waseem Idelbi. All rights reserved.
//

import UIKit

class ThemeSelectionVC: UIViewController {

    var themeHelper: ThemeHelper?
    
    @IBAction func darkButtonTapped(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true)
    }
    
    @IBAction func greenButtonTapped(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToGreen()
        dismiss(animated: true)
    }
    
}
