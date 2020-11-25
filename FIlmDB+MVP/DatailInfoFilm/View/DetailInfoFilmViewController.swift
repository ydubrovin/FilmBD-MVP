//
//  DetailInfoFilmViewController.swift
//  FIlmDB+MVP
//
//  Created by Юрий Дубровин on 23.11.2020.
//

import UIKit

class DetailInfoFilmViewController: UIViewController {

    @IBOutlet weak var InfoFilmLable: UILabel!
    var presenter: DatailInfoFilmViewPresenterProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setInfoFilm()
    }
    @IBAction func tapAction(_ sender: Any) {
        presenter.tap()
    }
}

extension DetailInfoFilmViewController: DatailInfoFilmViewProtocol{
    func setInfoFilm(infoFilm: InfoFilm?) {
        InfoFilmLable.text = infoFilm?.title
    }
    
    
}
