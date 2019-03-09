//
//  RxNetworking.swift
//  OneFi
//
//  Created by Olar's Mac on 3/7/19.
//  Copyright © 2019 Adie Olami. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import EVReflection
import RxSwiftExt

extension ObservableType {
    
    func convert<T: EVObject>(to observableType: T.Type) -> Observable<T> where E: DataRequest {
        
        return self.flatMap({(request) -> Observable<T> in
            
            let disposable = Disposables.create {
                request.cancel()
            }
            
            return Observable<T>.create({observer -> Disposable in
                
                request.validate().responseObject { (response: DataResponse<T>) in
                    
                    switch response.result {
                    case .success(let value):
                        if !disposable.isDisposed {
                            observer.onNext(value)
                            observer.onCompleted()
                        }
                    case .failure(let error):
                        if !disposable.isDisposed {
                            observer.onError(NetworkingError(httpResponse: response.response,
                                                             networkData: response.data, baseError: error))
                            observer.onCompleted()
                        }
                        
                    }
                }
                
                return disposable
            })
            
        })
    }
    
}

let networkRetryPredicate: RetryPredicate = { error in
    if let err = error as? NetworkingError, let response = err.httpResponse {
        let code = response.statusCode
        if code >= 400 && code < 500 {
            return false
        }
    }
    
    return true
}

// Use this struct to pass the response and data along with
// the error as alamofire does not do this automatically
public struct NetworkingError: Error {
    let httpResponse: HTTPURLResponse?
    let networkData: Data?
    let baseError: Error
}
