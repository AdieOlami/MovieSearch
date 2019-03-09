//
//  Movie.swift
//  OneFi
//
//  Created by Olar's Mac on 3/7/19.
//  Copyright © 2019 Adie Olami. All rights reserved.
//

import Foundation
import EVReflection

class Movie: EVObject {
    var title: String?
    var year: String?
    var rated: String?
    var released: String?
    var runtime: String?
    var genre: String?
    var director: String?
    var writer: String?
    var actors: String?
    var plot: String?
    var language: String?
    var country: String?
    var awards: String?
    var poster: String?
    var ratings: Ratings?
    var metascore: String?
    var imdbRating: String?
    var imdbVotes: String?
    var imdbID: String?
    var type: String?
    var dVD: String?
    var boxOffice: String?
    var production: String?
    var website: String?
    var response: String?
    
    // Handling the setting of non key-value coding compliant properties
    override func setValue(_ value: Any!, forUndefinedKey key: String) {
        switch key {
        case "title": title = value as? String
        case "year": year = value as? String
        case "rated": rated = value as? String
        case "released": released = value as? String
        case "runtime": runtime = value as? String
        case "genre": genre = value as? String
        case "director": director = value as? String
        case "writer": writer = value as? String
        case "actors": actors = value as? String
        case "plot": plot = value as? String
        case "language": language = value as? String
        case "country": country = value as? String
        case "awards": awards = value as? String
        case "poster": poster = value as? String
        case "ratings": ratings = value as? Ratings
        case "metascore": metascore = value as? String
        case "imdbRating": imdbRating = value as? String
        case "imdbVotes": imdbVotes = value as? String
        case "imdbID": imdbID = value as? String
        case "type": type = value as? String
        case "dVD": dVD = value as? String
        case "boxOffice": boxOffice = value as? String
        case "production": production = value as? String
        case "website": website = value as? String
        case "response": response = value as? String
        default:
            self.addStatusMessage(.IncorrectKey, message: "SetValue for key '\(key)' should be handled.")
            print("---> 1 setValue for key '\(key)' should be handled in \(self.className) class")
        }
        
    }
}

class Ratings: EVObject {
    var source: String?
    var value: String?
}
