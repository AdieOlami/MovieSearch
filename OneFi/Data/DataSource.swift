//
//  DataSource.swift
//  OneFi
//
//  Created by Olar's Mac on 3/7/19.
//  Copyright © 2019 Adie Olami. All rights reserved.
//

import Foundation
import RxSwift

protocol DataSource: class {
    func getMovie(movieName: String, movieYear: Int) -> Observable<Movie>
}
