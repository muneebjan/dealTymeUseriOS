//
//  AccountViewController.swift
//  DealTyme
//
//  Created by Ali Apple on 31/01/2019.
//  Copyright © 2019 Ali Apple. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    let lineSeparator1: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 238, g: 238, b: 239)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let mainView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.borderColor = UIColor(r: 246, g: 249, b: 248).cgColor
        view.layer.borderWidth = 2
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    let userInfoView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .orange
        view.clipsToBounds = true
        return view
    }()
    
    let settingsView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .red
        view.clipsToBounds = true
        return view
    }()
    
    let emptyView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .blue
        view.clipsToBounds = true
        return view
    }()
    
    let fullNameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.sizeToFit()
        label.text = "Leonard Hofstadter"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let phoneLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.sizeToFit()
        label.text = "+921112233444"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let emailLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.sizeToFit()
        label.text = "email@email.com"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let pushNotificationIconImageView: UIImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.image = UIImage(named: "alarm75")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let pushNotificationLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.sizeToFit()
        label.text = "Push notifications"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let pushNotificationArrowImageView: UIImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.image = UIImage(named: "arrow")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    var pushNotificationButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handlePushNotification), for:.touchUpInside)
        return button
    }()
    
    @objc func handlePushNotification(){
        print("Push Notification Button Pressed")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = .black;
        self.navigationController?.pushViewController(SettingsPushNotificationViewController(), animated: true)
    }
    
    let passwordRecoveryIconImageView: UIImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.image = UIImage(named: "padlock75")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let passwordRecoveryLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.sizeToFit()
        label.text = "Password recovery"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let passwordRecoveryArrowImageView: UIImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.image = UIImage(named: "arrow")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    var passwordRecoveryButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handlePasswordRecovery), for:.touchUpInside)
        return button
    }()
    
    @objc func handlePasswordRecovery(){
        print("Password Recovery Button Pressed")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = .black;
        self.navigationController?.pushViewController(SettingsPasswordRecoveryViewController(), animated: true)
    }
    
    let shareWithFriendsIconImageView: UIImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.image = UIImage(named: "share75")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let shareWithFriendsLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.sizeToFit()
        label.text = "Share with friends"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let shareWithFriendsArrowImageView: UIImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.image = UIImage(named: "arrow")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    var shareWithFriendsButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleShareWithFriends), for:.touchUpInside)
        return button
    }()
    
    @objc func handleShareWithFriends(){
        print("Share With Friends Button Pressed")
    }
    
    let contactUsIconImageView: UIImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.image = UIImage(named: "letters75")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let contactUsLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.sizeToFit()
        label.text = "Contact us"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let contactUsArrowImageView: UIImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.image = UIImage(named: "arrow")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    var contactUsButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleContactUs), for:.touchUpInside)
        return button
    }()
    
    @objc func handleContactUs(){
        print("Contact us Button Pressed")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = .black;
        self.navigationController?.pushViewController(SettingsContactUsViewController(), animated: true)
    }
    
    let onBoardingIconImageView: UIImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.image = UIImage(named: "onboarding75")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let onBoardingLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.sizeToFit()
        label.text = "Onboarding"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let onBoardingArrowImageView: UIImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.image = UIImage(named: "arrow")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    var onBoardingButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleOnBoarding), for:.touchUpInside)
        return button
    }()
    
    @objc func handleOnBoarding(){
        print("Onboarding Button Pressed")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = .black;
        self.navigationController?.pushViewController(SettingsOnBoardingViewController(), animated: true)
    }
    
    var logOutButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 80, g:169, b:53)
        button.setTitle("Log Out", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 50/2
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handleLogOut), for:.touchUpInside)
        return button
    }()
    
    @objc func handleLogOut(){
        
    }
    
    var topBarHeight: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ACCOUNT"
        view.backgroundColor = .white
        let menuBtn = UIButton(type: .custom)
        menuBtn.frame = CGRect(x: 0.0, y: 0.0, width: 25, height: 20)
        menuBtn.setImage(UIImage(named:"pencil75"), for: .normal)
        menuBtn.addTarget(self, action: #selector(handleEditBarButton), for: UIControl.Event.touchUpInside)
        
        let menuBarItem = UIBarButtonItem(customView: menuBtn)
        let currWidth = menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 22)
        currWidth?.isActive = true
        let currHeight = menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 25)
        currHeight?.isActive = true
        self.navigationItem.rightBarButtonItem = menuBarItem
        topBarHeight = UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
        setupViews()
        // Do any additional setup after loading the view.
    }
    
    @objc func handleEditBarButton(){
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = .black;
        self.navigationController?.pushViewController(AccountEditViewController(), animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func setupViews(){
        view.addSubview(lineSeparator1)
        lineSeparator1.topAnchor.constraint(equalTo: view.topAnchor, constant: topBarHeight - 2).isActive = true
        lineSeparator1.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        lineSeparator1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lineSeparator1.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        view.addSubview(mainView)
        mainView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6).isActive = true
        mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainView.topAnchor.constraint(equalTo: view.topAnchor, constant: topBarHeight + 30).isActive = true
        
        mainView.addSubview(userInfoView)
        userInfoView.widthAnchor.constraint(equalTo: mainView.widthAnchor).isActive = true
        userInfoView.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.3).isActive = true
        userInfoView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        userInfoView.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
        
        mainView.addSubview(settingsView)
        settingsView.widthAnchor.constraint(equalTo: mainView.widthAnchor).isActive = true
        settingsView.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.65).isActive = true
        settingsView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        settingsView.topAnchor.constraint(equalTo: userInfoView.bottomAnchor).isActive = true
        
        mainView.addSubview(emptyView)
        emptyView.widthAnchor.constraint(equalTo: mainView.widthAnchor).isActive = true
        emptyView.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.05).isActive = true
        emptyView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        emptyView.topAnchor.constraint(equalTo: settingsView.bottomAnchor).isActive = true
        
        userInfoView.addSubview(fullNameLabel)
        fullNameLabel.topAnchor.constraint(equalTo: userInfoView.topAnchor, constant: 30).isActive = true
        fullNameLabel.centerXAnchor.constraint(equalTo: userInfoView.centerXAnchor).isActive = true
        
        userInfoView.addSubview(phoneLabel)
        phoneLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 15).isActive = true
        phoneLabel.centerXAnchor.constraint(equalTo: userInfoView.centerXAnchor).isActive = true
        
        userInfoView.addSubview(emailLabel)
        emailLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 10).isActive = true
        emailLabel.centerXAnchor.constraint(equalTo: userInfoView.centerXAnchor).isActive = true
        
        settingsView.addSubview(pushNotificationIconImageView)
        pushNotificationIconImageView.topAnchor.constraint(equalTo: settingsView.topAnchor, constant: 35).isActive = true
        pushNotificationIconImageView.leftAnchor.constraint(equalTo: settingsView.leftAnchor, constant: 20).isActive = true
        pushNotificationIconImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        pushNotificationIconImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        settingsView.addSubview(pushNotificationLabel)
        pushNotificationLabel.topAnchor.constraint(equalTo: settingsView.topAnchor, constant: 30).isActive = true
        pushNotificationLabel.leftAnchor.constraint(equalTo: pushNotificationIconImageView.rightAnchor, constant: 30).isActive = true
        
        settingsView.addSubview(pushNotificationArrowImageView)
        pushNotificationArrowImageView.topAnchor.constraint(equalTo: pushNotificationLabel.topAnchor, constant: 6).isActive = true
        pushNotificationArrowImageView.rightAnchor.constraint(equalTo: settingsView.rightAnchor, constant: -20).isActive = true
        pushNotificationArrowImageView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        pushNotificationArrowImageView.heightAnchor.constraint(equalToConstant: 17).isActive = true
        
        settingsView.addSubview(pushNotificationButton)
        pushNotificationButton.topAnchor.constraint(equalTo: pushNotificationLabel.topAnchor).isActive = true
        pushNotificationButton.bottomAnchor.constraint(equalTo: pushNotificationLabel.bottomAnchor).isActive = true
        pushNotificationButton.leftAnchor.constraint(equalTo: pushNotificationLabel.leftAnchor).isActive = true
        pushNotificationButton.rightAnchor.constraint(equalTo: pushNotificationArrowImageView.rightAnchor).isActive = true
        
        settingsView.addSubview(passwordRecoveryIconImageView)
        passwordRecoveryIconImageView.topAnchor.constraint(equalTo: pushNotificationIconImageView.bottomAnchor, constant: 30).isActive = true
        passwordRecoveryIconImageView.leftAnchor.constraint(equalTo: settingsView.leftAnchor, constant: 20).isActive = true
        passwordRecoveryIconImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        passwordRecoveryIconImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        settingsView.addSubview(passwordRecoveryLabel)
        passwordRecoveryLabel.topAnchor.constraint(equalTo: pushNotificationLabel.bottomAnchor, constant: 20).isActive = true
        passwordRecoveryLabel.leftAnchor.constraint(equalTo: passwordRecoveryIconImageView.rightAnchor, constant: 30).isActive = true
        
        settingsView.addSubview(passwordRecoveryArrowImageView)
        passwordRecoveryArrowImageView.topAnchor.constraint(equalTo: passwordRecoveryLabel.topAnchor, constant: 6).isActive = true
        passwordRecoveryArrowImageView.rightAnchor.constraint(equalTo: settingsView.rightAnchor, constant: -20).isActive = true
        passwordRecoveryArrowImageView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        passwordRecoveryArrowImageView.heightAnchor.constraint(equalToConstant: 17).isActive = true
        
        settingsView.addSubview(passwordRecoveryButton)
        passwordRecoveryButton.topAnchor.constraint(equalTo: passwordRecoveryLabel.topAnchor).isActive = true
        passwordRecoveryButton.bottomAnchor.constraint(equalTo: passwordRecoveryLabel.bottomAnchor).isActive = true
        passwordRecoveryButton.leftAnchor.constraint(equalTo: passwordRecoveryLabel.leftAnchor).isActive = true
        passwordRecoveryButton.rightAnchor.constraint(equalTo: passwordRecoveryArrowImageView.rightAnchor).isActive = true
        
        settingsView.addSubview(shareWithFriendsIconImageView)
        shareWithFriendsIconImageView.topAnchor.constraint(equalTo: passwordRecoveryIconImageView.bottomAnchor, constant: 30).isActive = true
        shareWithFriendsIconImageView.leftAnchor.constraint(equalTo: settingsView.leftAnchor, constant: 20).isActive = true
        shareWithFriendsIconImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        shareWithFriendsIconImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        settingsView.addSubview(shareWithFriendsLabel)
        shareWithFriendsLabel.topAnchor.constraint(equalTo: passwordRecoveryLabel.bottomAnchor, constant: 20).isActive = true
        shareWithFriendsLabel.leftAnchor.constraint(equalTo: shareWithFriendsIconImageView.rightAnchor, constant: 30).isActive = true
        
        settingsView.addSubview(shareWithFriendsArrowImageView)
        shareWithFriendsArrowImageView.topAnchor.constraint(equalTo: shareWithFriendsLabel.topAnchor, constant: 6).isActive = true
        shareWithFriendsArrowImageView.rightAnchor.constraint(equalTo: settingsView.rightAnchor, constant: -20).isActive = true
        shareWithFriendsArrowImageView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        shareWithFriendsArrowImageView.heightAnchor.constraint(equalToConstant: 17).isActive = true
        
        settingsView.addSubview(shareWithFriendsButton)
        shareWithFriendsButton.topAnchor.constraint(equalTo: shareWithFriendsLabel.topAnchor).isActive = true
        shareWithFriendsButton.bottomAnchor.constraint(equalTo: shareWithFriendsLabel.bottomAnchor).isActive = true
        shareWithFriendsButton.leftAnchor.constraint(equalTo: shareWithFriendsLabel.leftAnchor).isActive = true
        shareWithFriendsButton.rightAnchor.constraint(equalTo: shareWithFriendsArrowImageView.rightAnchor).isActive = true
        
        settingsView.addSubview(contactUsIconImageView)
        contactUsIconImageView.topAnchor.constraint(equalTo: shareWithFriendsIconImageView.bottomAnchor, constant: 30).isActive = true
        contactUsIconImageView.leftAnchor.constraint(equalTo: settingsView.leftAnchor, constant: 20).isActive = true
        contactUsIconImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        contactUsIconImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        settingsView.addSubview(contactUsLabel)
        contactUsLabel.topAnchor.constraint(equalTo: shareWithFriendsLabel.bottomAnchor, constant: 20).isActive = true
        contactUsLabel.leftAnchor.constraint(equalTo: contactUsIconImageView.rightAnchor, constant: 30).isActive = true
        
        settingsView.addSubview(contactUsArrowImageView)
        contactUsArrowImageView.topAnchor.constraint(equalTo: contactUsLabel.topAnchor, constant: 6).isActive = true
        contactUsArrowImageView.rightAnchor.constraint(equalTo: settingsView.rightAnchor, constant: -20).isActive = true
        contactUsArrowImageView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        contactUsArrowImageView.heightAnchor.constraint(equalToConstant: 17).isActive = true
        
        settingsView.addSubview(contactUsButton)
        contactUsButton.topAnchor.constraint(equalTo: contactUsLabel.topAnchor).isActive = true
        contactUsButton.bottomAnchor.constraint(equalTo: contactUsLabel.bottomAnchor).isActive = true
        contactUsButton.leftAnchor.constraint(equalTo: contactUsLabel.leftAnchor).isActive = true
        contactUsButton.rightAnchor.constraint(equalTo: contactUsArrowImageView.rightAnchor).isActive = true
        
        settingsView.addSubview(onBoardingIconImageView)
        onBoardingIconImageView.topAnchor.constraint(equalTo: contactUsIconImageView.bottomAnchor, constant: 30).isActive = true
        onBoardingIconImageView.leftAnchor.constraint(equalTo: settingsView.leftAnchor, constant: 20).isActive = true
        onBoardingIconImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        onBoardingIconImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        settingsView.addSubview(onBoardingLabel)
        onBoardingLabel.topAnchor.constraint(equalTo: contactUsLabel.bottomAnchor, constant: 20).isActive = true
        onBoardingLabel.leftAnchor.constraint(equalTo: onBoardingIconImageView.rightAnchor, constant: 30).isActive = true
        
        settingsView.addSubview(onBoardingArrowImageView)
        onBoardingArrowImageView.topAnchor.constraint(equalTo: onBoardingLabel.topAnchor, constant: 6).isActive = true
        onBoardingArrowImageView.rightAnchor.constraint(equalTo: settingsView.rightAnchor, constant: -20).isActive = true
        onBoardingArrowImageView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        onBoardingArrowImageView.heightAnchor.constraint(equalToConstant: 17).isActive = true
        
        settingsView.addSubview(onBoardingButton)
        onBoardingButton.topAnchor.constraint(equalTo: onBoardingLabel.topAnchor).isActive = true
        onBoardingButton.bottomAnchor.constraint(equalTo: onBoardingLabel.bottomAnchor).isActive = true
        onBoardingButton.leftAnchor.constraint(equalTo: onBoardingLabel.leftAnchor).isActive = true
        onBoardingButton.rightAnchor.constraint(equalTo: onBoardingArrowImageView.rightAnchor).isActive = true
        
        view.addSubview(logOutButton)
        logOutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
        logOutButton.widthAnchor.constraint(equalTo: mainView.widthAnchor, constant: -40).isActive = true
        logOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logOutButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

}
