//
//  SignUpViewController.swift
//  DealTyme
//
//  Created by Ali Apple on 10/01/2019.
//  Copyright © 2019 Ali Apple. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {

    let userInstance = UserInfo.sharedInstance
    
    let lineSeparator1: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 238, g: 238, b: 239)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let mainView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let logoContainerView: UIView = {
        var view = UIView()
//        view.backgroundColor = .orange
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let inputsContainerView: UIView = {
        var view = UIView()
//        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let bottomView: UIView = {
        var view = UIView()
//        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let logoImageView: UIImageView = {
        var bi = UIImageView()
        let screenSize: CGRect = UIScreen.main.bounds
        bi.translatesAutoresizingMaskIntoConstraints = false
        //        bi.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height)
        bi.image = UIImage(named: "logo.png")
        bi.contentMode = .scaleAspectFit
        //        bi.backgroundColor = .orange
        return bi
    }()
    
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.font = .systemFont(ofSize: 14)
        tf.attributedPlaceholder = NSAttributedString(string: "Name",
                                                      attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.textAlignment = .left
        tf.autocapitalizationType = .none
        tf.layer.masksToBounds = false
        tf.clipsToBounds = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
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
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.font = .systemFont(ofSize: 14)
        tf.attributedPlaceholder = NSAttributedString(string: "Email",
                                                      attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.textAlignment = .left
        tf.autocapitalizationType = .none
        tf.keyboardType = .emailAddress
        tf.layer.masksToBounds = false
        tf.clipsToBounds = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
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
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.font = .systemFont(ofSize: 14)
        tf.attributedPlaceholder = NSAttributedString(string: "Password",
                                                      attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        tf.autocorrectionType = .no
        tf.isSecureTextEntry = true
        tf.backgroundColor = .white
        tf.textAlignment = .left
        tf.layer.masksToBounds = false
        tf.clipsToBounds = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
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
    
    let confirmPasswordTextField: UITextField = {
        let tf = UITextField()
        tf.font = .systemFont(ofSize: 14)
        tf.attributedPlaceholder = NSAttributedString(string: "Confirm Password",
                                                      attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        tf.autocorrectionType = .no
        tf.isSecureTextEntry = true
        tf.backgroundColor = .white
        tf.textAlignment = .left
        tf.layer.masksToBounds = false
        tf.clipsToBounds = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let confirmPasswordErrorLabel: UILabel = {
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
    
    let confirmPasswordErrorImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "alert")
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let lineSeparator2: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let lineSeparator3: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let lineSeparator4: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let lineSeparator5: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var confirmButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 80, g:169, b:53)
        button.setTitle("Sign Up", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 50/2
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.addTarget(self, action: #selector(handleSignUpButton), for:.touchUpInside)
        return button
    }()
    
    @objc func handleSignUpButton(){
        
//        self.navigationController?.pushViewController(CodeVerificationViewController(), animated: true)
        self.nameErrorLabel.isHidden = true
        self.nameErrorImageView.isHidden = true
        self.emailErrorImageView.isHidden = true
        self.emailErrorLabel.isHidden = true
        self.passwordErrorLabel.isHidden = true
        self.passwordErrorImageView.isHidden = true
        self.confirmPasswordErrorLabel.isHidden = true
        self.confirmPasswordErrorImageView.isHidden = true
        
        var errorExistsInName = false
        var errorExistsInEmail = false
        var errorExistsInPassword = false
        var errorExistsInConfirmPassword = false
        
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
        
        if self.confirmPasswordTextField.text!.isEmpty{
            self.confirmPasswordErrorImageView.isHidden = false
            self.confirmPasswordErrorLabel.text = "Password is required"
            self.confirmPasswordErrorLabel.isHidden = false
            errorExistsInConfirmPassword = true
        }
        else{
            self.confirmPasswordErrorImageView.isHidden = true
            self.confirmPasswordErrorLabel.isHidden = true
            errorExistsInConfirmPassword = false
        }
        
        if passwordTextField.text! != confirmPasswordTextField.text! && confirmPasswordTextField.text!.count != 0{
            self.confirmPasswordErrorImageView.isHidden = false
            self.passwordErrorLabel.text = "Password not match"
            self.confirmPasswordErrorLabel.text = "Password not match"
            self.confirmPasswordErrorLabel.isHidden = false
            errorExistsInConfirmPassword = true
        }
        
        if passwordTextField.text!.count < 6 && passwordTextField.text!.count != 0{
            self.passwordErrorImageView.isHidden = false
            self.passwordErrorLabel.text = "Password must contain at least 6 characters"
            self.passwordErrorLabel.isHidden = false
            errorExistsInPassword = true
        }
        
        if !errorExistsInName && !errorExistsInEmail && !errorExistsInPassword && !errorExistsInConfirmPassword {
            self.view.endEditing(true)
            self.emailErrorImageView.isHidden = true
            self.emailErrorLabel.isHidden = true
            self.passwordErrorLabel.isHidden = true
            self.passwordErrorImageView.isHidden = true
            
            AuthServices.instance.user_checkEmail(email: self.emailTextField.text!) { (success) in
                if(success){
                    if (AuthServices.instance.checkemailstatus == "Exists"){
                        self.navigationController?.pushViewController(DealsViewController(), animated: true)
                    }else{
                        AuthServices.instance.user_signup(name: self.userInstance.name, password: self.userInstance.password, email: self.userInstance.email) { (success) in
                            if(success){
                                ToastView.shared.short(self.view, txt_msg: "signup successful")
                                self.navigationController?.pushViewController(DealsViewController(), animated: true)
                            }else{
                                print("signup api not successful")
                            }
                        }
                    }
                }else{
                    print("api check email not successful")
                }
            }
        }
    }
    
    let alreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.setTitle("Already have account?", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.addTarget(self, action: #selector(handleForgotPassword), for:.touchUpInside)
        return button
    }()
    
    @objc func handleForgotPassword(){
        print("forgot")
    }
    
    var topBarHeight: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTextField.delegate = self
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        self.confirmPasswordTextField.delegate = self
        topBarHeight = UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
        view.backgroundColor = .white
        self.title = "REGISTRATION"
        
//        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { (notification) in
//            self.keyboardWillChange(notification: notification as Notification)
//        }
//        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { (notification) in
//            self.keyboardWillChange(notification: notification as Notification)
//        }
//        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillChangeFrameNotification, object: nil, queue: nil) { (notification) in
//            self.keyboardWillChange(notification: notification as Notification)
//        }
        setupViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func setupViews(){
        
        view.addSubview(lineSeparator1)
        lineSeparator1.topAnchor.constraint(equalTo: view.topAnchor, constant: topBarHeight).isActive = true
        lineSeparator1.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        lineSeparator1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lineSeparator1.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        view.addSubview(mainView)
        mainView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        mainView.heightAnchor.constraint(equalToConstant: view.frame.height - topBarHeight).isActive = true
        mainView.topAnchor.constraint(equalTo: view.topAnchor, constant: topBarHeight).isActive = true
        mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        mainView.addSubview(logoContainerView)
        logoContainerView.widthAnchor.constraint(equalTo: mainView.widthAnchor).isActive = true
        logoContainerView.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.2).isActive = true
        logoContainerView.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
        logoContainerView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        
        mainView.addSubview(inputsContainerView)
        inputsContainerView.widthAnchor.constraint(equalTo: mainView.widthAnchor).isActive = true
        inputsContainerView.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.5).isActive = true
        inputsContainerView.topAnchor.constraint(equalTo: logoContainerView.bottomAnchor).isActive = true
        inputsContainerView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        
        mainView.addSubview(bottomView)
        bottomView.widthAnchor.constraint(equalTo: mainView.widthAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.3).isActive = true
        bottomView.topAnchor.constraint(equalTo: (inputsContainerView).bottomAnchor).isActive = true
        bottomView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        
        logoContainerView.addSubview(logoImageView)
        logoImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: logoContainerView.centerXAnchor).isActive = true
        logoImageView.centerYAnchor.constraint(equalTo: logoContainerView.centerYAnchor).isActive = true
        
        inputsContainerView.addSubview(nameTextField)
        nameTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor, constant: -100).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nameTextField.centerXAnchor.constraint(equalTo: inputsContainerView.centerXAnchor).isActive = true
        nameTextField.topAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: 25).isActive = true
        
        inputsContainerView.addSubview(lineSeparator2)
        lineSeparator2.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 5).isActive = true
        lineSeparator2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineSeparator2.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor, constant: -100).isActive = true
        lineSeparator2.centerXAnchor.constraint(equalTo: inputsContainerView.centerXAnchor).isActive = true
        
        inputsContainerView.addSubview(nameErrorLabel)
        nameErrorLabel.topAnchor.constraint(equalTo: lineSeparator2.bottomAnchor, constant: 3).isActive = true
        nameErrorLabel.leadingAnchor.constraint(equalTo: lineSeparator2.leadingAnchor).isActive = true
        
        inputsContainerView.addSubview(nameErrorImageView)
        nameErrorImageView.topAnchor.constraint(equalTo: lineSeparator2.bottomAnchor, constant: 3).isActive = true
        nameErrorImageView.trailingAnchor.constraint(equalTo: lineSeparator2.trailingAnchor).isActive = true
        nameErrorImageView.heightAnchor.constraint(equalToConstant: 12).isActive = true
        nameErrorImageView.widthAnchor.constraint(equalToConstant: 12).isActive = true
        
        inputsContainerView.addSubview(emailTextField)
        emailTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor, constant: -100).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: logoContainerView.centerXAnchor).isActive = true
        emailTextField.topAnchor.constraint(equalTo: nameErrorImageView.bottomAnchor, constant: 20).isActive = true
        
        inputsContainerView.addSubview(lineSeparator3)
        lineSeparator3.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 5).isActive = true
        lineSeparator3.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineSeparator3.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor, constant: -100).isActive = true
        lineSeparator3.centerXAnchor.constraint(equalTo: inputsContainerView.centerXAnchor).isActive = true
        
        inputsContainerView.addSubview(emailErrorLabel)
        emailErrorLabel.topAnchor.constraint(equalTo: lineSeparator3.bottomAnchor, constant: 3).isActive = true
        emailErrorLabel.leadingAnchor.constraint(equalTo: lineSeparator3.leadingAnchor).isActive = true
        
        inputsContainerView.addSubview(emailErrorImageView)
        emailErrorImageView.topAnchor.constraint(equalTo: lineSeparator3.bottomAnchor, constant: 3).isActive = true
        emailErrorImageView.trailingAnchor.constraint(equalTo: lineSeparator3.trailingAnchor).isActive = true
        emailErrorImageView.heightAnchor.constraint(equalToConstant: 12).isActive = true
        emailErrorImageView.widthAnchor.constraint(equalToConstant: 12).isActive = true
        
        inputsContainerView.addSubview(passwordTextField)
        passwordTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor, constant: -100).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: logoContainerView.centerXAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailErrorImageView.bottomAnchor, constant: 20).isActive = true
        
        inputsContainerView.addSubview(lineSeparator4)
        lineSeparator4.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 5).isActive = true
        lineSeparator4.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineSeparator4.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor, constant: -100).isActive = true
        lineSeparator4.centerXAnchor.constraint(equalTo: inputsContainerView.centerXAnchor).isActive = true
        
        inputsContainerView.addSubview(passwordErrorLabel)
        passwordErrorLabel.topAnchor.constraint(equalTo: lineSeparator4.bottomAnchor, constant: 3).isActive = true
        passwordErrorLabel.leadingAnchor.constraint(equalTo: lineSeparator4.leadingAnchor).isActive = true
        
        inputsContainerView.addSubview(passwordErrorImageView)
        passwordErrorImageView.topAnchor.constraint(equalTo: lineSeparator4.bottomAnchor, constant: 3).isActive = true
        passwordErrorImageView.trailingAnchor.constraint(equalTo: lineSeparator4.trailingAnchor).isActive = true
        passwordErrorImageView.heightAnchor.constraint(equalToConstant: 12).isActive = true
        passwordErrorImageView.widthAnchor.constraint(equalToConstant: 12).isActive = true
        
        inputsContainerView.addSubview(confirmPasswordTextField)
        confirmPasswordTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor, constant: -100).isActive = true
        confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        confirmPasswordTextField.centerXAnchor.constraint(equalTo: logoContainerView.centerXAnchor).isActive = true
        confirmPasswordTextField.topAnchor.constraint(equalTo: passwordErrorImageView.bottomAnchor, constant: 20).isActive = true
        
        inputsContainerView.addSubview(lineSeparator5)
        lineSeparator5.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 5).isActive = true
        lineSeparator5.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineSeparator5.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor, constant: -100).isActive = true
        lineSeparator5.centerXAnchor.constraint(equalTo: inputsContainerView.centerXAnchor).isActive = true
        
        inputsContainerView.addSubview(confirmPasswordErrorLabel)
        confirmPasswordErrorLabel.topAnchor.constraint(equalTo: lineSeparator5.bottomAnchor, constant: 3).isActive = true
        confirmPasswordErrorLabel.leadingAnchor.constraint(equalTo: lineSeparator5.leadingAnchor).isActive = true
        
        inputsContainerView.addSubview(confirmPasswordErrorImageView)
        confirmPasswordErrorImageView.topAnchor.constraint(equalTo: lineSeparator5.bottomAnchor, constant: 3).isActive = true
        confirmPasswordErrorImageView.trailingAnchor.constraint(equalTo: lineSeparator5.trailingAnchor).isActive = true
        confirmPasswordErrorImageView.heightAnchor.constraint(equalToConstant: 12).isActive = true
        confirmPasswordErrorImageView.widthAnchor.constraint(equalToConstant: 12).isActive = true
        
        
        bottomView.addSubview(confirmButton)
        confirmButton.topAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
        confirmButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        confirmButton.widthAnchor.constraint(equalTo: bottomView.widthAnchor, constant: -100).isActive = true
        confirmButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor).isActive = true
        
        bottomView.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.topAnchor.constraint(equalTo: confirmButton.bottomAnchor, constant: 20).isActive = true
        alreadyHaveAccountButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        alreadyHaveAccountButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor, constant: -100).isActive = true
        alreadyHaveAccountButton.centerXAnchor.constraint(equalTo: inputsContainerView.centerXAnchor).isActive = true
    }

//    func keyboardWillChange(notification: Notification){
//        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
//            return
//        }
//        if notification.name.rawValue == "UIKeyboardWillChangeFrameNotification" || notification.name.rawValue == "UIKeyboardWillShowNotification"{
//            view.frame.origin.y = -keyboardRect.height
//        }
//        else{
//            view.frame.origin.y = 0
//        }
//    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
