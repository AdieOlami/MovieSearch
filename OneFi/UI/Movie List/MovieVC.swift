//
//  MovieVC.swift
//  OneFi
//
//  Created by Olar's Mac on 3/7/19.
//  Copyright © 2019 Adie Olami. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxSwiftExt
import RxGesture

class MovieVC: UIViewController {

    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var searchField: UITextField!
    @IBOutlet private var selectYear: UITextField!
    @IBOutlet private var searchBtnClicked: UIButton!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private var label: UILabel!
    @IBOutlet private var emptyView: UIView!
    
    
    fileprivate var presenter: MovieContract.Presenter!
    let disposeBag = DisposeBag()
    var movieShown = [Movie]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isHidden = true
        defaults()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    fileprivate func defaults() {
        presenter = MoviePresenter(view: self, source: Repository.instance)
        bindElements()
        setupTableView()
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        searchField.becomeFirstResponder()
    }
    
}

// MARK :- Private Functions
extension MovieVC {
    private func setupTableView() {
        
    }
    
    private func bindElements() {
        activityIndicator.isHidden = true

        searchBtnClicked.rx.tap
            .asDriver()
            .drive(onNext: { (btn) in
                guard let title = self.searchField.text , let year = self.selectYear.text, year.count == 4 else {return}
                self.presenter.getMovies(title: title, year: Int(year)!)
            })
            .disposed(by: disposeBag)
    }
    
    func ignoreNil<A>(x: A?) -> Observable<A> {
        return x.map { Observable.just($0) } ?? Observable.empty()
    }
}

// MARK :- TableView DataSource & Delegate
extension MovieVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? MovieTableCell else {return}
        cell.selectionStyle = .none
        let movieDetailVC =
            MovieDetailVC(nibName: "MovieDetailVC", bundle: nil)
        movieDetailVC.onDetailClicked = {
            self.movieShown
        }
        self.navigationController?.pushViewController(movieDetailVC, animated: true)
    }
}

extension MovieVC: MovieContract.View {
    func setProgress(enabled: Bool) {
        activityIndicator.isHidden = !enabled
        searchBtnClicked.isEnabled = !enabled

        if enabled {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
    
    func showMovies(_ movie: [Movie]) {
        let data = Observable<[Movie]>.just(movie)
        data.bind(to: tableView.rx.items(cellIdentifier: "cell")) { (row, movie, cell: MovieTableCell) in
            self.movieShown.append(movie)
            cell.configureCell(movie: movie)
            }.disposed(by: disposeBag)
    }
    
    func didFail(fail: Bool) {
        tableView.isHidden = fail
        emptyView.isHidden = !fail
    }
    
    func didShowError(error: Error) {
        
    }
    
    func didShowStatusCode(code: Int?) {
        
    }
    
    
}
