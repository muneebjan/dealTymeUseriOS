//
//  SettingsContactUsViewController.swift
//  DealTyme
//
//  Created by Ali Apple on 13/02/2019.
//  Copyright © 2019 Ali Apple. All rights reserved.
//

import UIKit

class SettingsContactUsViewController: UIViewController, UITextFieldDelegate {

    let lineSeparator1: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 238, g: 238, b: 239)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let contactTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = NSTextAlignment.center
        textView.textColor = .black
        textView.text = """
        Hello and thank you for being a loyal DealTyme user. We hope you are enjoying all the great deals near you.
        
        We are always trying to improve and make your user experience better. Tp help us improve your user experience, contact us and let us know what you like, don't like, and what we can do differently!
        
        Thank you from DealTyme Team!
        """
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.isSelectable = false
        textView.isEditable = false
        return textView
    }()
    
    let descriptionTextField: UITextField = {
        let tf = UITextField()
        tf.font = .systemFont(ofSize: 16)
        tf.attributedPlaceholder = NSAttributedString(string: "Description",
                                                      attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.textAlignment = .left
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
    
    let descriptionErrorLabel: UILabel = {
        let label = UILabel()
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        label.attributedText = NSAttributedString(string: "Description is required",
                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.paragraphStyle: centeredParagraphStyle])
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(r:206, g:71, b:35)
        label.sizeToFit()
        label.isHidden = true
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    let descriptionErrorImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "alert")
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.setTitle("Send", for: .normal)
        //        button.titleLabel?.textColor = UIColor(r: 80, g:169, b:53)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 30
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(r: 80, g:169, b:53).cgColor
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.addTarget(self, action: #selector(handleSend), for:.touchUpInside)
        return button
    }()
    
    @objc func handleSend(){
        self.descriptionErrorLabel.isHidden = true
        self.descriptionErrorImageView.isHidden = true
        
        var errorExistsInDescription = false
        
        if self.descriptionTextField.text!.isEmpty{
            self.descriptionErrorImageView.isHidden = false
            self.descriptionErrorLabel.isHidden = false
            errorExistsInDescription = true
        }
        else{
            self.descriptionErrorImageView.isHidden = true
            self.descriptionErrorLabel.isHidden = true
            errorExistsInDescription = false
        }
        
        if !errorExistsInDescription{
            //TODO: Send Description API
        }
    }
    
    var topBarHeight: CGFloat = 0
    var tabBarHeight: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "CONTACT US"
        self.descriptionTextField.delegate = self
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
        
        view.addSubview(contactTextView)
        contactTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: topBarHeight+30).isActive = true
        contactTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        contactTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        contactTextView.heightAnchor.constraint(equalToConstant: 230).isActive = true
        
        view.addSubview(descriptionTextField)
        descriptionTextField.topAnchor.constraint(equalTo: contactTextView.bottomAnchor, constant: 30).isActive = true
        descriptionTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        descriptionTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        descriptionTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(lineSeparator2)
        lineSeparator2.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 2).isActive = true
        lineSeparator2.widthAnchor.constraint(equalTo: descriptionTextField.widthAnchor).isActive = true
        lineSeparator2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lineSeparator2.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        view.addSubview(descriptionErrorLabel)
        descriptionErrorLabel.topAnchor.constraint(equalTo: lineSeparator2.bottomAnchor, constant: 3).isActive = true
        descriptionErrorLabel.leadingAnchor.constraint(equalTo: lineSeparator2.leadingAnchor).isActive = true
        
        view.addSubview(descriptionErrorImageView)
        descriptionErrorImageView.topAnchor.constraint(equalTo: lineSeparator2.bottomAnchor, constant: 3).isActive = true
        descriptionErrorImageView.trailingAnchor.constraint(equalTo: lineSeparator2.trailingAnchor).isActive = true
        descriptionErrorImageView.heightAnchor.constraint(equalToConstant: 12).isActive = true
        descriptionErrorImageView.widthAnchor.constraint(equalToConstant: 12).isActive = true
        
        view.addSubview(sendButton)
        sendButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -self.tabBarHeight-20).isActive = true
        sendButton.widthAnchor.constraint(equalToConstant: 180).isActive = true
        sendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sendButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

}
