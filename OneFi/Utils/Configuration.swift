//
//  Configuration.swift
//  OneFi
//
//  Created by Olar's Mac on 3/7/19.
//  Copyright © 2019 Adie Olami. All rights reserved.
//

import Foundation

struct Configuration {
    //    static var environment: Environment = {
    //        let configuration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as! String
    //        return configuration.lowercased().contains(Environment.staging.rawValue.lowercased())
    //            ? .staging : .production
    //    }()
    
    static let environment: Environment = {
        #if STAGING
        return .staging
        #else
        return .production
        #endif
    }()
    
    static let buildType: BuildType = {
        #if DEBUG
        return .debug
        #else
        return .release
        #endif
    }()
    
    private init() {}
}

enum Environment: String {
    case staging, production
    
    var baseURL: String {
        switch self {
        case .staging: return "https://www.omdbapi.com/"
        case .production: return "https://www.omdbapi.com/"
        }
    }
    
    
}

enum BuildType: String {
    case debug, release
}
