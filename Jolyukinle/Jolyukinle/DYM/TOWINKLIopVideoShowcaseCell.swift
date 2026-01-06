//
//  TOWINKLIopVideoShowcaseCell.swift
//  Jolyukinle
//
//  Created by mumu on 2026/1/6.
//

import UIKit

class TOWINKLIopVideoShowcaseCell: UICollectionViewCell {
    lazy var TOWINKLIoCellpbg: UIImageView = {
        let TOWINKLIopuserlip = UIImageView()
        TOWINKLIopuserlip.translatesAutoresizingMaskIntoConstraints = false
        TOWINKLIopuserlip.contentMode = .scaleToFill
        TOWINKLIopuserlip.image = UIImage(named: "Rectanglelentobe")
        return TOWINKLIopuserlip
    }()
    
    lazy var TOWINKLIoVideopbg: UIImageView = {
        let TOWINKLIopuserlip = UIImageView()
        TOWINKLIopuserlip.translatesAutoresizingMaskIntoConstraints = false
        TOWINKLIopuserlip.contentMode = .scaleToFill
        TOWINKLIopuserlip.backgroundColor = .lightGray
        return TOWINKLIopuserlip
    }()
    
//    private let TOWINKLIopPaperBackground = UIView()
    private let TOWINKLIopAuthorAvatar = UIImageView()
   
    lazy var TOWINKLIopUsername: UILabel = {
        let TOWINKLIopTitle = UILabel()
       
        TOWINKLIopTitle.textColor = UIColor(red: 0.01, green: 0.4, blue: 0.68, alpha: 1)
        TOWINKLIopTitle.font = .systemFont(ofSize: 16, weight: .semibold)
        TOWINKLIopTitle.translatesAutoresizingMaskIntoConstraints = false
       
        return TOWINKLIopTitle
    }()
    lazy var TOWINKLIopraise: UIImageView = {
        let TOWINKLIopuserlip = UIImageView()
        TOWINKLIopuserlip.translatesAutoresizingMaskIntoConstraints = false
        TOWINKLIopuserlip.contentMode = .scaleToFill
        TOWINKLIopuserlip.image = UIImage(named: "TOWINKLIopraise")
        return TOWINKLIopuserlip
    }()
    
    lazy var TOWINKLIocomment: UIImageView = {
        let TOWINKLIopuserlip = UIImageView()
        TOWINKLIopuserlip.translatesAutoresizingMaskIntoConstraints = false
        TOWINKLIopuserlip.contentMode = .scaleToFill
        TOWINKLIopuserlip.image = UIImage(named: "TOWINKLIoAcomment")
        return TOWINKLIopuserlip
    }()
    
    private let TOWINKLIopPlayOverlay = UIImageView(image: UIImage(systemName: "play.fill"))
    
    lazy var TOWINKLIoAlertButton: UIButton = {
        let TOWINKLIopuserlip = UIButton()
        TOWINKLIopuserlip.setImage(UIImage.init(named: "TOWINKLIoAlertLon"), for: .normal)
       
        TOWINKLIopuserlip.translatesAutoresizingMaskIntoConstraints = false
        return TOWINKLIopuserlip
    }()
    
    private let TOWINKLIopVibeLabel = UILabel()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        TOWINKLIopLayoutVideo()
    }
    
    required init?(coder: NSCoder) { fatalError() }

    private func TOWINKLIopLayoutVideo() {
        TOWINKLIopAuthorAvatar.layer.cornerRadius = 38
        TOWINKLIopAuthorAvatar.layer.masksToBounds = true
        TOWINKLIopAuthorAvatar.contentMode = .scaleAspectFill
        TOWINKLIopAuthorAvatar.layer.borderWidth = 1
        TOWINKLIopAuthorAvatar.layer.borderColor = UIColor(red: 0.01, green: 0.4, blue: 0.68, alpha: 1).cgColor
        
        TOWINKLIoVideopbg.layer.cornerRadius = 10
        TOWINKLIoVideopbg.layer.masksToBounds = true
        contentView.addSubview(TOWINKLIoCellpbg)
        contentView.addSubview(TOWINKLIoVideopbg)
        contentView.addSubview(TOWINKLIopAuthorAvatar)
        contentView.addSubview(TOWINKLIopUsername)
        
        contentView.addSubview(TOWINKLIopraise)
        contentView.addSubview(TOWINKLIocomment)
        
        contentView.addSubview(TOWINKLIoAlertButton)
        
    
       
        
        TOWINKLIopPlayOverlay.tintColor = .white
        TOWINKLIopPlayOverlay.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(TOWINKLIopPlayOverlay)
        
        TOWINKLIopVibeLabel.text = "Join our live chat to find Christmas photo buddies and share pro tips 📸"
        TOWINKLIopVibeLabel.numberOfLines = 2
        TOWINKLIopVibeLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        TOWINKLIopVibeLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(TOWINKLIopVibeLabel)

        NSLayoutConstraint.activate([
            TOWINKLIoCellpbg.topAnchor.constraint(equalTo: contentView.topAnchor),
            TOWINKLIoCellpbg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            TOWINKLIoCellpbg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            TOWINKLIoCellpbg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            
            TOWINKLIoVideopbg.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
            TOWINKLIoVideopbg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            TOWINKLIoVideopbg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -58),
            TOWINKLIoVideopbg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -54),
            
            
            TOWINKLIopPlayOverlay.widthAnchor.constraint(equalToConstant: 64),
            TOWINKLIopPlayOverlay.heightAnchor.constraint(equalToConstant: 64),
            TOWINKLIopPlayOverlay.centerXAnchor.constraint(equalTo: TOWINKLIoVideopbg.centerXAnchor),
            TOWINKLIopPlayOverlay.centerYAnchor.constraint(equalTo: TOWINKLIoVideopbg.centerYAnchor),
            
            TOWINKLIopAuthorAvatar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10),
            TOWINKLIopAuthorAvatar.widthAnchor.constraint(equalToConstant: 38),
            TOWINKLIopAuthorAvatar.topAnchor.constraint(equalTo: TOWINKLIoVideopbg.topAnchor, constant:3),
            
            TOWINKLIopAuthorAvatar.heightAnchor.constraint(equalToConstant: 38),
            
            TOWINKLIopUsername.centerXAnchor.constraint(equalTo: TOWINKLIopAuthorAvatar.centerXAnchor),
            TOWINKLIopUsername.topAnchor.constraint(equalTo: TOWINKLIopAuthorAvatar.bottomAnchor, constant: 3),
            TOWINKLIopUsername.widthAnchor.constraint(equalToConstant: 38),
            
            
            
            
            TOWINKLIopraise.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10),
            TOWINKLIopraise.topAnchor.constraint(equalTo: TOWINKLIopAuthorAvatar.bottomAnchor, constant: 32),
            TOWINKLIopraise.widthAnchor.constraint(equalToConstant: 26),
            TOWINKLIopraise.heightAnchor.constraint(equalToConstant: 26),
            
            TOWINKLIocomment.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10),
            TOWINKLIocomment.topAnchor.constraint(equalTo: TOWINKLIopraise.bottomAnchor, constant: 32),
            TOWINKLIocomment.widthAnchor.constraint(equalToConstant: 26),
            TOWINKLIocomment.heightAnchor.constraint(equalToConstant: 26),
            
            TOWINKLIoAlertButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10),
            TOWINKLIoAlertButton.bottomAnchor.constraint(equalTo: TOWINKLIoVideopbg.bottomAnchor),
            TOWINKLIoAlertButton.widthAnchor.constraint(equalToConstant: 26),
            TOWINKLIoAlertButton.heightAnchor.constraint(equalToConstant: 26),
            
            
            TOWINKLIopVibeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10),
            TOWINKLIopVibeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            TOWINKLIopVibeLabel.topAnchor.constraint(equalTo: TOWINKLIoVideopbg.bottomAnchor, constant: 8)
        ])
    }
}
