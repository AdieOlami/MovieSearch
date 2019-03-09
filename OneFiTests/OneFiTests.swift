//
//  OneFiTests.swift
//  OneFiTests
//
//  Created by Olar's Mac on 3/7/19.
//  Copyright © 2019 Adie Olami. All rights reserved.
//

import XCTest
import RxCocoa
import RxSwift

@testable import OneFi

class OneFiTests: XCTestCase {

    override func setUp() {
    }
    
    override func tearDown() {
    }
    
    func testMovie() {
        let expec = expectation(description: "Search Movie Code")
        let presenter =  MoviePresenter(view: MovieTestVC(expectation: expec), source: Repository.instance)
        presenter.getMovies(title: "Batman", year: 2013)
        wait(for: [expec], timeout: 30)
    }
    
    func testPerformanceExample() {
        self.measure {
        }
    }


}


class MovieTestVC: MovieContract.View {
    func setProgress(enabled: Bool) {
        
    }
    
    func showMovies(_ movie: [Movie]) {
        
    }
    
    func didFail(fail: Bool) {
        
    }
    
    func didShowError(error: Error) {
        
    }
    
    func didShowStatusCode(code: Int?) {
        XCTAssertGreaterThan(200, code ?? 0)
        self.expec.fulfill()
    }
    
    var expec: XCTestExpectation
    init(expectation: XCTestExpectation) {
        self.expec = expectation
    }
    
}
