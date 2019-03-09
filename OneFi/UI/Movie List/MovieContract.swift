//
//  MovieContract.swift
//  OneFi
//
//  Created by Olar's Mac on 3/7/19.
//  Copyright © 2019 Adie Olami. All rights reserved.
//

import Foundation

struct MovieContract {
    typealias View = _MovieView
    typealias Presenter = _MovieViewPresenter
    typealias Delegate = _MovieViewDelegate
}

protocol _MovieView: BaseView {
    func setProgress(enabled: Bool)
    func showMovies(_ movie: [Movie])
    func didFail(fail: Bool)
    func didShowError(error: Error)
    func didShowStatusCode(code: Int?)
}

protocol _MovieViewPresenter: BasePresenter {
    func getMovies(title: String, year: Int)
}

protocol _MovieViewDelegate: class {
    func didAck(_ startTimeline: Bool)
}
