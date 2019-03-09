//
//  ApiRouter.swift
//  OneFi
//
//  Created by Olar's Mac on 3/7/19.
//  Copyright © 2019 Adie Olami. All rights reserved.
//

import Foundation
import Alamofire

enum ApiRouter: URLRequestConvertible {
    case getMovie(apiKey: String, name: String, year: Int)
    
    var uRLString: String {
        return Configuration.environment.baseURL
    }
    
    var path: String {
        switch self {
        case .getMovie: return ""
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getMovie:
            return .get
        }
    }
    
    var parameters: Parameters {
        switch self {
        case .getMovie(let data):
            let params: [String: Any] = ["apikey": data.apiKey, "t": data.name, "y": data.year]
            return params
        }
    }
    
    var parameterEncoding: Alamofire.ParameterEncoding {
        switch self {
        case .getMovie:
            return URLEncoding.default
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try uRLString.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        let parameters = self.parameters.removeNullValues() as! Parameters
        urlRequest = try parameterEncoding.encode(urlRequest, with: parameters)
        
        let headers = ["Authorization": ""]
        
        headers.forEach { key, value in
            urlRequest.addValue(value, forHTTPHeaderField: key)
        }
        
        if let bodyData = urlRequest.httpBody {
            URLProtocol.setProperty(bodyData, forKey: "NFXBodyData", in: urlRequest as! NSMutableURLRequest)
        }
        
        return urlRequest
    }
    
    
}
