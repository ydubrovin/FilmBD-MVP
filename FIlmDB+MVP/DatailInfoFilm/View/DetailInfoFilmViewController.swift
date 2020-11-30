//
//  DetailInfoFilmViewController.swift
//  FIlmDB+MVP
//
//  Created by Юрий Дубровин on 23.11.2020.
//

import UIKit

class DetailInfoFilmViewController: UIViewController {

    @IBOutlet weak var InfoFilmLable: UILabel!
    @IBOutlet weak var InfoFilmTable: UITableView!
    var presenter: DatailInfoFilmViewPresenterProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setInfoFilm()
        InfoFilmTable.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    @IBAction func tapAction(_ sender: Any) {
        presenter.tap()
    }
    @objc func abc(_ sender: UIButton){
        saveDataBase()
    }
}

extension DetailInfoFilmViewController: DatailInfoFilmViewProtocol{
    func saveDataBase() {
        presenter.saveDataBase()
    }
    
    func setInfoFilm(infoFilm: InfoFilm?) {
        //InfoFilmLable.text = infoFilm?.title
    }
    
    
}

extension DetailInfoFilmViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = presenter.infoFilm?.title
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            let myButton = UIButton(type: .roundedRect)
            myButton.frame = CGRect(x: 10, y: 10, width: 50, height: 50)
            myButton.addTarget(self, action: #selector(abc(_:)), for: .touchDown)
            myButton.setTitle("zmi", for: .normal)
            cell.accessoryView = myButton
            return cell
        }
    }
  
    
}


