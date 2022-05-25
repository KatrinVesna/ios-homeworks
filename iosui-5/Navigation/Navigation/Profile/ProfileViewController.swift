//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Екатерина Александренко on 23.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {

     private lazy var profileHeaderView: ProfileHeaderView = {
         let view = ProfileHeaderView()
         view.backgroundColor = .lightGray
         view.translatesAutoresizingMaskIntoConstraints = false
         return view
     }()

     private var newButton: UIButton = {
         var button = UIButton()
         button.setTitle("New button", for: .normal)
         button.titleLabel?.textColor = .white
         button.layer.backgroundColor = UIColor.systemBlue.cgColor
         button.layer.cornerRadius = 12
         button.translatesAutoresizingMaskIntoConstraints = false
         return button
     }()

     override func viewDidLoad() {
         super.viewDidLoad()
         self.view.backgroundColor = .white
         self.navigationItem.title = "Profile"
         self.view.addSubview(self.profileHeaderView)
         self.view.addSubview(self.newButton)
         self.addConstraints()
     }

     override func viewWillLayoutSubviews() {
         super.viewWillLayoutSubviews()
     }

     private func addConstraints() {
         
         NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            newButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
         ])
     }
 }

    
        
 
