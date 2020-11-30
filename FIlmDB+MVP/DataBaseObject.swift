//
//  DataBaseObject.swift
//  FIlmDB+MVP
//
//  Created by Юрий Дубровин on 30.11.2020.
//

import Foundation

import SQLite

let movies = Table("movies")
let idMovie = Expression<Int64>("idMovie")
let titleMovie = Expression<String>("titleMovie")
let overviewMovie = Expression<String>("overviewMovie")
let voteAverageMovie = Expression<Double>("voteAverageMovie")

struct DataBaseObject{
    var idMovie:Int
    var titleMovie:String
    var overviewMovie:String
    var voteAverageMovie:Double
}
