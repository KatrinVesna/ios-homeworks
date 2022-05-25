//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Екатерина Александренко on 23.05.2022.
//
import UIKit

class ProfileHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

     lazy var avatarImageView: UIImageView = {
         var view = UIImageView()
         view.translatesAutoresizingMaskIntoConstraints = false
         view.image = UIImage(named: "cute-maneki-neko.jpg")
         view.contentMode = .scaleAspectFill
         view.clipsToBounds = true
         view.backgroundColor = .systemBackground
         view.layer.cornerRadius = 55.0
         view.layer.borderWidth = 3.0
         view.layer.borderColor = UIColor.white.cgColor
         return view
     }()

     lazy var fullNameLabel: UILabel = {
         var label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.text = "Maneki-neko cat"
         label.textColor = .black
         label.font = UIFont.boldSystemFont(ofSize: 18)
         return label
     }()

     lazy var statusLabel: UILabel = {
         var label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.text = "Waiting for something..."
         label.textColor = .gray
         label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
         return label
     }()
    
   lazy var statusTextField: UITextField = {
            var textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "New status"
            textField.isHidden = true
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.black.cgColor
            textField.backgroundColor = .white
            textField.layer.cornerRadius = 12
            textField.clipsToBounds = true
            textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height)) //для отступа в TextField
            textField.leftViewMode = .always
            return textField
        }()
    
     lazy var setStatusButton: UIButton = {
         var button = UIButton()
         button.translatesAutoresizingMaskIntoConstraints = false
         button.addTarget(self, action: #selector(didTapShowStatusButton), for: .touchUpInside)
         button.setTitle("Show status", for: .normal)
         button.layer.cornerRadius = 12
         button.layer.shadowOffset.height = 4
         button.layer.shadowOffset.width = 4
         button.layer.shadowRadius = 4
         button.layer.shadowColor = UIColor.black.cgColor
         button.layer.shadowOpacity = 0.7
         button.titleLabel?.textColor = .white
         button.layer.backgroundColor = UIColor.systemBlue.cgColor
         return button
     }()

    
     private func setupLayout() {
         
         NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16.0),
            avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            avatarImageView.widthAnchor.constraint(equalToConstant: 110.0),
            avatarImageView.heightAnchor.constraint(equalToConstant: 110.0),
            
            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27.0),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16.0),
            fullNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
           
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16.0),
            statusLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -64.0),
            
            statusTextField.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 8.0),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16.0),
            statusTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16.0),
            setStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            setStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50.0)
         ])

     }

     override func layoutSubviews() {
         super.layoutSubviews()
     }

     private func setupView() {
         addSubview(avatarImageView)
         addSubview(fullNameLabel)
         addSubview(statusLabel)
         addSubview(setStatusButton)
         addSubview(statusTextField)
         setupLayout()
     }

    private var imageToButton: NSLayoutConstraint?
    private var buttonToStatus: NSLayoutConstraint?

     @objc private func didTapShowStatusButton() {
         self.imageToButton?.isActive = false
         self.buttonToStatus?.isActive = false
         if self.statusTextField.isHidden {

             let textFieldToStatusLabel = self.statusTextField.topAnchor.constraint(equalTo: self.statusLabel.bottomAnchor, constant: 10)
             let textFieldToImage = self.statusTextField.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 30)
             let textFieldTrailingConstraint = self.statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
             let textFieldHeight = self.statusTextField.heightAnchor.constraint(equalToConstant: 40)
             let textFieldToButton = self.statusTextField.bottomAnchor.constraint(equalTo: self.setStatusButton.topAnchor, constant: -10)
             self.buttonToStatus = self.setStatusButton.topAnchor.constraint(equalTo: self.statusLabel.bottomAnchor, constant: 64)
             self.imageToButton = self.avatarImageView.bottomAnchor.constraint(equalTo: self.setStatusButton.topAnchor, constant: -35)

             NSLayoutConstraint.activate([textFieldToStatusLabel, textFieldToImage, textFieldTrailingConstraint, textFieldHeight, textFieldToButton, self.buttonToStatus, self.imageToButton].compactMap({ $0 }))
             self.setStatusButton.setTitle("Set status", for: .normal)
             self.statusTextField.alpha = 1
         } else {
             self.buttonToStatus = self.setStatusButton.topAnchor.constraint(equalTo: self.statusLabel.bottomAnchor, constant: 34)
             self.imageToButton = self.avatarImageView.bottomAnchor.constraint(equalTo: self.setStatusButton.topAnchor, constant: -16)
             NSLayoutConstraint.activate([self.buttonToStatus, self.imageToButton].compactMap({ $0 }))

             self.setStatusButton.setTitle("Show status", for: .normal)
             self.statusTextField.alpha = 0
             if statusTextField.hasText {
                 if let text = statusTextField.text {
                     print(text)
                     self.statusLabel.text = text
                 }
             }
             
             self.statusTextField.text = ""
             self.endEditing(true)
         }
         
         UIView.animate(withDuration: 0.5) {
             self.layoutIfNeeded()
         } completion: { _ in
             self.statusTextField.isHidden.toggle()
         }
     }
 }
