//
//  TOWINKLIopMeassgeStage.swift
//  Jolyukinle
//
//  Created by mumu on 2026/1/6.
//
import UIKit

class TOWINKLIopMeassgeStage: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: - Data (模拟数据)
    private var avatarData: [UIColor] = [.systemPink, .systemBlue, .systemGreen, .systemOrange, .systemPurple, .systemYellow, .systemTeal]
    private var roomData: [String] = ["Room A", "Room B", "Room C", "Room D", "Room E"]

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
    
  
    
    // 横向滚动的用户栏 (Top Shelf)
    private lazy var TOWINKLIopavatarCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 70, height: 74)
        layout.minimumInteritemSpacing = 15
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        let TOWINKLIopcv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        TOWINKLIopcv.backgroundColor = .clear
        TOWINKLIopcv.showsHorizontalScrollIndicator = false
        TOWINKLIopcv.delegate = self
        TOWINKLIopcv.dataSource = self
        TOWINKLIopcv.register(TOWINKLIopUserCell.self, forCellWithReuseIdentifier: "TOWINKLIopUserCell")
        TOWINKLIopcv.translatesAutoresizingMaskIntoConstraints = false
        return TOWINKLIopcv
    }()
    
    //
    private lazy var TOWINKLIopmesageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 78) // 增加高度以容纳按钮
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.delegate = self
        cv.dataSource = self
        cv.register(TOWINKLIopMeassgecell.self, forCellWithReuseIdentifier: "TOWINKLIopMeassgecell")
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()

    private let TOWINKLIopBrandLabel: UIImageView = {
        let lbl = UIImageView(image: UIImage(named: "joiyaubdimeaasgel"))
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
        view.addSubview(TOWINKLIopInputContainer)
        
        
        TOWINKLIopInitializeScene()
    }
    
    private func TOWINKLIopInitializeScene() {
       
        // Header
        let configBtn = TOWINKLIopGenerateUtilBtn(TOWINKLIopIcon: "TOWINKLIopgearshape")
        let signalBtn = TOWINKLIopGenerateUtilBtn(TOWINKLIopIcon: "TOWINKLIoppaperplaneSi")
        let headerBox = UIStackView(arrangedSubviews: [TOWINKLIopBrandLabel, UIView(), configBtn, signalBtn])
        headerBox.spacing = 15
        headerBox.alignment = .center
        headerBox.translatesAutoresizingMaskIntoConstraints = false
        TOWINKLIopInputContainer.addSubview(headerBox)
        
        TOWINKLIopBigContainer.addSubview(TOWINKLIopavatarCollectionView)
        
      
        let roomTitle = UILabel()
        roomTitle.text = "Friend"
        roomTitle.textColor = UIColor(red: 0.01, green: 0.4, blue: 0.68, alpha: 1)
        roomTitle.font = .systemFont(ofSize: 22, weight: .bold)
        roomTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(roomTitle)
        
        view.addSubview(TOWINKLIopmesageCollectionView)

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
           
            
            // Avatar Collection Constraints
            TOWINKLIopavatarCollectionView.topAnchor.constraint(equalTo: TOWINKLIopInputContainer.bottomAnchor, constant: 20),
            TOWINKLIopavatarCollectionView.leadingAnchor.constraint(equalTo: TOWINKLIopBigContainer.leadingAnchor),
            TOWINKLIopavatarCollectionView.trailingAnchor.constraint(equalTo: TOWINKLIopBigContainer.trailingAnchor),
            TOWINKLIopavatarCollectionView.heightAnchor.constraint(equalToConstant: 80),
            
        
            // Room Title
            roomTitle.topAnchor.constraint(equalTo: TOWINKLIopBigContainer.bottomAnchor, constant: 16),
            roomTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            // Room Collection Constraints
            TOWINKLIopmesageCollectionView.topAnchor.constraint(equalTo: roomTitle.bottomAnchor, constant: 15),
            TOWINKLIopmesageCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            TOWINKLIopmesageCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            TOWINKLIopmesageCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    // MARK: - CollectionView DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == TOWINKLIopavatarCollectionView ? avatarData.count : roomData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == TOWINKLIopavatarCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TOWINKLIopUserCell", for: indexPath) as! TOWINKLIopUserCell
       
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TOWINKLIopMeassgecell", for: indexPath) as! TOWINKLIopMeassgecell
            // 这里可以根据 roomData[indexPath.item] 刷新 cell 内容
            return cell
        }
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
}

