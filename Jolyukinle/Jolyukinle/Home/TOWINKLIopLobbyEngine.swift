import UIKit

class TOWINKLIopLobbyEngine: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: - Data (模拟数据)
    private var avatarData: [UIColor] = [.systemPink, .systemBlue, .systemGreen, .systemOrange, .systemPurple, .systemYellow, .systemTeal]
    private var roomData: [String] = ["Room A", "Room B", "Room C", "Room D", "Room E"]

    // MARK: - UI Components
    private let TOWINKLIopInputContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.56, green: 0.8, blue: 0.84, alpha: 1)
        view.layer.cornerRadius = 35
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let TOWINKLIopScrollPlane = UIScrollView()
    private let TOWINKLIopContentRoot = UIView()
    
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
    
    // 横向滚动的聊天室栏 (Room Shelf)
    private lazy var TOWINKLIoproomCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 140, height: 222 + 20) // 增加高度以容纳按钮
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.delegate = self
        cv.dataSource = self
        cv.register(TOWINKLIopRoomCardCell.self, forCellWithReuseIdentifier: "TOWINKLIopRoomCardCell")
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()

    private let TOWINKLIopBrandLabel: UIImageView = {
        let lbl = UIImageView(image: UIImage(named: "joiyaubdiTitul"))
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
        
        TOWINKLIopInitializeScene()
    }
    
    private func TOWINKLIopInitializeScene() {
        view.addSubview(TOWINKLIopInputContainer)
        
        TOWINKLIopScrollPlane.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(TOWINKLIopScrollPlane)
        
        TOWINKLIopContentRoot.translatesAutoresizingMaskIntoConstraints = false
        TOWINKLIopScrollPlane.addSubview(TOWINKLIopContentRoot)
        
        // Header
        let configBtn = TOWINKLIopGenerateUtilBtn(TOWINKLIopIcon: "TOWINKLIopgearshape")
        let signalBtn = TOWINKLIopGenerateUtilBtn(TOWINKLIopIcon: "TOWINKLIoppaperplaneSi")
        let headerBox = UIStackView(arrangedSubviews: [TOWINKLIopBrandLabel, UIView(), configBtn, signalBtn])
        headerBox.spacing = 15
        headerBox.alignment = .center
        headerBox.translatesAutoresizingMaskIntoConstraints = false
        TOWINKLIopInputContainer.addSubview(headerBox)
        
        // Content Setup
        TOWINKLIopContentRoot.addSubview(TOWINKLIopavatarCollectionView)
        
        let aiBanner = TOWINKLIopCreateSparkBanner()
        TOWINKLIopContentRoot.addSubview(aiBanner)
        
        let roomTitle = UILabel()
        roomTitle.text = "Chat Room"
        roomTitle.textColor = UIColor(red: 0.01, green: 0.4, blue: 0.68, alpha: 1)
        roomTitle.font = .systemFont(ofSize: 22, weight: .bold)
        roomTitle.translatesAutoresizingMaskIntoConstraints = false
        TOWINKLIopContentRoot.addSubview(roomTitle)
        
        TOWINKLIopContentRoot.addSubview(TOWINKLIoproomCollectionView)

        NSLayoutConstraint.activate([
            TOWINKLIopInputContainer.topAnchor.constraint(equalTo: view.topAnchor),
            TOWINKLIopInputContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            TOWINKLIopInputContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            TOWINKLIopInputContainer.heightAnchor.constraint(equalToConstant: 110),
            
            headerBox.bottomAnchor.constraint(equalTo: TOWINKLIopInputContainer.bottomAnchor, constant: -16),
            headerBox.leadingAnchor.constraint(equalTo: TOWINKLIopInputContainer.leadingAnchor, constant: 20),
            headerBox.trailingAnchor.constraint(equalTo: TOWINKLIopInputContainer.trailingAnchor, constant: -20),
            
            TOWINKLIopScrollPlane.topAnchor.constraint(equalTo: TOWINKLIopInputContainer.bottomAnchor),
            TOWINKLIopScrollPlane.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            TOWINKLIopScrollPlane.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            TOWINKLIopScrollPlane.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            TOWINKLIopContentRoot.topAnchor.constraint(equalTo: TOWINKLIopScrollPlane.topAnchor),
            TOWINKLIopContentRoot.leadingAnchor.constraint(equalTo: TOWINKLIopScrollPlane.leadingAnchor),
            TOWINKLIopContentRoot.trailingAnchor.constraint(equalTo: TOWINKLIopScrollPlane.trailingAnchor),
            TOWINKLIopContentRoot.bottomAnchor.constraint(equalTo: TOWINKLIopScrollPlane.bottomAnchor),
            TOWINKLIopContentRoot.widthAnchor.constraint(equalTo: TOWINKLIopScrollPlane.widthAnchor),
            TOWINKLIopContentRoot.heightAnchor.constraint(equalToConstant: 850),
            
            // Avatar Collection Constraints
            TOWINKLIopavatarCollectionView.topAnchor.constraint(equalTo: TOWINKLIopContentRoot.topAnchor, constant: 20),
            TOWINKLIopavatarCollectionView.leadingAnchor.constraint(equalTo: TOWINKLIopContentRoot.leadingAnchor),
            TOWINKLIopavatarCollectionView.trailingAnchor.constraint(equalTo: TOWINKLIopContentRoot.trailingAnchor),
            TOWINKLIopavatarCollectionView.heightAnchor.constraint(equalToConstant: 80),
            
            // Banner
            aiBanner.topAnchor.constraint(equalTo: TOWINKLIopavatarCollectionView.bottomAnchor, constant: 20),
            aiBanner.leadingAnchor.constraint(equalTo: TOWINKLIopContentRoot.leadingAnchor, constant: 0),
            aiBanner.trailingAnchor.constraint(equalTo: TOWINKLIopContentRoot.trailingAnchor, constant: 0),
            aiBanner.heightAnchor.constraint(equalToConstant: 226),
            
            // Room Title
            roomTitle.topAnchor.constraint(equalTo: aiBanner.bottomAnchor, constant: 16),
            roomTitle.leadingAnchor.constraint(equalTo: TOWINKLIopContentRoot.leadingAnchor, constant: 20),
            
            // Room Collection Constraints
            TOWINKLIoproomCollectionView.topAnchor.constraint(equalTo: roomTitle.bottomAnchor, constant: 15),
            TOWINKLIoproomCollectionView.leadingAnchor.constraint(equalTo: TOWINKLIopContentRoot.leadingAnchor),
            TOWINKLIoproomCollectionView.trailingAnchor.constraint(equalTo: TOWINKLIopContentRoot.trailingAnchor),
            TOWINKLIoproomCollectionView.heightAnchor.constraint(equalToConstant: 300)
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TOWINKLIopRoomCardCell", for: indexPath) as! TOWINKLIopRoomCardCell
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

