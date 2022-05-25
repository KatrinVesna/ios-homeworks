//
//  PostViewController.swift
//  Navigation
//
//  Created by Екатерина Александренко on 23.05.2022.
//

import UIKit

class PostViewController: UIViewController {

     var closure: (() -> Void)?

//    private lazy var alertButton: UIButton = {
//             let button = UIButton()
//             button.setTitle("Continue", for: .normal)
//             button.titleLabel?.textColor = .black
//             button.backgroundColor = .systemBlue
//             button.layer.cornerRadius = 12
//             button.clipsToBounds = true
//             button.addTarget(self, action: #selector(didTapAlertButton), for: .touchUpInside)
//             button.translatesAutoresizingMaskIntoConstraints = false
//             return button
//         }()

         override func viewDidLoad() {
             super.viewDidLoad()
             self.view.backgroundColor = .white
             //
             self.navigationItem.title = postTitle
             //self.view.addSubview(self.alertButton)
             //self.addConstraintForAlertButton()
             makeBarItem()
         }

//         private func addConstraintForAlertButton() {
//             self.alertButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -90).isActive = true
//             self.alertButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 60).isActive = true
//             self.alertButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -60).isActive = true
//             self.alertButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
//         }
//
//         @objc private func didTapAlertButton() {
//             let alert = UIAlertController(title: "Information changed", message: "Save?", preferredStyle: .alert)
//             let okAction = UIAlertAction(title: "OK", style: .default) {_ in
//                 print("Information changed")
//                 self.navigationController?.popViewController(animated: true)
//             }
//             let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { _ in
//                 print("Cancel")
//             }
//             alert.addAction(cancelAction)
//             alert.addAction(okAction)
//             present(alert, animated: false)
//         }
    //Если что убрать
    var postTitle: String = "Post"
    private func makeBarItem() {
        let rightBarItem = UIBarButtonItem(title: "Information", style: .plain, target: self, action: #selector(buttonAction))
        self.navigationItem.title = postTitle
        navigationItem.rightBarButtonItem = rightBarItem
    }

    @objc private func buttonAction() {
        let infoView = InfoViewController()
        navigationController?.pushViewController(infoView, animated: true)
    }
    //
     }
