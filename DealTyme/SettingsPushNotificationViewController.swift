//
//  SettingsPushNotificationViewController.swift
//  DealTyme
//
//  Created by Ali Apple on 12/02/2019.
//  Copyright © 2019 Ali Apple. All rights reserved.
//

import UIKit

class SettingsPushNotificationViewController: UIViewController, UITextFieldDelegate {

    let lineSeparator1: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 238, g: 238, b: 239)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let switchButton: UISwitch = {
        let switchBtn = UISwitch()
        switchBtn.onTintColor = UIColor(r: 80, g: 169, b: 53)
        switchBtn.translatesAutoresizingMaskIntoConstraints = false
        switchBtn.isOn = true
        switchBtn.addTarget(self, action: #selector(switchValueDidChange(_:)), for: .valueChanged)
        return switchBtn
    }()
    
    @objc func switchValueDidChange(_ sender: UISwitch) {
        if sender.isOn{
            self.activeLabel.text = "Active"
        }
        else{
            self.activeLabel.text = "Inactive"
        }
    }
    
    let activeLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.sizeToFit()
        label.text = "Active"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let pushNotificationsLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.sizeToFit()
        label.text = "Push notifications"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let distanceTextField: UITextField = {
        let tf = UITextField()
        tf.font = .systemFont(ofSize: 16)
        tf.attributedPlaceholder = NSAttributedString(string: "Distance",
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
    }
    
    var topBarHeight: CGFloat = 0
    var tabBarHeight: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "PUSH NOTIFICATIONS"
        self.distanceTextField.delegate = self
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
        
        view.addSubview(switchButton)
        switchButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        switchButton.topAnchor.constraint(equalTo: view.topAnchor, constant: topBarHeight + 30).isActive = true
        
        view.addSubview(activeLabel)
        activeLabel.centerYAnchor.constraint(equalTo: switchButton.centerYAnchor).isActive = true
        activeLabel.rightAnchor.constraint(equalTo: switchButton.leftAnchor, constant: -10).isActive = true
        
        view.addSubview(pushNotificationsLabel)
        pushNotificationsLabel.centerYAnchor.constraint(equalTo: switchButton.centerYAnchor).isActive = true
        pushNotificationsLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        
        view.addSubview(distanceTextField)
        distanceTextField.topAnchor.constraint(equalTo: pushNotificationsLabel.bottomAnchor, constant: 30).isActive = true
        distanceTextField.leftAnchor.constraint(equalTo: pushNotificationsLabel.leftAnchor).isActive = true
        distanceTextField.rightAnchor.constraint(equalTo: switchButton.rightAnchor).isActive = true
        distanceTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(lineSeparator2)
        lineSeparator2.topAnchor.constraint(equalTo: distanceTextField.bottomAnchor, constant: 2).isActive = true
        lineSeparator2.widthAnchor.constraint(equalTo: distanceTextField.widthAnchor).isActive = true
        lineSeparator2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lineSeparator2.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
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
