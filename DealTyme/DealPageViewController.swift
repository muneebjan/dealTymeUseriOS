//
//  DealPageViewController.swift
//  DealTyme
//
//  Created by Ali Apple on 19/02/2019.
//  Copyright © 2019 Ali Apple. All rights reserved.
//

import UIKit

class DealPageViewController: UIViewController {

    let lineSeparator1: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 238, g: 238, b: 239)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let topImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "starbucks")
//        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let dealTypeImageView: UIImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        //        view.image = UIImage(named: "starbucks")
        view.clipsToBounds = true
        view.layer.masksToBounds = false
        //        view.frame.height = 50
        view.layer.borderColor = UIColor.white.cgColor
        view.image = UIImage(named: "price-tag2")
        view.layer.cornerRadius = 15
        return view
    }()
    
    let mainContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(r: 238, g: 238, b: 239).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let companyNameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        label.text = "Starbucks"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    let companyAddressLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "99 Newcastle Dr @ 3km"
        label.sizeToFit()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let pricesContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 238, g: 246, b: 234)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let regularPriceLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Regular price: "
        label.sizeToFit()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let oldPriceLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.backgroundColor = .clear
        let attrString = NSAttributedString(string: "10$", attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue])
        label.attributedText = attrString
        label.sizeToFit()
        //        label.backgroundColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let dealPriceLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Deal price: "
        label.sizeToFit()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    let newPriceLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(r:38, g:168, b:52)
        label.backgroundColor = .clear
        label.text = "5$"
        label.sizeToFit()
        //        label.backgroundColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let priceImageView: UIImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //        view.backgroundColor = .red
        view.clipsToBounds = true
//        view.contentMode = .scaleToAspectFit
        view.image = UIImage(named: "gift-box50")
        //        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return view
    }()
    
    let dealHeadingLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        //        label.backgroundColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let dealDescriptionLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.backgroundColor = .clear
        label.numberOfLines = 2
        //        label.backgroundColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    var secureDealButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 80, g:169, b:53)
        button.setTitle("Secure deal", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 25
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(handleSecureDeal), for:.touchUpInside)
        return button
    }()
    
    @objc func handleSecureDeal(){
        
    }
    
    var topBarHeight: CGFloat = 0
    var tabBarHeight: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topBarHeight = UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
        tabBarHeight = tabBarController?.tabBar.frame.size.height ?? 49
        view.backgroundColor = .white
        self.title = "DEAL PAGE"
        setupViews()
    }

    func setupViews(){
        view.addSubview(lineSeparator1)
        lineSeparator1.topAnchor.constraint(equalTo: view.topAnchor, constant: topBarHeight-2).isActive = true
        lineSeparator1.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        lineSeparator1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lineSeparator1.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        view.addSubview(topImageView)
        topImageView.topAnchor.constraint(equalTo: lineSeparator1.bottomAnchor).isActive = true
        topImageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        topImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        topImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        topImageView.addSubview(dealTypeImageView)
        dealTypeImageView.rightAnchor.constraint(equalTo: topImageView.rightAnchor, constant: -10).isActive = true
        dealTypeImageView.topAnchor.constraint(equalTo: topImageView.topAnchor, constant: 10).isActive = true
        dealTypeImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        dealTypeImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(mainContainerView)
        mainContainerView.topAnchor.constraint(equalTo: topImageView.bottomAnchor, constant: -40).isActive = true
        mainContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6).isActive = true
        mainContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        mainContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        mainContainerView.addSubview(companyNameLabel)
        companyNameLabel.topAnchor.constraint(equalTo: mainContainerView.topAnchor, constant: 20).isActive = true
        companyNameLabel.centerXAnchor.constraint(equalTo: mainContainerView.centerXAnchor).isActive = true
        
        mainContainerView.addSubview(companyAddressLabel)
        companyAddressLabel.topAnchor.constraint(equalTo: companyNameLabel.bottomAnchor, constant: 10).isActive = true
        companyAddressLabel.centerXAnchor.constraint(equalTo: mainContainerView.centerXAnchor).isActive = true
        
        mainContainerView.addSubview(pricesContainerView)
        pricesContainerView.topAnchor.constraint(equalTo: companyAddressLabel.bottomAnchor, constant: 15).isActive = true
        pricesContainerView.widthAnchor.constraint(equalTo: mainContainerView.widthAnchor).isActive = true
        pricesContainerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        pricesContainerView.centerXAnchor.constraint(equalTo: mainContainerView.centerXAnchor).isActive = true
        
        pricesContainerView.addSubview(regularPriceLabel)
        regularPriceLabel.leftAnchor.constraint(equalTo: pricesContainerView.leftAnchor, constant: 10).isActive = true
        regularPriceLabel.centerYAnchor.constraint(equalTo: pricesContainerView.centerYAnchor).isActive = true
        
        pricesContainerView.addSubview(oldPriceLabel)
        oldPriceLabel.leftAnchor.constraint(equalTo: regularPriceLabel.rightAnchor).isActive = true
        oldPriceLabel.centerYAnchor.constraint(equalTo: pricesContainerView.centerYAnchor).isActive = true
        
        pricesContainerView.addSubview(newPriceLabel)
        newPriceLabel.rightAnchor.constraint(equalTo: pricesContainerView.rightAnchor, constant: -10).isActive = true
        newPriceLabel.centerYAnchor.constraint(equalTo: pricesContainerView.centerYAnchor).isActive = true
        
        pricesContainerView.addSubview(dealPriceLabel)
        dealPriceLabel.rightAnchor.constraint(equalTo: newPriceLabel.leftAnchor).isActive = true
        dealPriceLabel.centerYAnchor.constraint(equalTo: pricesContainerView.centerYAnchor).isActive = true
        
        pricesContainerView.addSubview(priceImageView)
        priceImageView.rightAnchor.constraint(equalTo: dealPriceLabel.leftAnchor, constant: -10).isActive = true
        priceImageView.centerYAnchor.constraint(equalTo: pricesContainerView.centerYAnchor).isActive = true
        priceImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        priceImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        
        view.addSubview(secureDealButton)
        secureDealButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -tabBarHeight-20).isActive = true
        secureDealButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
        secureDealButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        secureDealButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
