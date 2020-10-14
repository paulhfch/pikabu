//
//  AppDelegate+Extensions.swift.swift
//  pikabu
//
//  Created by Fangchen Huang on 2020-10-14.
//  Copyright © 2020 Fangchen Huang. All rights reserved.
//

import Foundation

extension AppDelegate {
    
    static var appVersion: String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    }
    
}
