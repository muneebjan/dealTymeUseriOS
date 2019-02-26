//
//  SettingOnBoardingViewController.swift
//  DealTyme
//
//  Created by Ali Apple on 14/02/2019.
//  Copyright © 2019 Ali Apple. All rights reserved.
//

import UIKit

class SettingsOnBoardingViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITextFieldDelegate, UICollectionViewDelegateFlowLayout {
    
    let collectionView: UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collection.backgroundColor = .clear
        collection.alwaysBounceHorizontal = true
        collection.layer.cornerRadius = 20
        collection.layer.borderWidth = 2
        collection.clipsToBounds = true
        collection.layer.borderColor = UIColor(r: 246, g: 249, b: 248).cgColor
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.isScrollEnabled = false
        return collection
    }()
    
    let cellId = "cellId"
    
    let pageControl: UIPageControl = {
        let pg = UIPageControl()
        pg.translatesAutoresizingMaskIntoConstraints = false
        pg.currentPage = 0
        pg.numberOfPages = 4
        pg.currentPageIndicatorTintColor = .black
        pg.pageIndicatorTintColor = .lightGray
        pg.sizeToFit()
        pg.isEnabled = false
        return pg
    }()
    
    var skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.setTitle("Skip", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.borderColor = UIColor.gray.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handleSkip), for:.touchUpInside)
        return button
    }()
    
    @objc func handleSkip(){
//        pageControl.next += 1
    }
    
    var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 80, g:169, b:53)
        button.setTitle("Next", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 50/2
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handleNext), for:.touchUpInside)
        return button
    }()
    
    @objc func handleNext(){
        let  nextPath = min(self.pageControl.currentPage + 1, 3)
        self.pageControl.currentPage = nextPath
        let indexPath = IndexPath(item: nextPath, section: 0)
        self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
//        pageControl.next += 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(self.collectionView)
        self.collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        self.collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        self.collectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.65).isActive = true
        self.collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        self.collectionView.register(OnBoardingViewCell.self, forCellWithReuseIdentifier: cellId)
        self.collectionView.isPagingEnabled = true
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! OnBoardingViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

//        let topInset = self.view.frame.height - self.collectionView.contentSize.height
//        if topInset < self.collectionView.frame.height{
//            return UIEdgeInsets(top: topInset, left: 0, bottom: 0, right: 0)
//        }
//        else {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        }
    }
    
    func setupViews(){
        view.addSubview(pageControl)
        pageControl.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(nextButton)
        nextButton.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 20).isActive = true
        nextButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(skipButton)
        skipButton.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 20).isActive = true
        skipButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
        skipButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        skipButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }

}

//class OnBoardingCell: BaseCell {
//
//    let mainView: UIView = {
//        var view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .white
//        view.layer.borderColor = UIColor(r: 246, g: 249, b: 248).cgColor
//        view.layer.borderWidth = 2
//        view.clipsToBounds = true
//        view.layer.cornerRadius = 20
//        return view
//    }()
//
//    let backCoverImageView: UIImageView = {
//        var imageView = UIImageView()
//        imageView.image = UIImage(named: "greenbackcover")
//        //        imageView.contentMode = .scaleAspectFit
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
//
//    let dealTymeWhiteImageView: UIImageView = {
//        var imageView = UIImageView()
//        imageView.image = UIImage(named: "logowhite")
//        imageView.contentMode = .scaleAspectFit
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
//
//
//    override func setupViews() {
//        super.setupViews()
//
//        self.addSubview(mainView)
//        mainView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -60).isActive = true
//        mainView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7).isActive = true
//        mainView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        mainView.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
//
//        mainView.addSubview(backCoverImageView)
//        backCoverImageView.widthAnchor.constraint(equalTo: mainView.widthAnchor).isActive = true
//        backCoverImageView.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.6).isActive = true
//        backCoverImageView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
//        backCoverImageView.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
//
//        backCoverImageView.addSubview(dealTymeWhiteImageView)
//        dealTymeWhiteImageView.widthAnchor.constraint(equalToConstant: 180).isActive = true
//        dealTymeWhiteImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        dealTymeWhiteImageView.centerXAnchor.constraint(equalTo: backCoverImageView.centerXAnchor).isActive = true
//        dealTymeWhiteImageView.topAnchor.constraint(equalTo: backCoverImageView.topAnchor, constant: 50).isActive = true
//    }
//
//}
//
//
//
