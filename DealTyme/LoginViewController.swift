//
//  LoginViewController.swift
//  DealTyme
//
//  Created by Ali Apple on 09/01/2019.
//  Copyright © 2019 Ali Apple. All rights reserved.
//

import UIKit
import GoogleSignIn
//import FacebookLogin
//import FBSDKLoginKit
//import FacebookCore

class LoginViewController: UIViewController, UITextFieldDelegate, GIDSignInUIDelegate, GIDSignInDelegate{

    let mainView: UIView = {
        var view = UIView()
//        view.backgroundColor = .blue
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
        tf.text = "test"
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
        tf.text = "123456"
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
    
    let lineSeparator1: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let lineSeparator2: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 80, g:169, b:53)
        button.setTitle("Log in", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 50/2
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.addTarget(self, action: #selector(handleLogin), for:.touchUpInside)
        return button
    }()
    
    @objc func handleLogin(){
        self.emailErrorImageView.isHidden = true
        self.emailErrorLabel.isHidden = true
        self.passwordErrorLabel.isHidden = true
        self.passwordErrorImageView.isHidden = true

        var errorExistsInEmail = false
        var errorExistsInPassword = false
        
        if self.emailTextField.text!.isEmpty{
            self.emailErrorImageView.isHidden = false
            self.emailErrorLabel.isHidden = false
            errorExistsInEmail = true
        }
        else{
            self.emailErrorImageView.isHidden = true
            self.emailErrorLabel.isHidden = true
            errorExistsInEmail = false
        }
        
        if self.passwordTextField.text!.isEmpty{
            self.passwordErrorImageView.isHidden = false
            self.passwordErrorLabel.text = "Password is empty!"
            self.passwordErrorLabel.isHidden = false
            errorExistsInPassword = true
        }
        else{
            self.passwordErrorImageView.isHidden = true
            self.passwordErrorLabel.isHidden = true
            errorExistsInPassword = false
        }
        
        if passwordTextField.text!.count < 6 && passwordTextField.text!.count != 0{
            self.passwordErrorImageView.isHidden = false
            self.passwordErrorLabel.text = "Password must contain at least 6 characters"
            self.passwordErrorLabel.isHidden = false
            errorExistsInPassword = true
        }
        
        if !errorExistsInEmail && !errorExistsInPassword{
            self.view.endEditing(true)
            self.emailErrorImageView.isHidden = true
            self.emailErrorLabel.isHidden = true
            self.passwordErrorLabel.isHidden = true
            self.passwordErrorImageView.isHidden = true
        
            AuthServices.instance.user_login(email: self.emailTextField.text!, password: self.passwordTextField.text!) { (success) in
                if(success){
                    print("login successful")
                    if(AuthServices.instance.loginstatus == "successsful"){
                        self.navigationController?.pushViewController(MyTabBarViewController(), animated: true)
                    }else{
                        ToastView.shared.long(self.view, txt_msg: "Invalid Email or Password")
                    }
                    
                }else{
                    print("login not successful")
                    ToastView.shared.long(self.view, txt_msg: "No Internet Connection")
                }
            }
        }
    }
    
    let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.setTitle("Forgot Password?", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.addTarget(self, action: #selector(handleForgotPassword), for:.touchUpInside)
        return button
    }()
    
    @objc func handleForgotPassword(){
        print("forgot")
    }
    
    lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.setTitle("Sign up", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 50/2
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.gray.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.addTarget(self, action: #selector(handleSignUp), for:.touchUpInside)
        return button
    }()
    
    @objc func handleSignUp(){
        print("Sign in button pressed")
        let signUpViewController = SignUpViewController()
//        let aObjNavi = UINavigationController(rootViewController: signUpViewController)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = .black;
        self.navigationController?.pushViewController(signUpViewController, animated: true)
//        let appDelegate: AppDelegate = (UIApplication.shared.delegate as? AppDelegate)!
//        appDelegate.window?.rootViewController = aObjNavi
        
    }
    
    let orSignUpWithLabel: UILabel = {
        let label = UILabel()
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        label.attributedText = NSAttributedString(string: "or Sign up with:",
                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.paragraphStyle: centeredParagraphStyle])
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    let facebookButton: UIButton = {
        var button = UIButton()
        let myUIImage = UIImage(named: "fb.png")
        button.setImage(myUIImage, for: .normal)
        button.contentMode = .scaleAspectFit
        button.layer.cornerRadius = 50/2
        button.addTarget(self, action: #selector(handleFacebookLogin), for:.touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func handleFacebookLogin(){
//        getFacebookUserInfo()
    }
    
    let gmailButton: UIButton = {
        var button = UIButton()
        let myUIImage = UIImage(named: "google.png")
        button.setImage(myUIImage, for: .normal)
        button.contentMode = .scaleAspectFit
        button.layer.cornerRadius = 50/2
        button.addTarget(self, action: #selector(handleGmailLogin), for:.touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func handleGmailLogin() {
        GIDSignIn.sharedInstance().delegate=self
        GIDSignIn.sharedInstance().uiDelegate=self
        GIDSignIn.sharedInstance().signIn()
    }
    
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
        
    }
    
    func sign(_ signIn: GIDSignIn!,
              present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error == nil) {
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
            print(userId, fullName, givenName, familyName, email)
            AuthServices.instance.user_checkEmail(email: email!) { (success) in
                if(success){
                    if (AuthServices.instance.checkemailstatus == "Exists"){
                        self.performLogin(email: email!, password: "")
                    }else{
                        self.performSignUp(name: fullName!, password: "", email: email!)
                    }
                }else{
                    print("api check email not successful")
                }
            }
        } else {
            print("\(error)")
        }
    }
    
    func performLogin(email: String, password: String){
        AuthServices.instance.user_login(email: email, password: password) { (success) in
            if(success){
                print("login successful")
                if(AuthServices.instance.loginstatus == "successsful"){
                    self.navigationController?.pushViewController(MyTabBarViewController(), animated: true)
                }else{
                    ToastView.shared.long(self.view, txt_msg: "Invalid Email or Password")
                }
                
            }else{
                print("login not successful")
                ToastView.shared.long(self.view, txt_msg: "No Internet Connection")
            }
        }
    }
    
    func performSignUp(name: String, password: String, email: String){
        AuthServices.instance.user_signup(name: name, password: password, email: email) { (success) in
            if(success){
                ToastView.shared.short(self.view, txt_msg: "signup successful")
                self.navigationController?.pushViewController(CodeVerificationViewController(), animated: true)
            }else{
                print("signup api not successful")
            }
        }
    }
    
    let instaButton: UIButton = {
        var button = UIButton()
        let myUIImage = UIImage(named: "insta.png")
        button.setImage(myUIImage, for: .normal)
        button.contentMode = .scaleAspectFit
        button.layer.cornerRadius = 50/2
        button.addTarget(self, action: #selector(handleInstaLogin), for:.touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func handleInstaLogin(){
        
    }
    
    var topBarHeight: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if(FBSDKAccessToken.current() == nil){
//            print("Not logged in ")
//        }else{
//            print("Logged in already")
//            getFacebookUserInfo()
//        }
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        view.backgroundColor = .white
        
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        
        topBarHeight = UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
        
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
    
//    func getFacebookUserInfo(){
//        let loginManager = LoginManager()
//        loginManager.logIn([.publicProfile, .email ], viewController: self) { (result) in
//            switch result{
//            case .cancelled:
//                print("Cancel button click")
//            case .success:
//                let params = ["fields" : "id, name, first_name, last_name, picture.type(large), email "]
//                let graphRequest = FBSDKGraphRequest.init(graphPath: "/me", parameters: params)
//                let Connection = FBSDKGraphRequestConnection()
//                Connection.add(graphRequest) { (Connection, result, error) in
//                    let info = result as! [String : AnyObject]
//                    print(info["name"] as! String)
//                }
//                Connection.start()
//            default:
//                print("??")
//            }
//        }
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    @objc func setupViews(){
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
        
        inputsContainerView.addSubview(emailTextField)
        emailTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor, constant: -100).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: inputsContainerView.centerXAnchor).isActive = true
        emailTextField.topAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: 25).isActive = true
        
        inputsContainerView.addSubview(lineSeparator1)
        lineSeparator1.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 5).isActive = true
        lineSeparator1.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineSeparator1.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor, constant: -100).isActive = true
        lineSeparator1.centerXAnchor.constraint(equalTo: inputsContainerView.centerXAnchor).isActive = true
        
        inputsContainerView.addSubview(emailErrorLabel)
        emailErrorLabel.topAnchor.constraint(equalTo: lineSeparator1.bottomAnchor, constant: 3).isActive = true
        emailErrorLabel.leadingAnchor.constraint(equalTo: lineSeparator1.leadingAnchor).isActive = true
        
        inputsContainerView.addSubview(emailErrorImageView)
        emailErrorImageView.topAnchor.constraint(equalTo: lineSeparator1.bottomAnchor, constant: 3).isActive = true
        emailErrorImageView.trailingAnchor.constraint(equalTo: lineSeparator1.trailingAnchor).isActive = true
        emailErrorImageView.heightAnchor.constraint(equalToConstant: 12).isActive = true
        emailErrorImageView.widthAnchor.constraint(equalToConstant: 12).isActive = true
        
        inputsContainerView.addSubview(passwordTextField)
        passwordTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor, constant: -100).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: logoContainerView.centerXAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailErrorLabel.bottomAnchor, constant: 20).isActive = true
        
        inputsContainerView.addSubview(lineSeparator2)
        lineSeparator2.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 5).isActive = true
        lineSeparator2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineSeparator2.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor, constant: -100).isActive = true
        lineSeparator2.centerXAnchor.constraint(equalTo: inputsContainerView.centerXAnchor).isActive = true
        
        inputsContainerView.addSubview(passwordErrorLabel)
        passwordErrorLabel.topAnchor.constraint(equalTo: lineSeparator2.bottomAnchor, constant: 3).isActive = true
        passwordErrorLabel.leadingAnchor.constraint(equalTo: lineSeparator2.leadingAnchor).isActive = true
        
        inputsContainerView.addSubview(passwordErrorImageView)
        passwordErrorImageView.topAnchor.constraint(equalTo: lineSeparator2.bottomAnchor, constant: 3).isActive = true
        passwordErrorImageView.trailingAnchor.constraint(equalTo: lineSeparator2.trailingAnchor).isActive = true
        passwordErrorImageView.heightAnchor.constraint(equalToConstant: 12).isActive = true
        passwordErrorImageView.widthAnchor.constraint(equalToConstant: 12).isActive = true
        
        inputsContainerView.addSubview(loginButton)
        loginButton.topAnchor.constraint(equalTo: lineSeparator2.bottomAnchor, constant: 50).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor, constant: -100).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: inputsContainerView.centerXAnchor).isActive = true
        
        inputsContainerView.addSubview(forgotPasswordButton)
        forgotPasswordButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20).isActive = true
        forgotPasswordButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        forgotPasswordButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor, constant: -100).isActive = true
        forgotPasswordButton.centerXAnchor.constraint(equalTo: inputsContainerView.centerXAnchor).isActive = true
        
        bottomView.addSubview(signUpButton)
        signUpButton.topAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
        signUpButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        signUpButton.widthAnchor.constraint(equalTo: bottomView.widthAnchor, constant: -100).isActive = true
        
        bottomView.addSubview(gmailButton)
        gmailButton.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -40).isActive = true
        gmailButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor).isActive = true
        gmailButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        gmailButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        
        bottomView.addSubview(facebookButton)
        facebookButton.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -40).isActive = true
        facebookButton.rightAnchor.constraint(equalTo: gmailButton.leftAnchor, constant: -30).isActive = true
        facebookButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        facebookButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        
        bottomView.addSubview(instaButton)
        instaButton.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -40).isActive = true
        instaButton.leftAnchor.constraint(equalTo: gmailButton.rightAnchor, constant: 30).isActive = true
        instaButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        instaButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        
        bottomView.addSubview(orSignUpWithLabel)
        orSignUpWithLabel.bottomAnchor.constraint(equalTo: gmailButton.topAnchor, constant: -10).isActive = true
        orSignUpWithLabel.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor).isActive = true
        orSignUpWithLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        orSignUpWithLabel.widthAnchor.constraint(equalTo: bottomView.widthAnchor, constant: -100).isActive = true
        
        
    }
    
//    deinit{
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
//    }
    
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
