//
//  ViewController.swift
//  DealTyme
//
//  Created by Ali Apple on 09/01/2019.
//  Copyright © 2019 Ali Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let backImageView: UIImageView = {
        var bi = UIImageView()
        let screenSize: CGRect = UIScreen.main.bounds
        bi.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height)
        bi.image = UIImage(named: "back.png")
        bi.contentMode = .scaleAspectFill
        return bi
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
    
    let saveMoneyLabel: UILabel = {
        let label = UILabel()
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        label.attributedText = NSAttributedString(string: "Save Money - Get More",
                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.paragraphStyle: centeredParagraphStyle])
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
//        label.backgroundColor = .red
        label.alpha = 0.0
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
    var findDealsButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 80, g:169, b:53)
        button.setTitle("Find Deals", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 50/2
        button.alpha = 0.0
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handleFindDeals), for:.touchUpInside)
        return button
    }()
    
    @objc func handleFindDeals(){
        
    }
    
    var loginOrSignUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.setTitle("Log in or Sign up", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 50/2
        button.layer.borderWidth = 1.0
        button.alpha = 0.0
        button.layer.borderColor = UIColor.gray.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handleLoginOrSignUpButton), for:.touchUpInside)
        return button
    }()
    
    @objc func handleLoginOrSignUpButton(){
        let loginViewController = LoginViewController()
        let aObjNavi = UINavigationController(rootViewController: loginViewController)
        let appDelegate: AppDelegate = (UIApplication.shared.delegate as? AppDelegate)!
        appDelegate.window?.rootViewController = aObjNavi
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1, delay: 1, animations: {
            self.logoImageView.frame.origin.y = self.view.frame.midY/4
        }, completion: nil)
        UIView.animate(withDuration: 1.5, delay: 1.5, options: .curveEaseOut, animations: {
            self.saveMoneyLabel.alpha = 1.0
            self.loginOrSignUpButton.alpha = 1.0
            self.findDealsButton.alpha = 1.0
            self.backImageView.alpha = 0.0
        }, completion: nil)
    }
    

    func setupViews(){
        view.addSubview(backImageView)
        backImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        backImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backImageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        backImageView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        view.addSubview(logoImageView)
        logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        view.addSubview(saveMoneyLabel)
        saveMoneyLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.midY/1.5).isActive = true
        saveMoneyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(loginOrSignUpButton)
        loginOrSignUpButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        loginOrSignUpButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
        loginOrSignUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginOrSignUpButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(findDealsButton)
        findDealsButton.bottomAnchor.constraint(equalTo: loginOrSignUpButton.topAnchor, constant: -20).isActive = true
        findDealsButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
        findDealsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        findDealsButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
}

