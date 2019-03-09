//
//  Repository.swift
//  OneFi
//
//  Created by Olar's Mac on 3/7/19.
//  Copyright © 2019 Adie Olami. All rights reserved.
//

import RxSwift
import Alamofire
import RxAlamofire
import EVReflection
import RxSwiftExt

class Repository: DataSource {
    
    public static let instance = Repository()
    
    func getMovie(movieName: String, movieYear: Int) -> Observable<Movie> {
        return ApiClient.session.rx.request(urlRequest: ApiRouter.getMovie(apiKey: "f80d01a", name: movieName, year: movieYear))
            .convert(to: Movie.self)
    }
    
}
