//
//  CodeVerificationViewController.swift
//  DealTyme
//
//  Created by Ali Apple on 10/01/2019.
//  Copyright © 2019 Ali Apple. All rights reserved.
//

import UIKit

class CodeVerificationViewController: UIViewController {

    let lineSeparator1: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 238, g: 238, b: 239)
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
        tf.attributedPlaceholder = NSAttributedString(string: "Code",
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
    
    let lineSeparator2: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var confirmButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 80, g:169, b:53)
        button.setTitle("Confirm", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 50/2
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.addTarget(self, action: #selector(handleConfirm), for:.touchUpInside)
        return button
    }()
    
    @objc func handleConfirm(){
        
//        self.navigationController?.pushViewController(MainViewController(), animated: true)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = .black;
        if let code = nameTextField.text{
            print("code: \(code)")
            
            let otpcode = Int(code)
            
            print("user id: \(UserInfo.sharedInstance.userid!)")
            print("textfield code: \(otpcode!)")
            print("otp id: \(otpCodeID)")
            
            AuthServices.instance.user_verifyOtpCode(userid: UserInfo.sharedInstance.userid!, code: otpcode!, otpcodeID: otpCodeID) { (success) in
                if(success){
                    print("verification OTP successfull")
                    
                    AuthServices.instance.user_verifyUpdated(userid: UserInfo.sharedInstance.userid!, completion: { (success) in
                        if(success){
                            print("user verification updated ")
                            AuthServices.instance.user_OtpUpdated(userid: UserInfo.sharedInstance.userid!, id: otpCodeID, completion: { (success) in
                                if(success){
                                    print("otp updated api successfull")
                                    self.navigationController?.pushViewController(DealsViewController(), animated: true)

                                }else{
                                    print("otp updated api not successful")
                                }
                            })
                        }else{
                            print("user verification update not successfull")
                        }
                    })
                    
                }else{
                    print("not successfull OTP verification")
                }
            }
            

        }

    }
    
    let alreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.setTitle("Didn't receive a Verification code? Resend", for: .normal)
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
        topBarHeight = UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
        view.backgroundColor = .white
        self.title = "VERIFICATION"
        // Do any additional setup after loading the view.
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func setupViews(){
        view.addSubview(lineSeparator1)
        lineSeparator1.topAnchor.constraint(equalTo: view.topAnchor, constant: topBarHeight).isActive = true
        lineSeparator1.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        lineSeparator1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lineSeparator1.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        view.addSubview(logoImageView)
        logoImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: topBarHeight + 20).isActive = true
        
        view.addSubview(nameTextField)
        nameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -120).isActive = true
        
        view.addSubview(lineSeparator2)
        lineSeparator2.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 5).isActive = true
        lineSeparator2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineSeparator2.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
        lineSeparator2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
        alreadyHaveAccountButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        alreadyHaveAccountButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
        alreadyHaveAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(confirmButton)
        confirmButton.bottomAnchor.constraint(equalTo: alreadyHaveAccountButton.topAnchor, constant: -20).isActive = true
        confirmButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        confirmButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
        confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

    }
}
