//
//  AccountEditViewController.swift
//  DealTyme
//
//  Created by Ali Apple on 18/02/2019.
//  Copyright © 2019 Ali Apple. All rights reserved.
//

import UIKit

class AccountEditViewController: UIViewController, UITextFieldDelegate {

    let lineSeparator1: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 238, g: 238, b: 239)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.font = .systemFont(ofSize: 16)
        tf.attributedPlaceholder = NSAttributedString(string: "Name",
                                                      attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        tf.autocorrectionType = .no
        tf.isSecureTextEntry = true
        tf.backgroundColor = .white
        tf.textAlignment = .left
        tf.text = ""
        tf.layer.masksToBounds = false
        tf.clipsToBounds = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let lineSeparator2: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameErrorLabel: UILabel = {
        let label = UILabel()
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        label.attributedText = NSAttributedString(string: "Name is required",
                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.paragraphStyle: centeredParagraphStyle])
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(r:206, g:71, b:35)
        label.sizeToFit()
        label.isHidden = true
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    let nameErrorImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "alert")
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let phoneTextField: UITextField = {
        let tf = UITextField()
        tf.font = .systemFont(ofSize: 16)
        tf.attributedPlaceholder = NSAttributedString(string: "Phone Number",
                                                      attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        tf.autocorrectionType = .no
        tf.isSecureTextEntry = true
        tf.backgroundColor = .white
        tf.textAlignment = .left
        tf.text = ""
        tf.keyboardType = .numberPad
        tf.layer.masksToBounds = false
        tf.clipsToBounds = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let lineSeparator3: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let phoneErrorLabel: UILabel = {
        let label = UILabel()
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        label.attributedText = NSAttributedString(string: "Phone Number is required",
                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.paragraphStyle: centeredParagraphStyle])
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(r:206, g:71, b:35)
        label.sizeToFit()
        label.isHidden = true
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    let phoneErrorImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "alert")
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.font = .systemFont(ofSize: 16)
        tf.attributedPlaceholder = NSAttributedString(string: "Email",
                                                      attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        tf.autocorrectionType = .no
        tf.isSecureTextEntry = true
        tf.backgroundColor = .white
        tf.textAlignment = .left
        tf.text = ""
        tf.layer.masksToBounds = false
        tf.clipsToBounds = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let lineSeparator4: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let emailErrorLabel: UILabel = {
        let label = UILabel()
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        label.attributedText = NSAttributedString(string: "Email is required",
                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.paragraphStyle: centeredParagraphStyle])
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(r:206, g:71, b:35)
        label.sizeToFit()
        label.isHidden = true
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    let emailErrorImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "alert")
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.setTitle("Save", for: .normal)
        //        button.titleLabel?.textColor = UIColor(r: 80, g:169, b:53)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 30
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(r: 80, g:169, b:53).cgColor
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.addTarget(self, action: #selector(handleSave), for:.touchUpInside)
        return button
    }()
    
    @objc func handleSave(){
        print("Save button pressed")
        self.nameErrorLabel.isHidden = true
        self.nameErrorImageView.isHidden = true
        self.phoneErrorImageView.isHidden = true
        self.phoneErrorLabel.isHidden = true
        self.emailErrorImageView.isHidden = true
        self.emailErrorLabel.isHidden = true
        
        var errorExistsInName = false
        var errorExistsInPhone = false
        var errorExistsInEmail = false
        
        if self.nameTextField.text!.isEmpty{
            self.nameErrorImageView.isHidden = false
            self.nameErrorLabel.isHidden = false
            errorExistsInName = true
        }
        else{
            self.nameErrorImageView.isHidden = true
            self.nameErrorLabel.isHidden = true
            errorExistsInName = false
        }
        
        if self.phoneTextField.text!.isEmpty{
            self.phoneErrorImageView.isHidden = false
            self.phoneErrorLabel.isHidden = false
            errorExistsInPhone = true
        }
        else{
            self.phoneErrorImageView.isHidden = true
            self.phoneErrorLabel.isHidden = true
            errorExistsInPhone = false
        }
        
        if self.emailTextField.text!.isEmpty{
            self.emailErrorImageView.isHidden = false
            self.emailErrorLabel.text = "Email is required"
            self.emailErrorLabel.isHidden = false
            errorExistsInEmail = true
        }
        else{
            if !self.emailTextField.text!.isValidEmail(){
                self.emailErrorImageView.isHidden = false
                self.emailErrorLabel.text = "Invalid Email"
                self.emailErrorLabel.isHidden = false
                errorExistsInEmail = true
            }
            else{
                self.emailErrorImageView.isHidden = true
                self.emailErrorLabel.isHidden = true
                errorExistsInEmail = false
            }
        }
    }
    
    var topBarHeight: CGFloat = 0
    var tabBarHeight: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailTextField.delegate = self
        self.nameTextField.delegate = self
        self.phoneTextField.delegate = self
        
        topBarHeight = UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
        tabBarHeight = tabBarController?.tabBar.frame.size.height ?? 49
        view.backgroundColor = .white
        self.title = "EDIT"
        setupViews()
    }
    
    func setupViews(){
        view.addSubview(lineSeparator1)
        lineSeparator1.topAnchor.constraint(equalTo: view.topAnchor, constant: topBarHeight-2).isActive = true
        lineSeparator1.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        lineSeparator1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lineSeparator1.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        view.addSubview(nameTextField)
        nameTextField.topAnchor.constraint(equalTo: lineSeparator1.bottomAnchor, constant: 40).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(lineSeparator2)
        lineSeparator2.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 2).isActive = true
        lineSeparator2.widthAnchor.constraint(equalTo: nameTextField.widthAnchor).isActive = true
        lineSeparator2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lineSeparator2.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        view.addSubview(nameErrorLabel)
        nameErrorLabel.topAnchor.constraint(equalTo: lineSeparator2.bottomAnchor, constant: 3).isActive = true
        nameErrorLabel.leadingAnchor.constraint(equalTo: lineSeparator2.leadingAnchor).isActive = true
        
        view.addSubview(nameErrorImageView)
        nameErrorImageView.topAnchor.constraint(equalTo: lineSeparator2.bottomAnchor, constant: 3).isActive = true
        nameErrorImageView.trailingAnchor.constraint(equalTo: lineSeparator2.trailingAnchor).isActive = true
        nameErrorImageView.heightAnchor.constraint(equalToConstant: 12).isActive = true
        nameErrorImageView.widthAnchor.constraint(equalToConstant: 12).isActive = true
        
        view.addSubview(phoneTextField)
        phoneTextField.topAnchor.constraint(equalTo: lineSeparator2.bottomAnchor, constant: 30).isActive = true
        phoneTextField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
        phoneTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        phoneTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(lineSeparator3)
        lineSeparator3.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 2).isActive = true
        lineSeparator3.widthAnchor.constraint(equalTo: phoneTextField.widthAnchor).isActive = true
        lineSeparator3.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lineSeparator3.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        view.addSubview(phoneErrorLabel)
        phoneErrorLabel.topAnchor.constraint(equalTo: lineSeparator3.bottomAnchor, constant: 3).isActive = true
        phoneErrorLabel.leadingAnchor.constraint(equalTo: lineSeparator3.leadingAnchor).isActive = true
        
        view.addSubview(phoneErrorImageView)
        phoneErrorImageView.topAnchor.constraint(equalTo: lineSeparator3.bottomAnchor, constant: 3).isActive = true
        phoneErrorImageView.trailingAnchor.constraint(equalTo: lineSeparator3.trailingAnchor).isActive = true
        phoneErrorImageView.heightAnchor.constraint(equalToConstant: 12).isActive = true
        phoneErrorImageView.widthAnchor.constraint(equalToConstant: 12).isActive = true
        
        view.addSubview(emailTextField)
        emailTextField.topAnchor.constraint(equalTo: lineSeparator3.bottomAnchor, constant: 30).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(lineSeparator4)
        lineSeparator4.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 2).isActive = true
        lineSeparator4.widthAnchor.constraint(equalTo: emailTextField.widthAnchor).isActive = true
        lineSeparator4.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lineSeparator4.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        view.addSubview(emailErrorLabel)
        emailErrorLabel.topAnchor.constraint(equalTo: lineSeparator4.bottomAnchor, constant: 3).isActive = true
        emailErrorLabel.leadingAnchor.constraint(equalTo: lineSeparator4.leadingAnchor).isActive = true
        
        view.addSubview(emailErrorImageView)
        emailErrorImageView.topAnchor.constraint(equalTo: lineSeparator4.bottomAnchor, constant: 3).isActive = true
        emailErrorImageView.trailingAnchor.constraint(equalTo: lineSeparator4.trailingAnchor).isActive = true
        emailErrorImageView.heightAnchor.constraint(equalToConstant: 12).isActive = true
        emailErrorImageView.widthAnchor.constraint(equalToConstant: 12).isActive = true
        
        view.addSubview(saveButton)
        saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -self.tabBarHeight-20).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 180).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
