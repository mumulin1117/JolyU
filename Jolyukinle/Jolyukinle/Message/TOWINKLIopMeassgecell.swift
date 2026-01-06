//
//  TOWINKLIopMeassgecell.swift
//  Jolyukinle
//
//  Created by mumu on 2026/1/6.
//

import UIKit

class TOWINKLIopMeassgecell: UICollectionViewCell {
    lazy var TOWINKLIoCellpbg: UIImageView = {
        let TOWINKLIopuserlip = UIImageView()
        TOWINKLIopuserlip.translatesAutoresizingMaskIntoConstraints = false
        TOWINKLIopuserlip.contentMode = .scaleToFill
        TOWINKLIopuserlip.image = UIImage(named: "joiyaubdimChaBg")
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
 
    
  
    private let TOWINKLIopVibeLabel = UILabel()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        TOWINKLIopLayoutVideo()
    }
    
    required init?(coder: NSCoder) { fatalError() }

    private func TOWINKLIopLayoutVideo() {
        TOWINKLIopAuthorAvatar.layer.cornerRadius = 30
        TOWINKLIopAuthorAvatar.layer.masksToBounds = true
        TOWINKLIopAuthorAvatar.contentMode = .scaleAspectFill
        TOWINKLIopAuthorAvatar.layer.borderWidth = 1
        TOWINKLIopAuthorAvatar.layer.borderColor = UIColor(red: 0.01, green: 0.4, blue: 0.68, alpha: 1).cgColor
        
       
        contentView.addSubview(TOWINKLIoCellpbg)
       
        contentView.addSubview(TOWINKLIopAuthorAvatar)
        contentView.addSubview(TOWINKLIopUsername)
        contentView.addSubview(TOWINKLIopVibeLabel)
      
       
        
      
        TOWINKLIopVibeLabel.textColor = UIColor(red: 0.48, green: 0.49, blue: 0.49, alpha: 1)
        TOWINKLIopVibeLabel.text = "Join our live chat to find Christmas photo buddies and share pro tips 📸"
        TOWINKLIopVibeLabel.numberOfLines = 1
        TOWINKLIopVibeLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        TOWINKLIopVibeLabel.translatesAutoresizingMaskIntoConstraints = false
        

        NSLayoutConstraint.activate([
            TOWINKLIoCellpbg.topAnchor.constraint(equalTo: contentView.topAnchor),
            TOWINKLIoCellpbg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            TOWINKLIoCellpbg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            TOWINKLIoCellpbg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            
           
            
            TOWINKLIopAuthorAvatar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 15),
            TOWINKLIopAuthorAvatar.widthAnchor.constraint(equalToConstant: 60),
            TOWINKLIopAuthorAvatar.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            TOWINKLIopAuthorAvatar.heightAnchor.constraint(equalToConstant: 60),
            
            TOWINKLIopUsername.leadingAnchor.constraint(equalTo: TOWINKLIopAuthorAvatar.trailingAnchor,constant: 10),
            TOWINKLIopUsername.topAnchor.constraint(equalTo: TOWINKLIopAuthorAvatar.topAnchor, constant: 9),
         
            TOWINKLIopVibeLabel.topAnchor.constraint(equalTo: TOWINKLIopAuthorAvatar.topAnchor, constant: 9),
            TOWINKLIopVibeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10),
            TOWINKLIopVibeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            TOWINKLIopVibeLabel.topAnchor.constraint(equalTo: TOWINKLIopUsername.bottomAnchor, constant: 8)
        ])
    }
}
