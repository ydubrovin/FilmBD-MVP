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
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.row == 0{
//            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//            cell.textLabel?.text = presenter.infoFilm?.title
//            return cell
//        }else{
//            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//            let myButton = UIButton(type: .roundedRect)
//            myButton.frame = CGRect(x: 10, y: 10, width: 50, height: 50)
//            myButton.addTarget(self, action: #selector(abc(_:)), for: .touchDown)
//            myButton.setTitle("zmi", for: .normal)
//            cell.accessoryView = myButton
//            return cell
//        }
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
                cell.textLabel?.text = presenter.infoFilm?.title
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
                var myImage = UIImageView()
                myImage.frame = CGRect(x: 0, y: 0, width: 200, height: 300)
                myImage.load(url: URL(string: "https://image.tmdb.org/t/p/w200/2mtQwJKVKQrZgTz49Dizb25eOQQ.jpg")!)
                //myImage.image = UIImage(named: "1")
                cell.accessoryView = myImage
                return cell
                
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
                let myButton = UIButton(type: .roundedRect)
                myButton.frame = CGRect(x: 10, y: 10, width: 50, height: 50)
                myButton.addTarget(self, action: #selector(abc(_:)), for: .touchDown)
                myButton.setTitle("zmi", for: .normal)
                cell.accessoryView = myButton
                return cell
            default:
                break
            }
        default:
            break
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = presenter.infoFilm?.title
        return cell
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 300.0;//Choose your custom row height
//    }
    
}
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

extension DetailInfoFilmViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400.0;//Choose your custom row height
    }
}

