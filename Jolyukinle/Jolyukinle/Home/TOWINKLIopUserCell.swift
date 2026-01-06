//
//  TOWINKLIopUserCell.swift
//  Jolyukinle
//
//  Created by  on 2026/1/6.
//

import UIKit

class TOWINKLIopUserCell: UICollectionViewCell {
    var TOWINKLIopuserlip = UIImageView()
   
    lazy var TOWINKLIopusername: UILabel = {
        let roomTitle = UILabel()
       
        roomTitle.textColor = UIColor(red: 0.01, green: 0.22, blue: 0.38, alpha: 1)
        roomTitle.font = .systemFont(ofSize: 16, weight: .semibold)
        roomTitle.translatesAutoresizingMaskIntoConstraints = false
        return roomTitle
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        TOWINKLIopuserlip.translatesAutoresizingMaskIntoConstraints = false
        TOWINKLIopuserlip.layer.cornerRadius = 6
        TOWINKLIopuserlip.layer.masksToBounds = true
        TOWINKLIopuserlip.layer.borderColor = UIColor(red: 0.01, green: 0.4, blue: 0.68, alpha: 1).cgColor
        TOWINKLIopuserlip.layer.masksToBounds = true
        TOWINKLIopuserlip.layer.borderWidth = 2
        
        
        
        contentView.backgroundColor = .clear
        
        
        contentView.addSubview(TOWINKLIopuserlip)
        contentView.addSubview(TOWINKLIopusername)
        
        NSLayoutConstraint.activate([
            TOWINKLIopuserlip.widthAnchor.constraint(equalToConstant: 50),
            TOWINKLIopuserlip.heightAnchor.constraint(equalToConstant: 50),
            TOWINKLIopuserlip.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            TOWINKLIopuserlip.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            
            TOWINKLIopusername.topAnchor.constraint(equalTo: TOWINKLIopuserlip.bottomAnchor, constant: 4),
            TOWINKLIopusername.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 3),
            TOWINKLIopusername.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -3),
        ])
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
