//
//  TOWINKLIopMomentPlazaCell.swift
//  Jolyukinle
//
//  Created by mumu on 2026/1/6.
//

import UIKit

class TOWINKLIopMomentPlazaCell: UICollectionViewCell {
    
    private lazy var TOWINKLIoCellpbg: UIImageView = {
        let TOWINKLIopuserlip = UIImageView()
        TOWINKLIopuserlip.translatesAutoresizingMaskIntoConstraints = false
        TOWINKLIopuserlip.contentMode = .scaleToFill
        TOWINKLIopuserlip.image = TOWINKLIopMediaVaultDecoder.TOWINKLIopFetchVibeGraphic(TOWINKLIopAssetAlias: "Rectanglelentobe")
        return TOWINKLIopuserlip
    }()
    
//    private let TOWINKLIopPaperBackground = UIView()
     let TOWINKLIopAuthorAvatar = UIImageView()
   
    lazy var TOWINKLIopUsername: UILabel = {
        let TOWINKLIopTitle = UILabel()
       
        TOWINKLIopTitle.textColor = UIColor(red: 0.01, green: 0.4, blue: 0.68, alpha: 1)
        TOWINKLIopTitle.font = .systemFont(ofSize: 16, weight: .semibold)
        TOWINKLIopTitle.translatesAutoresizingMaskIntoConstraints = false
       
        return TOWINKLIopTitle
    }()
    
    lazy var TOWINKLIopPostTime: UILabel = {
        let TOWINKLIopTitle = UILabel()
       
        TOWINKLIopTitle.textColor = UIColor(red: 0.01, green: 0.4, blue: 0.68, alpha: 0.7000)
        TOWINKLIopTitle.font = .systemFont(ofSize: 12, weight: .regular)
        TOWINKLIopTitle.translatesAutoresizingMaskIntoConstraints = false
       
        return TOWINKLIopTitle
    }()
    
//    private let TOWINKLIopSpiritLabel = UILabel()
    
    lazy var TOWINKLIoAlertButton: UIButton = {
        let TOWINKLIopuserlip = UIButton()
        TOWINKLIopuserlip.setImage(TOWINKLIopMediaVaultDecoder.TOWINKLIopFetchVibeGraphic(TOWINKLIopAssetAlias: "TOWINKLIoAlertLon"), for: .normal)
       
        TOWINKLIopuserlip.translatesAutoresizingMaskIntoConstraints = false
        return TOWINKLIopuserlip
    }()
    
    lazy var TOWINKLIopDymdetauil: UILabel = {
        let TOWINKLIopTitle = UILabel()
        TOWINKLIopTitle.numberOfLines = 2
        TOWINKLIopTitle.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7000)
        TOWINKLIopTitle.font = .systemFont(ofSize: 14, weight: .medium)
        TOWINKLIopTitle.translatesAutoresizingMaskIntoConstraints = false
       
        return TOWINKLIopTitle
    }()
    
    private let TOWINKLIopPhotoTrioStack = UIStackView()
    
    var  TOWINKLIopone:UIImageView?
    var  TOWINKLIoptwo:UIImageView?
    var  TOWINKLIopthree:UIImageView?
    
    private  lazy var TOWINKLIopVoiceBadge: UILabel = {
        let badge = UILabel.init()
        badge.backgroundColor =  UIColor(red: 0.89, green: 0.98, blue: 1, alpha: 1)
        badge.layer.cornerRadius = 10
        badge.layer.masksToBounds = true
        badge.translatesAutoresizingMaskIntoConstraints = false
        badge.textColor = UIColor(red: 0.01, green: 0.22, blue: 0.38, alpha: 0.5000)
        badge.text = " Friendly comments"
        badge.font = UIFont(name: "Asap Condensed-Medium", size: 12)
        
        
       
        return badge
    }()
    
    lazy var TOWINKLIopraise: UIImageView = {
        let TOWINKLIopuserlip = UIImageView()
        TOWINKLIopuserlip.translatesAutoresizingMaskIntoConstraints = false
        TOWINKLIopuserlip.contentMode = .scaleToFill
        TOWINKLIopuserlip.image = TOWINKLIopMediaVaultDecoder.TOWINKLIopFetchVibeGraphic(TOWINKLIopAssetAlias: "TOWINKLIopraise")
        return TOWINKLIopuserlip
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        TOWINKLIopLayoutMoment()
    }
    
    required init?(coder: NSCoder) { fatalError() }

    private func TOWINKLIopLayoutMoment() {
      
        contentView.addSubview(TOWINKLIoCellpbg)
        contentView.addSubview(TOWINKLIopAuthorAvatar)
        
        
        contentView.addSubview(TOWINKLIopUsername)
        contentView.addSubview(TOWINKLIopPostTime)
        contentView.addSubview(TOWINKLIoAlertButton)
        
        contentView.addSubview(TOWINKLIopDymdetauil)
        contentView.addSubview(TOWINKLIopPhotoTrioStack)
        
        contentView.addSubview(TOWINKLIopVoiceBadge)
        contentView.addSubview(TOWINKLIopraise)
        let TOWINKLIopuserlip = UIImageView()
        TOWINKLIopuserlip.translatesAutoresizingMaskIntoConstraints = false
        TOWINKLIopuserlip.contentMode = .scaleToFill
        TOWINKLIopuserlip.image = TOWINKLIopMediaVaultDecoder.TOWINKLIopFetchVibeGraphic(TOWINKLIopAssetAlias: "TOWINKLIopuserlipsend")
        TOWINKLIopVoiceBadge.addSubview(TOWINKLIopuserlip)
        
        TOWINKLIopAuthorAvatar.backgroundColor = .systemGray5
        TOWINKLIopAuthorAvatar.layer.cornerRadius = 20
        TOWINKLIopAuthorAvatar.translatesAutoresizingMaskIntoConstraints = false
        TOWINKLIopAuthorAvatar.layer.borderColor = UIColor(red: 0.01, green: 0.4, blue: 0.68, alpha: 1).cgColor
        TOWINKLIopAuthorAvatar.layer.borderWidth = 2
        
    
        TOWINKLIopPhotoTrioStack.axis = .horizontal
        TOWINKLIopPhotoTrioStack.distribution = .fillEqually
        TOWINKLIopPhotoTrioStack.spacing = 8
        TOWINKLIopPhotoTrioStack.translatesAutoresizingMaskIntoConstraints = false
       
        
        for i in 0..<3 {
            let TOWINKLIopImg = UIImageView()
            TOWINKLIopImg.backgroundColor = .systemGray6
            TOWINKLIopImg.layer.cornerRadius = 12
            TOWINKLIopImg.clipsToBounds = true
            if i == 0 {
                self.TOWINKLIopone = TOWINKLIopImg
            }
            
            if i == 1 {
                self.TOWINKLIoptwo = TOWINKLIopImg
            }
            
            if i == 2 {
                self.TOWINKLIopthree = TOWINKLIopImg
            }
            TOWINKLIopPhotoTrioStack.addArrangedSubview(TOWINKLIopImg)
        }

        NSLayoutConstraint.activate([
            TOWINKLIoCellpbg.topAnchor.constraint(equalTo: contentView.topAnchor),
            TOWINKLIoCellpbg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            TOWINKLIoCellpbg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            TOWINKLIoCellpbg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            TOWINKLIopAuthorAvatar.topAnchor.constraint(equalTo: TOWINKLIoCellpbg.topAnchor, constant: 10),
            TOWINKLIopAuthorAvatar.leadingAnchor.constraint(equalTo: TOWINKLIoCellpbg.leadingAnchor, constant: 15),
            TOWINKLIopAuthorAvatar.widthAnchor.constraint(equalToConstant: 40),
            TOWINKLIopAuthorAvatar.heightAnchor.constraint(equalToConstant: 40),
            
            
            TOWINKLIopUsername.leadingAnchor.constraint(equalTo: TOWINKLIopAuthorAvatar.trailingAnchor, constant: 5),
            TOWINKLIopUsername.topAnchor.constraint(equalTo: TOWINKLIopAuthorAvatar.topAnchor),
            
            TOWINKLIopPostTime.leadingAnchor.constraint(equalTo: TOWINKLIopAuthorAvatar.trailingAnchor, constant: 5),
            TOWINKLIopPostTime.topAnchor.constraint(equalTo: TOWINKLIopUsername.bottomAnchor,constant: 4),
            
            TOWINKLIoAlertButton.topAnchor.constraint(equalTo: TOWINKLIoCellpbg.topAnchor, constant: 10),
            TOWINKLIoAlertButton.trailingAnchor.constraint(equalTo: TOWINKLIoCellpbg.trailingAnchor, constant: -12),
            TOWINKLIoAlertButton.widthAnchor.constraint(equalToConstant: 26),
            TOWINKLIoAlertButton.heightAnchor.constraint(equalToConstant: 26),
            
            
            
            TOWINKLIopDymdetauil.topAnchor.constraint(equalTo: TOWINKLIopAuthorAvatar.bottomAnchor, constant: 8),
            TOWINKLIopDymdetauil.leadingAnchor.constraint(equalTo: TOWINKLIoCellpbg.leadingAnchor, constant: 15),
            TOWINKLIopDymdetauil.trailingAnchor.constraint(equalTo: TOWINKLIoCellpbg.trailingAnchor, constant: -15),
            
            TOWINKLIopPhotoTrioStack.topAnchor.constraint(equalTo: TOWINKLIopDymdetauil.bottomAnchor, constant: 10),
            TOWINKLIopPhotoTrioStack.leadingAnchor.constraint(equalTo: TOWINKLIoCellpbg.leadingAnchor, constant: 15),
            TOWINKLIopPhotoTrioStack.trailingAnchor.constraint(equalTo: TOWINKLIoCellpbg.trailingAnchor, constant: -15),
            TOWINKLIopPhotoTrioStack.heightAnchor.constraint(equalToConstant: 130),
            
            TOWINKLIopVoiceBadge.leadingAnchor.constraint(equalTo: TOWINKLIoCellpbg.leadingAnchor, constant: 15),
            TOWINKLIopVoiceBadge.heightAnchor.constraint(equalToConstant: 34),
            TOWINKLIopVoiceBadge.trailingAnchor.constraint(equalTo: TOWINKLIoCellpbg.trailingAnchor, constant: -70),
            TOWINKLIopVoiceBadge.topAnchor.constraint(equalTo: TOWINKLIopPhotoTrioStack.bottomAnchor, constant: 10),
            
            TOWINKLIopuserlip.rightAnchor.constraint(equalTo: TOWINKLIopVoiceBadge.rightAnchor, constant: -10),
            TOWINKLIopuserlip.widthAnchor.constraint(equalToConstant: 18),
            TOWINKLIopuserlip.centerYAnchor.constraint(equalTo: TOWINKLIopVoiceBadge.centerYAnchor, constant: 0),
            TOWINKLIopuserlip.heightAnchor.constraint(equalToConstant: 18),
            
            
            TOWINKLIopraise.trailingAnchor.constraint(equalTo: TOWINKLIoCellpbg.trailingAnchor, constant: -12),
            TOWINKLIopraise.heightAnchor.constraint(equalToConstant: 26),
            TOWINKLIopraise.widthAnchor.constraint(equalToConstant: 26),
            TOWINKLIopraise.centerYAnchor.constraint(equalTo: TOWINKLIopVoiceBadge.centerYAnchor)
        ])
    }
}
