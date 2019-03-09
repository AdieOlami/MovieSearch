//
//  ApiClient.swift
//  OneFi
//
//  Created by Olar's Mac on 3/7/19.
//  Copyright © 2019 Adie Olami. All rights reserved.
//

import Foundation
import Alamofire
import netfox

class ApiClient {
    static let session: SessionManager = {
        let config = URLSessionConfiguration.default
        if Configuration.buildType == .debug {
            config.protocolClasses?.insert(NFXProtocol.self, at: 0)
        }
        config.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        config.httpAdditionalHeaders?["User-Agent"] = "\(Bundle.main.bundleIdentifier!)/\("iOS")/\(Bundle.main.buildNumber!)"
        return Alamofire.SessionManager(configuration: config)
    }()
}
