//
//  MovieDetailVC.swift
//  OneFi
//
//  Created by Olar's Mac on 3/9/19.
//  Copyright © 2019 Adie Olami. All rights reserved.
//

import UIKit
import SDWebImage
import RxSwift
import RxCocoa
import RxSwiftExt

class MovieDetailVC: UIViewController {

    @IBOutlet private var backButton: UIButton!
    @IBOutlet weak var posterImage: UIImageView!
    
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var year: UILabel!
    @IBOutlet private var rated: UILabel!
    @IBOutlet private var released: UILabel!
    @IBOutlet private var runtime: UILabel!
    @IBOutlet private var genre: UILabel!
    @IBOutlet private var director: UILabel!
    @IBOutlet private var writer: UILabel!
    @IBOutlet private var actors: UILabel!
    @IBOutlet private var plot: UILabel!
    @IBOutlet private var language: UILabel!
    @IBOutlet private var country: UILabel!
    @IBOutlet private var awards: UILabel!
    @IBOutlet private var metascore: UILabel!
    @IBOutlet private var imdbRating: UILabel!
    @IBOutlet private var imdbVotes: UILabel!
    @IBOutlet private var imdbID: UILabel!
    @IBOutlet private var type: UILabel!
    @IBOutlet private var dVD: UILabel!
    @IBOutlet private var boxOffice: UILabel!
    @IBOutlet private var production: UILabel!
    @IBOutlet private var website: UILabel!
    
    private let backgroundColor: UIColor = .white
    
    var onDetailClicked: (() -> [Movie])?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setValues()
    }
    
    func setValues() {
        let dict = onDetailClicked!()
        dict.forEach { (movie) in
            posterImage.sd_setImage(with: URL(string: movie.poster!), placeholderImage: UIImage(named: "placeholder.png"))
            titleLabel.text = "Title \(movie.title!)"
            year.text = "Year: \(movie.year!)"
            rated.text = "Rated: \(movie.rated!)"
            released.text = "Release: \(movie.released!)"
            runtime.text = "Runtime: \(movie.runtime!)"
            genre.text = "Genre: \(movie.genre!)"
            director.text = "Director: \(movie.director!)"
            writer.text = "Writer: \(movie.writer!)"
            actors.text = "Actors: \(movie.actors!)"
            plot.text = "Plot: \(movie.plot!)"
            language.text = "Language: \(movie.language!)"
            country.text = "Country: \(movie.country!)"
            awards.text = "Awards: \(movie.awards!)"
            metascore.text = "Metascore: \(movie.metascore!)"
            imdbRating.text = "IMDB Rating: \(movie.imdbRating!)"
            imdbVotes.text = "IMDB Votes: \(movie.imdbVotes!)"
            imdbID.text = "IMDB ID: \(movie.imdbID!)"
            type.text = "Type: \(movie.type!)"
            dVD.text = "Dvd: \(movie.dVD!)"
            boxOffice.text = "Box Office: \(movie.boxOffice!)"
            production.text = "Production: \(movie.production!)"
            website.text = movie.website
            
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    fileprivate func setup() {
        
        backButton.setImage(UIImage.localImage("arrow-back-icon", template: true), for: .normal)
        backButton.tintColor = UIColor(hexString: "#282E4F")
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
       
    }
    
    @objc func didTapBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func didTapLoginButton() {
        
    }
    
    func display(alertController: UIAlertController) {
        self.present(alertController, animated: true, completion: nil)
    }
}
