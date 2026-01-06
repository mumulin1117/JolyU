//
//  TOWINKLIopVibeDynamicStage.swift
//  Jolyukinle
//
//  Created by mumu on 2026/1/6.
//

import UIKit

import AVFoundation
 enum TOWINKLIopFeedCategory {
    case TOWINKLIopMomentMode
    case TOWINKLIopVideoMode
}
class TOWINKLIopVibeDynamicStage: UIViewController {

  

    private var TOWINKLIopCurrentState: TOWINKLIopFeedCategory = .TOWINKLIopMomentMode
    private let TOWINKLIopHeaderHeight: CGFloat = 160
    
    private let TOWINKLIopInputContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.56, green: 0.8, blue: 0.84, alpha: 1)
        view.layer.cornerRadius = 35
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let TOWINKLIopMainCollection: UICollectionView = {
        let TOWINKLIopFlow = UICollectionViewFlowLayout()
        TOWINKLIopFlow.scrollDirection = .vertical
        let TOWINKLIopCv = UICollectionView(frame: .zero, collectionViewLayout: TOWINKLIopFlow)
        TOWINKLIopCv.backgroundColor = .clear
        TOWINKLIopCv.translatesAutoresizingMaskIntoConstraints = false
        return TOWINKLIopCv
    }()

    private let TOWINKLIopCategoryToggle: UISegmentedControl = {
        let TOWINKLIopItems = ["Moment", "Hot video"]
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

    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImageView = UIImageView(image: UIImage(named: "TOWINKLIopbg"))
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.frame = view.bounds
        view.addSubview(backgroundImageView)
        
        
        TOWINKLIopBuildInterface()
        TOWINKLIopPrepareDataFlow()
    }
    private let TOWINKLIopBrandLabel: UIImageView = {
        let lbl = UIImageView(image: UIImage(named: "joiyaubdiTiDYM"))
        lbl.contentMode = .scaleAspectFit
        return lbl
    }()
    private func TOWINKLIopBuildInterface() {
        view.backgroundColor = .white
        view.addSubview(TOWINKLIopInputContainer)
        view.addSubview(TOWINKLIopMainCollection)
        
        
        let configBtn = TOWINKLIopGenerateUtilBtn(TOWINKLIopIcon: "TOWINKLIopgearshape")
        let signalBtn = TOWINKLIopGenerateUtilBtn(TOWINKLIopIcon: "TOWINKLIoppaperplaneSi")
        let headerBox = UIStackView(arrangedSubviews: [TOWINKLIopBrandLabel, UIView(), configBtn, signalBtn])
        headerBox.spacing = 15
        headerBox.alignment = .center
        headerBox.translatesAutoresizingMaskIntoConstraints = false
        TOWINKLIopInputContainer.addSubview(headerBox)
        
        view.addSubview(TOWINKLIopCategoryToggle)
        view.addSubview(TOWINKLIopMainCollection)
        NSLayoutConstraint.activate([
            TOWINKLIopInputContainer.topAnchor.constraint(equalTo: view.topAnchor),
            TOWINKLIopInputContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            TOWINKLIopInputContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            TOWINKLIopInputContainer.heightAnchor.constraint(equalToConstant: 110),
            
           
            headerBox.bottomAnchor.constraint(equalTo: TOWINKLIopInputContainer.bottomAnchor, constant: -16),
            headerBox.leadingAnchor.constraint(equalTo: TOWINKLIopInputContainer.leadingAnchor, constant: 20),
            headerBox.trailingAnchor.constraint(equalTo: TOWINKLIopInputContainer.trailingAnchor, constant: -20),
            
            TOWINKLIopCategoryToggle.topAnchor.constraint(equalTo: TOWINKLIopInputContainer.bottomAnchor,constant: 20),
            TOWINKLIopCategoryToggle.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            TOWINKLIopCategoryToggle.widthAnchor.constraint(equalToConstant: 280),
            TOWINKLIopCategoryToggle.heightAnchor.constraint(equalToConstant: 30),
            
            TOWINKLIopMainCollection.topAnchor.constraint(equalTo: TOWINKLIopCategoryToggle.bottomAnchor, constant: 12),
            TOWINKLIopMainCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            TOWINKLIopMainCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            TOWINKLIopMainCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    private func TOWINKLIopGenerateUtilBtn(TOWINKLIopIcon: String) -> UIButton {
        let btn = UIButton()
        btn.setImage(UIImage(named: TOWINKLIopIcon), for: .normal)
        btn.tintColor = .white
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.widthAnchor.constraint(equalToConstant: 44).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 44).isActive = true
        return btn
    }
    private func TOWINKLIopPrepareDataFlow() {
        TOWINKLIopMainCollection.delegate = self
        TOWINKLIopMainCollection.dataSource = self
        TOWINKLIopMainCollection.register(TOWINKLIopMomentPlazaCell.self, forCellWithReuseIdentifier: "TOWINKLIopMoment")
        TOWINKLIopMainCollection.register(TOWINKLIopVideoShowcaseCell.self, forCellWithReuseIdentifier: "TOWINKLIopVideo")
        
        TOWINKLIopCategoryToggle.addTarget(self, action: #selector(TOWINKLIopSwitchFeed), for: .valueChanged)
    }

    @objc private func TOWINKLIopSwitchFeed(_ sender: UISegmentedControl) {
        TOWINKLIopCurrentState = sender.selectedSegmentIndex == 0 ? .TOWINKLIopMomentMode : .TOWINKLIopVideoMode
        
        UIView.transition(with: TOWINKLIopMainCollection, duration: 0.35, options: .transitionCrossDissolve, animations: {
            self.TOWINKLIopMainCollection.reloadData()
        }, completion: nil)
    }
}

extension TOWINKLIopVibeDynamicStage: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if TOWINKLIopCurrentState == .TOWINKLIopMomentMode {
            let TOWINKLIopCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TOWINKLIopMoment", for: indexPath) as! TOWINKLIopMomentPlazaCell
            return TOWINKLIopCell
        } else {
            let TOWINKLIopCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TOWINKLIopVideo", for: indexPath) as! TOWINKLIopVideoShowcaseCell
            return TOWINKLIopCell
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let TOWINKLIopWidth = collectionView.frame.width - 32
        return TOWINKLIopCurrentState == .TOWINKLIopMomentMode ? CGSize(width: TOWINKLIopWidth, height: 277) : CGSize(width: TOWINKLIopWidth, height: 299)
    }
}


