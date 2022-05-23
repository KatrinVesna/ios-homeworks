//
//  ProfileViewController.swift
//  Netology_IB_Instruments
//
//  Created by Екатерина Александренко on 20.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let screenWidth = UIScreen.main.bounds.width
        if let myView = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first as? ProfileView {
            myView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 250)

            view.addSubview(myView)
        }
    }
}

   
