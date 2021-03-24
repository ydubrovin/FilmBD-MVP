//
//  InfoFilm.swift
//  FIlmDB+MVP
//
//  Created by Юрий Дубровин on 18.11.2020.
//

import Foundation
struct InfoFilm:Decodable {
    var voteCount:Int
    var id:Int
    var video:Bool
    var voteAverage:Double
    var title:String
    var popularity:Double
    var posterPath:String
    var originalLanguage:String
    var originalTitle:String
    var backdropPath:String
    var adult:Bool
    var overview:String
    var releaseDate:String
}
