//
//  MainViewController.swift
//  DealTyme
//
//  Created by Ali Apple on 10/01/2019.
//  Copyright © 2019 Ali Apple. All rights reserved.
//

import UIKit

class SavedDealsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let userInstance = UserInfo.sharedInstance
    let cellId = "cellId2"
    var namesArray = [String]()
    var resultArray = [String]()
    
    let lineSeparator1: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 238, g: 238, b: 239)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let segmentedControlBottomLine1: UIView = {
        let view = UIView()
        //        view.backgroundColor = UIColor(r: 238, g: 238, b: 239)
        view.backgroundColor = UIColor(r: 81, g: 172, b: 59)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let segmentedControlBottomLine2: UIView = {
        let view = UIView()
        //        view.backgroundColor = UIColor(r: 238, g: 238, b: 239)
        view.backgroundColor = UIColor(r: 81, g: 172, b: 59)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var myTableView: UITableView = {
        var table = UITableView()
        //        table.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    let items = ["Secured Deals", "Redeemed Deals"]
    lazy var segmentedControl: UISegmentedControl = {
        var sc = UISegmentedControl(items: self.items)
        sc.selectedSegmentIndex = 0
        sc.tintColor = .black
        sc.addTarget(self, action: #selector(handleSegmentedControl(sender:)), for: UIControl.Event.valueChanged)
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()
    
    @objc func handleSegmentedControl(sender: UISegmentedControl){
        let index = sender.selectedSegmentIndex
        switch index {
        case 0:
            segmentedControlBottomLine1.isHidden = false
            segmentedControlBottomLine2.isHidden = true
            print("0 index \(segmentedControlBottomLine1.isHidden)")
            print("0 index \(segmentedControlBottomLine2.isHidden)")
        case 1:
            segmentedControlBottomLine1.isHidden = true
            segmentedControlBottomLine2.isHidden = false
            print("1 index \(segmentedControlBottomLine1.isHidden)")
            print("1 index \(segmentedControlBottomLine2.isHidden)")
        default:
            break
        }
    }
    
    var topBarHeight:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.removeBorder()
        segmentedControlBottomLine2.isHidden = true
        view.backgroundColor = .white
        self.navigationItem.setHidesBackButton(true, animated:true);
//        let searchBarButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleSearchBarButton))
//        searchBarButton.tintColor = .black
        self.navigationItem.title = "SAVED"
//        self.navigationItem.leftBarButtonItem = searchBarButton
        myTableView.delegate = self
        myTableView.dataSource = self
        self.myTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        topBarHeight = UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
        myTableView.register(UserCell.self, forCellReuseIdentifier: cellId)
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @objc func handleSearchBarButton(){
        
    }
    
    func setupViews(){
        view.addSubview(segmentedControl)
        segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: topBarHeight).isActive = true
        segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        segmentedControl.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(segmentedControlBottomLine1)
        segmentedControlBottomLine1.bottomAnchor.constraint(equalTo: segmentedControl.bottomAnchor).isActive = true
        segmentedControlBottomLine1.widthAnchor.constraint(equalToConstant: view.frame.width/2.0).isActive = true
        segmentedControlBottomLine1.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        segmentedControlBottomLine1.rightAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        segmentedControlBottomLine1.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        view.addSubview(segmentedControlBottomLine2)
        segmentedControlBottomLine2.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: -1).isActive = true
        segmentedControlBottomLine2.widthAnchor.constraint(equalToConstant: view.frame.width/2.0).isActive = true
        segmentedControlBottomLine2.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        segmentedControlBottomLine2.leftAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        segmentedControlBottomLine2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        view.addSubview(lineSeparator1)
        lineSeparator1.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 0).isActive = true
        lineSeparator1.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        lineSeparator1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lineSeparator1.heightAnchor.constraint(equalToConstant: 2).isActive = true
        //
        view.addSubview(myTableView)
        myTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myTableView.topAnchor.constraint(equalTo: segmentedControlBottomLine2.bottomAnchor, constant: 2).isActive = true
        myTableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! UserCell
        cell.oldPriceLabel.removeFromSuperview()
        cell.newPriceLabel.removeFromSuperview()
        cell.nextImageView.removeFromSuperview()
        cell.dealHeadingLabel.text = "Happy Monday!"
        cell.dealDescriptionLabel.text = "Monday means a new Starbucks Deal! Don't miss out on these awesome deals starting every monday every week. See you at Starbucks soon, Have a nice day!"
        cell.flashSaleLabel.text = "Flash Sale:"
        //        cell.flashSaleHoursLabel.text = " h m s"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height/2.5
    }
    
}
