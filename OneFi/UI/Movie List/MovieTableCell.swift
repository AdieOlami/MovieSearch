//
//  MovieTableCell.swift
//  OneFi
//
//  Created by Olar's Mac on 3/7/19.
//  Copyright © 2019 Adie Olami. All rights reserved.
//

import UIKit
import SDWebImage

class MovieTableCell: UITableViewCell {

    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var prodYear: UILabel!
    @IBOutlet weak var director: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var bgView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCell(movie: Movie) -> Void {
        movieTitle.text = movie.title
        prodYear.text = "Year: \(movie.year!)"
        director.text = "Director: \(movie.director!)"
        posterImage.sd_setImage(with: URL(string: movie.poster!), placeholderImage: UIImage(named: "placeholder.png"))
    }
    
    
    override func layoutSubviews() {
        bgView.layer.cornerRadius = 15
        bgView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        bgView.layer.shadowOpacity = 0.25
        bgView.layer.shadowRadius = 5.0
        bgView.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    

}
