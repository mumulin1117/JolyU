//
//  TOWINKLIopCenterStage.swift
//  Jolyukinle
//
//  Created by mumu on 2026/1/6.
//

import UIKit

class TOWINKLIopCenterStage: UIViewController {
    
 
    // MARK: - UI Components
    
    private let TOWINKLIopBigContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 35
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let TOWINKLIopInputContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.56, green: 0.8, blue: 0.84, alpha: 1)
        view.layer.cornerRadius = 35
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let TOWINKLIopAvatarFrame: UIImageView = {
            let img = UIImageView()
            img.layer.cornerRadius = 60
            img.layer.borderWidth = 4
            img.layer.borderColor = UIColor.white.cgColor
            img.clipsToBounds = true
            img.backgroundColor = .systemGray5
            img.contentMode = .scaleAspectFill
            img.translatesAutoresizingMaskIntoConstraints = false
            return img
        }()

        private let TOWINKLIopEditTrigger: UIButton = {
            let btn = UIButton(type: .system)
            btn.setTitle("✎ Edit", for: .normal)
            btn.setTitleColor(.white, for: .normal)
            btn.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
            btn.layer.cornerRadius = 15
            btn.clipsToBounds = true
            btn.translatesAutoresizingMaskIntoConstraints = false
            return btn
        }()

        private let TOWINKLIopStatStack: UIStackView = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.distribution = .equalSpacing
            stack.alignment = .center
            stack.spacing = 20
            stack.translatesAutoresizingMaskIntoConstraints = false
            return stack
        }()
    private var TOWINKLIopCurrentState: TOWINKLIopFeedCategory = .TOWINKLIopMomentMode
    
    private let TOWINKLIopCategoryToggle: UISegmentedControl = {
        let TOWINKLIopItems = ["Moment", "Video"]
        let TOWINKLIopSc = UISegmentedControl(items: TOWINKLIopItems)
        TOWINKLIopSc.selectedSegmentIndex = 0
        TOWINKLIopSc.selectedSegmentTintColor = .clear
        TOWINKLIopSc.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        TOWINKLIopSc.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        let TOWINKLIopNormalAttr: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 18, weight: .bold), .foregroundColor: UIColor.lightGray]
        let TOWINKLIopSelectedAttr: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 22, weight: .bold), .foregroundColor: UIColor(red: 0.01, green: 0.4, blue: 0.68, alpha: 1)]
        TOWINKLIopSc.setTitleTextAttributes(TOWINKLIopNormalAttr, for: .normal)
        TOWINKLIopSc.setTitleTextAttributes(TOWINKLIopSelectedAttr, for: .selected)
        TOWINKLIopSc.translatesAutoresizingMaskIntoConstraints = false
        return TOWINKLIopSc
    }()


    private let TOWINKLIopBrandLabel: UIImageView = {
        let lbl = UIImageView(image: UIImage(named: "joiyaubdipersonnaesgel"))
        lbl.contentMode = .scaleAspectFit
        return lbl
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImageView = UIImageView(image: UIImage(named: "TOWINKLIopbg"))
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.frame = view.bounds
        view.addSubview(backgroundImageView)
        view.addSubview(TOWINKLIopBigContainer)
        TOWINKLIopBigContainer.addSubview(TOWINKLIopInputContainer)
        TOWINKLIopBigContainer.addSubview(TOWINKLIopAvatarFrame)
        TOWINKLIopBigContainer.addSubview(TOWINKLIopEditTrigger)
        TOWINKLIopBigContainer.addSubview(TOWINKLIopStatStack)
        
        view.addSubview(TOWINKLIopCategoryToggle)
        TOWINKLIopInitializeScene()
    }
    
    private func TOWINKLIopInitializeScene() {
       
        // Header
        let configBtn = TOWINKLIopGenerateUtilBtn(TOWINKLIopIcon: "TOWINKLIopgearshape")
        let signalBtn = TOWINKLIopGenerateUtilBtn(TOWINKLIopIcon: "TOWINKLIoppapdimoad")
        let headerBox = UIStackView(arrangedSubviews: [TOWINKLIopBrandLabel, UIView(), configBtn, signalBtn])
        headerBox.spacing = 15
        headerBox.alignment = .center
        headerBox.translatesAutoresizingMaskIntoConstraints = false
        TOWINKLIopInputContainer.addSubview(headerBox)
        
        TOWINKLIopStatStack.addArrangedSubview(TOWINKLIopCreateStatItem(value: "60", label: "Likes"))
                
        TOWINKLIopStatStack.addArrangedSubview(TOWINKLIopCreateDivider())
        TOWINKLIopStatStack.addArrangedSubview(TOWINKLIopCreateStatItem(value: "120", label: "Followers"))
        TOWINKLIopStatStack.addArrangedSubview(TOWINKLIopCreateDivider())
        TOWINKLIopStatStack.addArrangedSubview(TOWINKLIopCreateStatItem(value: "33", label: "Following"))


        NSLayoutConstraint.activate([
            
            TOWINKLIopBigContainer.topAnchor.constraint(equalTo: view.topAnchor),
            TOWINKLIopBigContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            TOWINKLIopBigContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            TOWINKLIopBigContainer.heightAnchor.constraint(equalToConstant: 204),
            
            
            TOWINKLIopInputContainer.topAnchor.constraint(equalTo: TOWINKLIopBigContainer.topAnchor),
            TOWINKLIopInputContainer.leadingAnchor.constraint(equalTo: TOWINKLIopBigContainer.leadingAnchor),
            TOWINKLIopInputContainer.trailingAnchor.constraint(equalTo: TOWINKLIopBigContainer.trailingAnchor),
            TOWINKLIopInputContainer.heightAnchor.constraint(equalToConstant: 110),
            
            headerBox.bottomAnchor.constraint(equalTo: TOWINKLIopInputContainer.bottomAnchor, constant: -16),
            headerBox.leadingAnchor.constraint(equalTo: TOWINKLIopInputContainer.leadingAnchor, constant: 20),
            headerBox.trailingAnchor.constraint(equalTo: TOWINKLIopInputContainer.trailingAnchor, constant: -20),
           
            
            
            
            TOWINKLIopCategoryToggle.topAnchor.constraint(equalTo: TOWINKLIopBigContainer.bottomAnchor,constant: 30),
            TOWINKLIopCategoryToggle.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            TOWINKLIopCategoryToggle.widthAnchor.constraint(equalToConstant: 280),
            TOWINKLIopCategoryToggle.heightAnchor.constraint(equalToConstant: 30),
            
            
            TOWINKLIopAvatarFrame.topAnchor.constraint(equalTo: TOWINKLIopInputContainer.bottomAnchor, constant: 15),
                        TOWINKLIopAvatarFrame.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:8),
                        TOWINKLIopAvatarFrame.widthAnchor.constraint(equalToConstant: 74),
                        TOWINKLIopAvatarFrame.heightAnchor.constraint(equalToConstant: 74),

                        TOWINKLIopEditTrigger.centerXAnchor.constraint(equalTo: TOWINKLIopAvatarFrame.centerXAnchor),
                        TOWINKLIopEditTrigger.topAnchor.constraint(equalTo: TOWINKLIopAvatarFrame.bottomAnchor, constant: -15),
                        TOWINKLIopEditTrigger.widthAnchor.constraint(equalToConstant: 60),
                        TOWINKLIopEditTrigger.heightAnchor.constraint(equalToConstant: 22),
            
            TOWINKLIopStatStack.centerYAnchor.constraint(equalTo: TOWINKLIopAvatarFrame.centerYAnchor),
                        TOWINKLIopStatStack.leadingAnchor.constraint(equalTo: TOWINKLIopAvatarFrame.trailingAnchor, constant: 10),
                        TOWINKLIopStatStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
          
        ])
    }

    // MARK: - Helpers
    private func TOWINKLIopGenerateUtilBtn(TOWINKLIopIcon: String) -> UIButton {
        let btn = UIButton()
        btn.setImage(UIImage(named: TOWINKLIopIcon), for: .normal)
        btn.tintColor = .white
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.widthAnchor.constraint(equalToConstant: 44).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 44).isActive = true
        return btn
    }

    private func TOWINKLIopCreateSparkBanner() -> UIButton {
        let banner = UIButton()
        banner.setBackgroundImage(UIImage(named: "laduyGoogo"), for: .normal)
       
        banner.translatesAutoresizingMaskIntoConstraints = false
        return banner
    }
    private func TOWINKLIopCreateStatItem(value: String, label: String) -> UIView {
            let container = UIView()
            let valLbl = UILabel()
            valLbl.text = value
            valLbl.font = .systemFont(ofSize: 20, weight: .bold)
            valLbl.textColor = UIColor(red: 0.01, green: 0.4, blue: 0.68, alpha: 1)
            valLbl.textAlignment = .center
            valLbl.translatesAutoresizingMaskIntoConstraints = false
            
            let subLbl = UILabel()
            subLbl.text = label
            subLbl.font = .systemFont(ofSize: 12, weight: .regular)
            subLbl.textColor = UIColor(red: 0.01, green: 0.4, blue: 0.68, alpha: 1)
            subLbl.textAlignment = .center
            subLbl.translatesAutoresizingMaskIntoConstraints = false
            
            container.addSubview(valLbl)
            container.addSubview(subLbl)
            
            NSLayoutConstraint.activate([
                valLbl.topAnchor.constraint(equalTo: container.topAnchor),
                valLbl.centerXAnchor.constraint(equalTo: container.centerXAnchor),
                subLbl.topAnchor.constraint(equalTo: valLbl.bottomAnchor, constant: 4),
                subLbl.centerXAnchor.constraint(equalTo: container.centerXAnchor),
                subLbl.bottomAnchor.constraint(equalTo: container.bottomAnchor)
            ])
            return container
        }
    
    private func TOWINKLIopCreateDivider() -> UIView {
            let v = UIView()
            v.backgroundColor = .systemGray5
            v.widthAnchor.constraint(equalToConstant: 1).isActive = true
            v.heightAnchor.constraint(equalToConstant: 30).isActive = true
            return v
        }
}
