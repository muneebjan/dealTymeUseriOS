//
//  SettingsPasswordViewController.swift
//  DealTyme
//
//  Created by Ali Apple on 13/02/2019.
//  Copyright © 2019 Ali Apple. All rights reserved.
//

import UIKit

class SettingsPasswordRecoveryViewController: UIViewController, UITextFieldDelegate {

    let lineSeparator1: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 238, g: 238, b: 239)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.font = .systemFont(ofSize: 16)
        tf.attributedPlaceholder = NSAttributedString(string: "Password",
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
    
    let passwordErrorLabel: UILabel = {
        let label = UILabel()
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        label.attributedText = NSAttributedString(string: "Password is required",
                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.paragraphStyle: centeredParagraphStyle])
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(r:206, g:71, b:35)
        label.sizeToFit()
        label.isHidden = true
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    let passwordErrorImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "alert")
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let reEnterPasswordTextField: UITextField = {
        let tf = UITextField()
        tf.font = .systemFont(ofSize: 16)
        tf.attributedPlaceholder = NSAttributedString(string: "Re-enter Password",
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
    
    let lineSeparator3: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let reEnterPasswordErrorLabel: UILabel = {
        let label = UILabel()
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        label.attributedText = NSAttributedString(string: "Password is required",
                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.paragraphStyle: centeredParagraphStyle])
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(r:206, g:71, b:35)
        label.sizeToFit()
        label.isHidden = true
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    let reEnterPasswordErrorImageView: UIImageView = {
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
        self.passwordErrorLabel.isHidden = true
        self.passwordErrorImageView.isHidden = true
        self.reEnterPasswordErrorLabel.isHidden = true
        self.reEnterPasswordErrorImageView.isHidden = true
        
        var errorExistsInPassword = false
        var errorExistsInReEnterPassword = false
        
        if self.passwordTextField.text!.isEmpty{
            self.passwordErrorImageView.isHidden = false
            self.passwordErrorLabel.text = "Password is required"
            self.passwordErrorLabel.isHidden = false
            errorExistsInPassword = true
        }
        else{
            self.passwordErrorImageView.isHidden = true
            self.passwordErrorLabel.isHidden = true
            errorExistsInPassword = false
        }
        
        if self.reEnterPasswordTextField.text!.isEmpty{
            self.reEnterPasswordErrorImageView.isHidden = false
            self.reEnterPasswordErrorLabel.text = "Password is required"
            self.reEnterPasswordErrorLabel.isHidden = false
            errorExistsInReEnterPassword = true
        }
        else{
            self.reEnterPasswordErrorImageView.isHidden = true
            self.reEnterPasswordErrorLabel.isHidden = true
            errorExistsInReEnterPassword = false
        }
        
        if passwordTextField.text! != reEnterPasswordTextField.text! && reEnterPasswordTextField.text!.count != 0{
            self.reEnterPasswordErrorImageView.isHidden = false
            self.passwordErrorLabel.text = "Password not match"
            self.reEnterPasswordErrorLabel.text = "Password not match"
            self.reEnterPasswordErrorLabel.isHidden = false
            errorExistsInReEnterPassword = true
        }
        
        if passwordTextField.text!.count < 6 && passwordTextField.text!.count != 0{
            self.passwordErrorImageView.isHidden = false
            self.passwordErrorLabel.text = "Password must contain at least 6 characters"
            self.passwordErrorLabel.isHidden = false
            errorExistsInPassword = true
        }
        
        if !errorExistsInPassword && !errorExistsInReEnterPassword {
            self.view.endEditing(true)
            self.passwordErrorLabel.isHidden = true
            self.passwordErrorImageView.isHidden = true
            
            //TODO: Save Password API Call
            
        }
    }
    
    var topBarHeight: CGFloat = 0
    var tabBarHeight: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "PASSWORD RECOVERY"
        self.passwordTextField.delegate = self
        self.reEnterPasswordTextField.delegate = self
        topBarHeight = UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
        tabBarHeight = tabBarController?.tabBar.frame.size.height ?? 49
        setupViews()
    }
    
    func setupViews(){
        view.addSubview(lineSeparator1)
        lineSeparator1.topAnchor.constraint(equalTo: view.topAnchor, constant: topBarHeight-2).isActive = true
        lineSeparator1.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        lineSeparator1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lineSeparator1.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        view.addSubview(passwordTextField)
        passwordTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: topBarHeight+40).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(lineSeparator2)
        lineSeparator2.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 2).isActive = true
        lineSeparator2.widthAnchor.constraint(equalTo: passwordTextField.widthAnchor).isActive = true
        lineSeparator2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lineSeparator2.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        view.addSubview(passwordErrorLabel)
        passwordErrorLabel.topAnchor.constraint(equalTo: lineSeparator2.bottomAnchor, constant: 3).isActive = true
        passwordErrorLabel.leadingAnchor.constraint(equalTo: lineSeparator2.leadingAnchor).isActive = true
        
        view.addSubview(passwordErrorImageView)
        passwordErrorImageView.topAnchor.constraint(equalTo: lineSeparator2.bottomAnchor, constant: 3).isActive = true
        passwordErrorImageView.trailingAnchor.constraint(equalTo: lineSeparator2.trailingAnchor).isActive = true
        passwordErrorImageView.heightAnchor.constraint(equalToConstant: 12).isActive = true
        passwordErrorImageView.widthAnchor.constraint(equalToConstant: 12).isActive = true
        
        view.addSubview(reEnterPasswordTextField)
        reEnterPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30).isActive = true
        reEnterPasswordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        reEnterPasswordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        reEnterPasswordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(lineSeparator3)
        lineSeparator3.topAnchor.constraint(equalTo: reEnterPasswordTextField.bottomAnchor, constant: 2).isActive = true
        lineSeparator3.widthAnchor.constraint(equalTo: reEnterPasswordTextField.widthAnchor).isActive = true
        lineSeparator3.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lineSeparator3.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        view.addSubview(reEnterPasswordErrorLabel)
        reEnterPasswordErrorLabel.topAnchor.constraint(equalTo: lineSeparator3.bottomAnchor, constant: 3).isActive = true
        reEnterPasswordErrorLabel.leadingAnchor.constraint(equalTo: lineSeparator3.leadingAnchor).isActive = true
        
        view.addSubview(reEnterPasswordErrorImageView)
        reEnterPasswordErrorImageView.topAnchor.constraint(equalTo: lineSeparator3.bottomAnchor, constant: 3).isActive = true
        reEnterPasswordErrorImageView.trailingAnchor.constraint(equalTo: lineSeparator3.trailingAnchor).isActive = true
        reEnterPasswordErrorImageView.heightAnchor.constraint(equalToConstant: 12).isActive = true
        reEnterPasswordErrorImageView.widthAnchor.constraint(equalToConstant: 12).isActive = true
        
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
