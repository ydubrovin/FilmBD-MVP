//
//  DataBaseService.swift
//  FIlmDB+MVP
//
//  Created by Юрий Дубровин on 30.11.2020.
//

import Foundation
import SQLite


protocol DataBaseProtocol{
    func saveData(infoFilm:InfoFilm)
    func deleteAllData()
    func deleteOneData(deleteID:Int64)
    //func createTable()
    func getData()->[InfoFilm]
}

class DataBase: DataBaseProtocol{

    
    
    let path = NSSearchPathForDirectoriesInDomains(
        .documentDirectory, .userDomainMask, true
        ).first!
    var database:Connection!
    
    init(){
        do {
            let db = try Connection("\(path)/db.sqlite3")
            self.database = db
            for user in try self.database.prepare(movies) {
                print("id: \(user[idMovie]), email: \(user[titleMovie]), name: \(user[overviewMovie]),id: \(user[voteAverageMovie])")
                // id: 1, email: alice@mac.com, name: Optional("Alice")
            }
        } catch  {
            print("error")
        }
        createTable()
    }
    
    func saveData(infoFilm:InfoFilm) {
        do {
            //let db = try Connection("path/to/db.sqlite3")
            let db = try Connection("\(path)/db.sqlite3")
            self.database = db
            try database.run(movies.insert(titleMovie <- infoFilm.title,overviewMovie <- infoFilm.overview,voteAverageMovie <- infoFilm.voteAverage))
        } catch  {
            print("error")
        }
    }
    
    func deleteAllData() {
        do{
            try database.run(movies.delete())
        }catch{
            print("error")
        }
    }
    
    func deleteOneData(deleteID:Int64) {
        do {
            let db = try Connection("\(path)/db.sqlite3")
            self.database = db
            let alice = movies.filter(idMovie == deleteID)
            try db.run(alice.delete())
        } catch  {
            print("error")
        }
    }
    
    func createTable() {
        do{
            try database.run(movies.create { t in     // CREATE TABLE "users" (
                t.column(idMovie, primaryKey: true) //     "id" INTEGER PRIMARY KEY NOT NULL,
                t.column(titleMovie)  //     "email" TEXT UNIQUE NOT NULL,
                t.column(overviewMovie)                 //     "name" TEXT
                t.column(voteAverageMovie)
            })
        }catch{
            print("ERROR")
        }
    }
    
    func getData() -> [InfoFilm] {
        var infoFilm: [InfoFilm]?
        var bufmovies = [InfoFilm]()
        do {
            let db = try Connection("\(path)/db.sqlite3")
            self.database = db
            for user in try self.database.prepare(movies) {
                print("id: \(user[idMovie]), email: \(user[titleMovie]), name: \(user[overviewMovie]),id: \(user[voteAverageMovie])")
                bufmovies.append(InfoFilm(voteCount: 1000 , id: Int(user[idMovie]), video: false, voteAverage: user[voteAverageMovie], title: user[titleMovie], popularity: 1.00000, posterPath: "nil", originalLanguage: "nil", originalTitle: "nil", backdropPath: "nel", adult: false, overview: user[overviewMovie], releaseDate: "nil"))
            }
        } catch  {
            print("error")
        }
        infoFilm = bufmovies
        //MARK: infoFilm! не безопасно
        return infoFilm!
    }
}

