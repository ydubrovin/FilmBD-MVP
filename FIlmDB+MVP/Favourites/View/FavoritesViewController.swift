//
//  FavoritesViewController.swift
//  FIlmDB+MVP
//
//  Created by Юрий Дубровин on 27.11.2020.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    var presenter: FavoritesPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SecondVS"

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FavoritesViewController: FavoritesProtocol{
    
}
