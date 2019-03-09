//
//  Response.swift
//  OneFi
//
//  Created by Olar's Mac on 3/7/19.
//  Copyright © 2019 Adie Olami. All rights reserved.
//

import Foundation
import EVReflection

class ResponseBase: EVObject {
    var status: String?
    var message: String?
    var pagination: Pagination?
    
    var isSucessful: Bool {
        return status == "success"
    }
    
    struct ErrorMessage {
        static let passwordInvalid = " Current password is invalid."
        static let loginErrorIncorrectInfo = " Incorrect username/password."
        static let loginErrorAccountNotExist = " Invalid request"
    }
}

class Response<T: NSObject>: ResponseBase, EVGenericsKVC {
    var data: T?
    
    public func setGenericValue(_ value: AnyObject!, forUndefinedKey key: String) {
        switch key {
        case "data":
            data = value as? T
        default:
            print("---> setGenericValue '\(value)' forUndefinedKey '\(key)' should be handled.")
        }
    }
    
    public func getGenericType() -> NSObject {
        return T()
    }
}

class ArrayResponse<T: NSObject>: ResponseBase, EVGenericsKVC {
    var data = [T]()
    
    public func setGenericValue(_ value: AnyObject!, forUndefinedKey key: String) {
        switch key {
        case "data":
            data = value as? [T] ?? [T]()
        default:
            print("---> setGenericValue '\(value)' forUndefinedKey '\(key)' should be handled.")
        }
    }
    
    public func getGenericType() -> NSObject {
        return T()
    }
}

class ErrorString: EVObject {
    var message: String?
}

extension EVObject {
    func decodeToDate(value: Any, key: String) -> Any {
        switch key {
        case "updatedAt", "createdAt", "completeAt":
            print("\(key): \(value)")
            if let value = value as? Int {
                return Date(timeIntervalSince1970: TimeInterval(value))
            }
            if let value = value as? String {
                return value.dateFromISO8601 ?? Date()
            }
        default:
            break
        }
        return value
    }
}
