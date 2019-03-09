//
//  Pagination.swift
//  OneFi
//
//  Created by Olar's Mac on 3/7/19.
//  Copyright © 2019 Adie Olami. All rights reserved.
//

import Foundation
import EVReflection

class Pagination: EVObject {
    var offset: Int?
    var limit: Int?
    var rowCount: Int?
    var pageCount: Int?
    
    // Handling the setting of non key-value coding compliant properties
    override func setValue(_ value: Any!, forUndefinedKey key: String) {
        switch key {
        case "limit": limit = value as? Int
        case "offset": offset = value as? Int
        case "rowCount": rowCount = value as? Int
        case "pageCount": pageCount = value as? Int
        default:
            self.addStatusMessage(.IncorrectKey, message: "SetValue for key '\(key)' should be handled.")
            print("---> 1 setValue for key '\(key)' should be handled in \(self.className) class")
        }
        
    }
}
