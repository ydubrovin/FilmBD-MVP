//
//  ViewController.swift
//  FIlmDB+MVP
//
//  Created by Юрий Дубровин on 17.11.2020.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: MainViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        // Do any additional setup after loading the view.
    }

}

extension MainViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.comments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let comment = presenter.comments?[indexPath.row]
        print(presenter.comments?.count ?? 0)
        cell.textLabel?.text = comment?.title
        return cell
    }
    
    
}
extension MainViewController: MainViewProtocol{
    func succes() {
        tableView.reloadData()
    }
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}

extension MainViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let infoComent = presenter.comments?[indexPath.row]
        let detailVC = ModuleBuilder.createDetailInfoFilm(infoFilm: infoComent)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
