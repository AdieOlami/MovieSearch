//
//  MoviePresenter.swift
//  OneFi
//
//  Created by Olar's Mac on 3/7/19.
//  Copyright © 2019 Adie Olami. All rights reserved.
//

import Foundation
import RxSwift

class MoviePresenter: MovieContract.Presenter {
    
    private var view: MovieContract.View?
    private var disposeBag = DisposeBag()
    private var source: DataSource!
    private let disposable = CompositeDisposable()
    private var getMoveKey: CompositeDisposable.DisposeKey?
    
    init(view: MovieContract.View, source: DataSource) {
        self.source = source
        self.view = view
    }
    
    func start() {
        
    }
    
    func getMovies(title: String, year: Int) {
        view?.setProgress(enabled: true)
        if let key = getMoveKey { disposable.remove(for: key) }
        getMoveKey = disposable.insert(source.getMovie(movieName: title, movieYear: year)
            .debounce(0.5, scheduler: MainScheduler.instance)
            .retry(.delayed(maxCount: 200, time: 2.5), shouldRetry: networkRetryPredicate)
            .flatMap(ignoreNil)
            .subscribe(onNext: { [weak self] response in
                self?.view?.setProgress(enabled: false)
                guard let presenter = self, let view = presenter.view else { return }
                if response.response != "False" {
                    view.didFail(fail: false)
                    view.setProgress(enabled: false)
                    view.showMovies([response])
                } else {
                    view.didFail(fail: true)
                    view.setProgress(enabled: false)
                }
                }, onError: {[weak self] error in
                    guard let presenter = self, let view = presenter.view else { return }
                    if let error = error as? NetworkingError {
                        view.didShowStatusCode(code: error.httpResponse?.statusCode)
                    }
            }))
    }
    
    func stop() {
        
    }
    
    func ignoreNil<A>(x: A?) -> Observable<A> {
        return x.map { Observable.just($0) } ?? Observable.empty()
    }
    
}

