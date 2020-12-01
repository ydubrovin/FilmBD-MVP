//
//  FavoritesViewController.swift
//  FIlmDB+MVP
//
//  Created by Юрий Дубровин on 27.11.2020.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    var presenter: FavoritesPresenter!
    @IBOutlet weak var tableFavorites: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Избронное"
        tableFavorites.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        //tableFavorites.isEditing = true
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.refreshData()
        self.tableFavorites.reloadData()
    }

}

extension FavoritesViewController: FavoritesViewProtocol{
    func refreshData() {
        presenter.refreshData()
    }
    
    func deleteDataBase(at: Int64) {
        presenter.deleteDataBase(at: at)
    }
    
    
}

extension FavoritesViewController: UITableViewDelegate{
    
}

extension FavoritesViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(presenter.favoritesInfoFilm.count)
        return presenter.favoritesInfoFilm.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let comment = presenter.favoritesInfoFilm[indexPath.row]
        //print(presenter.comments?.count ?? 0)
        cell.textLabel?.text = comment.title
        return cell
        
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            print("\(indexPath.row)")
            print("\(presenter.favoritesInfoFilm[indexPath.row].id)")
            deleteDataBase(at: Int64(presenter.favoritesInfoFilm[indexPath.row].id))
            presenter.favoritesInfoFilm.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
            //print(indexPath.row)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }

    }
    

    
    
}

