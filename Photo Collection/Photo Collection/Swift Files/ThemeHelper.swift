//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Waseem Idelbi on 12/12/19.
//  Copyright © 2019 Waseem Idelbi. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey: String
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.register(defaults: ["Dark" : themePreferenceKey])
    }
    func setThemePreferenceToYourColorHere() {
        UserDefaults.standard.register(defaults: ["Green" : themePreferenceKey])
    }
    
    var themePreference: String? {
        if let preferredTheme = UserDefaults.standard.string(forKey: themePreferenceKey) {
            return preferredTheme
        }
    }
    
    init() {
        if themePreferenceKey == nil {
            self.setThemePreferenceToDark()
        }
    }

}
