//
//  OnBoardingCellViewController.swift
//  DealTyme
//
//  Created by Ali Apple on 15/02/2019.
//  Copyright © 2019 Ali Apple. All rights reserved.
//

import UIKit

class OnBoardingViewCell: UICollectionViewCell {
    
    override init(frame: CGRect){
        super.init(frame: frame)
//        backgroundColor = .orange
        setupViews()
    }

    let backCoverImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "greenbackcover")
        //        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let dealTymeWhiteImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "logowhite")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let welcomeHeaderLabel: UILabel = {
        let label = UILabel()
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        label.attributedText = NSAttributedString(string: "Welcome",
                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.paragraphStyle: centeredParagraphStyle])
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        label.font = UIFont.boldSystemFont(ofSize: 28)
        return label
    }()
    
    let painLabel: UILabel = {
        let label = UILabel()
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        label.attributedText = NSAttributedString(string: "There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain",
                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.paragraphStyle: centeredParagraphStyle])
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        label.numberOfLines = 4
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    func setupViews(){
        self.addSubview(backCoverImageView)
        backCoverImageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        backCoverImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
        backCoverImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        backCoverImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true

        backCoverImageView.addSubview(dealTymeWhiteImageView)
        dealTymeWhiteImageView.widthAnchor.constraint(equalToConstant: 180).isActive = true
        dealTymeWhiteImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        dealTymeWhiteImageView.centerXAnchor.constraint(equalTo: backCoverImageView.centerXAnchor).isActive = true
        dealTymeWhiteImageView.topAnchor.constraint(equalTo: backCoverImageView.topAnchor, constant: 50).isActive = true
        
        self.addSubview(welcomeHeaderLabel)
        welcomeHeaderLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        welcomeHeaderLabel.topAnchor.constraint(equalTo: backCoverImageView.bottomAnchor, constant: 40).isActive = true
        
        self.addSubview(painLabel)
        painLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        painLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -40).isActive = true
        painLabel.topAnchor.constraint(equalTo: welcomeHeaderLabel.bottomAnchor, constant: 40).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }

}
