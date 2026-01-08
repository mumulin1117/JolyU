//
//  TOWINKLIopRoomCardCell.swift
//  Jolyukinle
//
//  Created by  on 2026/1/6.
//

import UIKit

// MARK: - Custom Cell for Room
class TOWINKLIopRoomCardCell: UICollectionViewCell {
    private lazy var TOWINKLIoCellpbg: UIImageView = {
        let TOWINKLIopuserlip = UIImageView()
        TOWINKLIopuserlip.translatesAutoresizingMaskIntoConstraints = false
        TOWINKLIopuserlip.contentMode = .scaleToFill
        TOWINKLIopuserlip.image = TOWINKLIopMediaVaultDecoder.TOWINKLIopFetchVibeGraphic(TOWINKLIopAssetAlias: "TOWINKLIoCellpbg")
        return TOWINKLIopuserlip
    }()
   
   
    
    lazy var TOWINKLIopRoomCoverlip: UIImageView = {
        let TOWINKLIopuserlip = UIImageView()
        TOWINKLIopuserlip.translatesAutoresizingMaskIntoConstraints = false
        TOWINKLIopuserlip.contentMode = .scaleAspectFill
        TOWINKLIopuserlip.layer.masksToBounds = true
        TOWINKLIopuserlip.layer.cornerRadius = 20
        return TOWINKLIopuserlip
    }()
    var TOWINKLIopuserlip = UIImageView()
    lazy var TOWINKLIopalert: UIButton = {
        let TOWINKLIopuserlip = UIButton()
        TOWINKLIopuserlip.setImage(TOWINKLIopMediaVaultDecoder.TOWINKLIopFetchVibeGraphic(TOWINKLIopAssetAlias: "TOWINKLIopalert"), for: .normal)
        TOWINKLIopuserlip.translatesAutoresizingMaskIntoConstraints = false
        return TOWINKLIopuserlip
    }()
    
   
    
    lazy var TOWINKLIoRoomname: UILabel = {
        let roomTitle = UILabel()
       
        roomTitle.textColor = UIColor(red: 0.02, green: 0.33, blue: 0.56, alpha: 1)
        roomTitle.font = .systemFont(ofSize: 16, weight: .semibold)
        roomTitle.translatesAutoresizingMaskIntoConstraints = false
        return roomTitle
    }()
    
    lazy var TOWINKLIoRoomDetail: UILabel = {
        let roomTitle = UILabel()
        roomTitle.numberOfLines = 2
        roomTitle.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7000)
        roomTitle.font = .systemFont(ofSize: 12, weight: .semibold)
        roomTitle.translatesAutoresizingMaskIntoConstraints = false
        return roomTitle
    }()
    
    
    lazy var TOWINKLIojoinButton: UIButton = {
        let TOWINKLIopuserlip = UIButton()
        TOWINKLIopuserlip.isUserInteractionEnabled = false
        TOWINKLIopuserlip.setBackgroundImage(TOWINKLIopMediaVaultDecoder.TOWINKLIopFetchVibeGraphic(TOWINKLIopAssetAlias: "TOWINKLIojoinButton"), for: .normal)
        TOWINKLIopuserlip.setTitle("Join Chat", for: .normal)
        TOWINKLIopuserlip.titleLabel?.font = UIFont(name: "Asap Condensed-ExtraBold", size: 16)
        TOWINKLIopuserlip.setTitleColor(.white, for: .normal)
        TOWINKLIopuserlip.translatesAutoresizingMaskIntoConstraints = false
        return TOWINKLIopuserlip
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        TOWINKLIopuserlip.contentMode = .scaleAspectFill
        TOWINKLIopuserlip.translatesAutoresizingMaskIntoConstraints = false
        TOWINKLIopuserlip.layer.cornerRadius = 10
        TOWINKLIopuserlip.layer.masksToBounds = true
        
        contentView.addSubview(TOWINKLIoCellpbg)
        contentView.addSubview(TOWINKLIopRoomCoverlip)
        contentView.addSubview(TOWINKLIopuserlip)
        contentView.addSubview(TOWINKLIopalert)
        
        contentView.addSubview(TOWINKLIoRoomname)
        contentView.addSubview(TOWINKLIoRoomDetail)
        
        contentView.addSubview(TOWINKLIojoinButton)
        
        
        NSLayoutConstraint.activate([
            TOWINKLIoCellpbg.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            TOWINKLIoCellpbg.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            TOWINKLIoCellpbg.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            TOWINKLIoCellpbg.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,constant: -14),
            
            
            TOWINKLIopRoomCoverlip.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            TOWINKLIopRoomCoverlip.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            TOWINKLIopRoomCoverlip.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            TOWINKLIopRoomCoverlip.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,constant: -14 - 82),
            
            
            TOWINKLIopuserlip.widthAnchor.constraint(equalToConstant: 20),
            TOWINKLIopuserlip.heightAnchor.constraint(equalToConstant: 20),
            TOWINKLIopuserlip.leftAnchor.constraint(equalTo: self.contentView.leftAnchor,constant: 12),
            TOWINKLIopuserlip.bottomAnchor.constraint(equalTo: self.TOWINKLIopRoomCoverlip.bottomAnchor,constant: -8),
            
            
            TOWINKLIopalert.widthAnchor.constraint(equalToConstant: 20),
            TOWINKLIopalert.heightAnchor.constraint(equalToConstant: 20),
            TOWINKLIopalert.rightAnchor.constraint(equalTo: self.contentView.rightAnchor,constant: -10),
            TOWINKLIopalert.bottomAnchor.constraint(equalTo: self.TOWINKLIopRoomCoverlip.bottomAnchor,constant: -8),
            
            
            TOWINKLIoRoomname.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 8),
            TOWINKLIoRoomname.topAnchor.constraint(equalTo: TOWINKLIopRoomCoverlip.bottomAnchor, constant: 6),
            TOWINKLIoRoomname.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -8),
            
            TOWINKLIoRoomDetail.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 8),
            TOWINKLIoRoomDetail.topAnchor.constraint(equalTo: TOWINKLIoRoomname.bottomAnchor, constant: 4),
            TOWINKLIoRoomDetail.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -8),
            
            
            
            TOWINKLIojoinButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            TOWINKLIojoinButton.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            TOWINKLIojoinButton.widthAnchor.constraint(equalToConstant: 89),
            TOWINKLIojoinButton.heightAnchor.constraint(equalToConstant: 29)
        ])
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
