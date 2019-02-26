import UIKit

class UserCell: UITableViewCell {
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    let cellMainView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //        view.backgroundColor = .blue
        //        view.clipsToBounds = true
        view.layer.cornerRadius = 7
        view.layer.borderColor = UIColor(r: 246, g: 249, b: 248).cgColor
        view.layer.borderWidth = 2
        return view
    }()
    
    let topView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //        view.backgroundColor = .green
        view.clipsToBounds = true
        view.layer.cornerRadius = 7
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return view
    }()
    
    let topImageView: UIImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //        view.backgroundColor = .red
        view.image = UIImage(named: "starbucks")
        view.clipsToBounds = true
        view.layer.cornerRadius = 7
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return view
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
//        view.contentMode = .scaleAspectFit
        //        view.frame = CGRect(x:0, y:0, width:50, height:50)
        //        view.layer.cornerRadius =
        //        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return view
    }()
    
    let companyNameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //        label.textColor = .white
        label.sizeToFit()
        let strokeTextAttributes = [
            NSAttributedString.Key.strokeColor : UIColor.black,
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.strokeWidth : -4.0,
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 22)]
            as [NSAttributedString.Key : Any]
        //Making outline here
        label.attributedText = NSMutableAttributedString(string: "Starbucks", attributes: strokeTextAttributes)
        //        label.text = "Starbucks"
        //        label.backgroundColor = .black
        //        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    let companyAddressLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //        label.textColor = .white
        label.sizeToFit()
        let strokeTextAttributes = [
            NSAttributedString.Key.strokeColor : UIColor.black,
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.strokeWidth : -4.0,
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12)]
            as [NSAttributedString.Key : Any]
        //Making outline here
        label.attributedText = NSMutableAttributedString(string: "99 Newcastle Dr @ 3km", attributes: strokeTextAttributes)
        //        label.text = "99 Newcastle Dr @ 3km"
        //        label.backgroundColor = .black
        //        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let dealDescriptionContainerView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //        view.backgroundColor = .orange
        //        view.clipsToBounds = true
        //        view.layer.cornerRadius = 7
        //        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return view
    }()
    
    let bottomView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(r: 247, g: 248, b: 250)
        view.clipsToBounds = true
        view.layer.cornerRadius = 7
        //        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(r:142, g:142, b:142).cgColor
        view.layer.masksToBounds = false
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        //        view.layer.shadowRadius = 1
        view.layer.shadowColor = UIColor(r:38, g:168, b:52).cgColor
        view.layer.shadowOpacity = 1
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
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
    
    let hourGlassImageView: UIImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //        view.backgroundColor = .red
        view.clipsToBounds = true
        view.image = UIImage(named: "hourglass")
        view.contentMode = .scaleAspectFit
        //        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return view
    }()
    
    let flashSaleLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.backgroundColor = .clear
        label.sizeToFit()
        label.text = "Flash Sale:"
        //        label.backgroundColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let flashSaleHoursLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.backgroundColor = .clear
        label.text = "02"
        label.sizeToFit()
        //        label.backgroundColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    let flashSaleHLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.backgroundColor = .clear
        label.text = "h"
        label.sizeToFit()
        //        label.backgroundColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 10)
        return label
    }()
    
    let flashSaleMinutesLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.backgroundColor = .clear
        label.text = "35"
        label.sizeToFit()
        //        label.backgroundColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    let flashSaleMLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.backgroundColor = .clear
        label.text = "m"
        label.sizeToFit()
        //        label.backgroundColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 10)
        return label
    }()
    
    let flashSaleSecondsLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.backgroundColor = .clear
        label.text = "25"
        label.sizeToFit()
        //        label.backgroundColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    let flashSaleSLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.backgroundColor = .clear
        label.text = "s"
        label.sizeToFit()
        //        label.backgroundColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 10)
        return label
    }()
    
    let oldPriceLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.backgroundColor = .clear
        let attrString = NSAttributedString(string: "$10.00", attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue])
        label.attributedText = attrString
        label.sizeToFit()
        //        label.backgroundColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let newPriceLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(r:38, g:168, b:52)
        label.backgroundColor = .clear
        label.text = "$6.00"
        label.sizeToFit()
        //        label.backgroundColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let nextImageView: UIImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //        view.backgroundColor = .red
        view.clipsToBounds = true
        view.image = UIImage(named: "arrow")
        //        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        
        self.addSubview(cellMainView)
        cellMainView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20).isActive = true
        cellMainView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        cellMainView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -20).isActive = true
        cellMainView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        cellMainView.addSubview(topView) // , constant: 5
        topView.topAnchor.constraint(equalTo: cellMainView.topAnchor).isActive = true
        topView.leftAnchor.constraint(equalTo: cellMainView.leftAnchor).isActive = true
        topView.rightAnchor.constraint(equalTo: cellMainView.rightAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: cellMainView.heightAnchor, multiplier: 0.8).isActive = true
        
        cellMainView.addSubview(bottomView) // , constant: 5
        bottomView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        bottomView.leftAnchor.constraint(equalTo: topView.leftAnchor).isActive = true
        bottomView.rightAnchor.constraint(equalTo: topView.rightAnchor).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: cellMainView.bottomAnchor).isActive = true
        
        topView.addSubview(topImageView)
        topImageView.topAnchor.constraint(equalTo: topView.topAnchor).isActive = true
        topImageView.leftAnchor.constraint(equalTo: topView.leftAnchor).isActive = true
        topImageView.rightAnchor.constraint(equalTo: topView.rightAnchor).isActive = true
        topImageView.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.55).isActive = true
        
        topImageView.addSubview(dealTypeImageView)
        dealTypeImageView.rightAnchor.constraint(equalTo: topImageView.rightAnchor, constant: -5).isActive = true
        dealTypeImageView.topAnchor.constraint(equalTo: topImageView.topAnchor, constant: 5).isActive = true
        dealTypeImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        dealTypeImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        topImageView.addSubview(companyNameLabel)
        companyNameLabel.centerXAnchor.constraint(equalTo: topImageView.centerXAnchor).isActive = true
        companyNameLabel.centerYAnchor.constraint(equalTo: topImageView.centerYAnchor).isActive = true
        
        topImageView.addSubview(companyAddressLabel)
        companyAddressLabel.centerXAnchor.constraint(equalTo: topImageView.centerXAnchor).isActive = true
        companyAddressLabel.topAnchor.constraint(equalTo: companyNameLabel.bottomAnchor, constant: 10).isActive = true
        
        topView.addSubview(dealDescriptionContainerView)
        dealDescriptionContainerView.topAnchor.constraint(equalTo: topImageView.bottomAnchor).isActive = true
        dealDescriptionContainerView.leftAnchor.constraint(equalTo: topView.leftAnchor).isActive = true
        dealDescriptionContainerView.rightAnchor.constraint(equalTo: topView.rightAnchor).isActive = true
        dealDescriptionContainerView.bottomAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        
        dealDescriptionContainerView.addSubview(dealHeadingLabel)
        //        offerText.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dealHeadingLabel.topAnchor.constraint(equalTo: dealDescriptionContainerView.topAnchor, constant: 10).isActive = true
        dealHeadingLabel.leftAnchor.constraint(equalTo: dealDescriptionContainerView.leftAnchor, constant: 10).isActive = true
        //        offerText.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        dealDescriptionContainerView.addSubview(dealDescriptionLabel)
        //        offerText.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dealDescriptionLabel.topAnchor.constraint(equalTo: dealHeadingLabel.bottomAnchor, constant: 1).isActive = true
        dealDescriptionLabel.leftAnchor.constraint(equalTo: dealDescriptionContainerView.leftAnchor, constant: 10).isActive = true
        //        offerText.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        dealDescriptionLabel.widthAnchor.constraint(equalTo: dealDescriptionContainerView.widthAnchor, constant: -20).isActive = true
        dealDescriptionLabel.heightAnchor.constraint(equalTo: dealDescriptionContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        bottomView.addSubview(hourGlassImageView)
        hourGlassImageView.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        hourGlassImageView.leftAnchor.constraint(equalTo: bottomView.leftAnchor, constant: 10).isActive = true
        hourGlassImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        hourGlassImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        bottomView.addSubview(flashSaleLabel)
        flashSaleLabel.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        flashSaleLabel.leftAnchor.constraint(equalTo: hourGlassImageView.rightAnchor, constant: 10).isActive = true
        //        flashSaleLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        //        flashSaleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        bottomView.addSubview(flashSaleHoursLabel)
        flashSaleHoursLabel.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        flashSaleHoursLabel.leftAnchor.constraint(equalTo: flashSaleLabel.rightAnchor, constant: 5).isActive = true
        //        flashSaleHoursLabel.widthAnchor.constraint(equalToConstant: 25).isActive = true
        //        flashSaleHoursLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        bottomView.addSubview(flashSaleHLabel)
        flashSaleHLabel.bottomAnchor.constraint(equalTo: flashSaleHoursLabel.bottomAnchor).isActive = true
        flashSaleHLabel.leftAnchor.constraint(equalTo: flashSaleHoursLabel.rightAnchor).isActive = true
        //        flashSaleHLabel.widthAnchor.constraint(equalToConstant: 10).isActive = true
        //        flashSaleHLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        bottomView.addSubview(flashSaleMinutesLabel)
        flashSaleMinutesLabel.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        flashSaleMinutesLabel.leftAnchor.constraint(equalTo: flashSaleHLabel.rightAnchor, constant: 5).isActive = true
        //        flashSaleMinutesLabel.widthAnchor.constraint(equalToConstant: 35).isActive = true
        //        flashSaleMinutesLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        bottomView.addSubview(flashSaleMLabel)
        flashSaleMLabel.bottomAnchor.constraint(equalTo: flashSaleHoursLabel.bottomAnchor).isActive = true
        flashSaleMLabel.leftAnchor.constraint(equalTo: flashSaleMinutesLabel.rightAnchor).isActive = true
        //        flashSaleMLabel.widthAnchor.constraint(equalToConstant: 10).isActive = true
        //        flashSaleMLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        bottomView.addSubview(flashSaleSecondsLabel)
        flashSaleSecondsLabel.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        flashSaleSecondsLabel.leftAnchor.constraint(equalTo: flashSaleMLabel.rightAnchor, constant: 5).isActive = true
        //        flashSaleSecondsLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        //        flashSaleSecondsLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        bottomView.addSubview(flashSaleSLabel)
        flashSaleSLabel.bottomAnchor.constraint(equalTo: flashSaleHoursLabel.bottomAnchor).isActive = true
        flashSaleSLabel.leftAnchor.constraint(equalTo: flashSaleSecondsLabel.rightAnchor).isActive = true
        //        flashSaleSLabel.widthAnchor.constraint(equalToConstant: 10).isActive = true
        //        flashSaleSLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        bottomView.addSubview(nextImageView)
        nextImageView.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        nextImageView.rightAnchor.constraint(equalTo: bottomView.rightAnchor, constant: -10).isActive = true
        nextImageView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        nextImageView.heightAnchor.constraint(equalToConstant: 17).isActive = true
        
        bottomView.addSubview(newPriceLabel)
        newPriceLabel.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        newPriceLabel.rightAnchor.constraint(equalTo: nextImageView.leftAnchor, constant: -10).isActive = true
        
        bottomView.addSubview(oldPriceLabel)
        oldPriceLabel.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        oldPriceLabel.rightAnchor.constraint(equalTo: newPriceLabel.leftAnchor, constant: -10).isActive = true
        
    }
    
    //        init(frame: CGRect, title: String) {
    //            super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
    //        }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
