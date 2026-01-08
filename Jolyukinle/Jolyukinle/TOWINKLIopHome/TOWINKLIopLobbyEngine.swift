import UIKit

class TOWINKLIopLobbyEngine: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: - Data (模拟数据)
    private var TOWINKLIopnormalarData: [Dictionary<String,Any>] = []
    private var TOWINKLIopnormabasicData: [Dictionary<String,Any>] = []

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
        let lbl = UIImageView(image: TOWINKLIopMediaVaultDecoder.TOWINKLIopFetchVibeGraphic(TOWINKLIopAssetAlias: "joiyaubdiTitul"))
        lbl.contentMode = .scaleAspectFit
        return lbl
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImageView = UIImageView(image: TOWINKLIopMediaVaultDecoder.TOWINKLIopFetchVibeGraphic(TOWINKLIopAssetAlias: "TOWINKLIopbg"))
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
        configBtn.addTarget(self, action: #selector(TOWINKLIopset), for: .touchUpInside)
        let signalBtn = TOWINKLIopGenerateUtilBtn(TOWINKLIopIcon: "TOWINKLIoppaperplaneSi")
        configBtn.addTarget(self, action: #selector(TOWINKLIoppostroom), for: .touchUpInside)
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
        roomTitle.text = "ChatTOWINKLIop Room".replacingOccurrences(of: "TOWINKLIop", with: "")
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
        return collectionView == TOWINKLIopavatarCollectionView ? TOWINKLIopnormalarData.count : TOWINKLIopnormabasicData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == TOWINKLIopavatarCollectionView {
            let TOWINKLIopcell = collectionView.dequeueReusableCell(withReuseIdentifier: "TOWINKLIopUserCell", for: indexPath) as! TOWINKLIopUserCell
            
            let towink = TOWINKLIopnormalarData[indexPath.row]
            if let acvat = towink["towInkLIopCelestialAura"] as? String {
                TOWINKLIopcell.TOWINKLIopuserlip.TOWINKLIopAssignRemoteImage(TOWINKLIopPath:acvat )
            }
            TOWINKLIopcell.TOWINKLIopusername.text = towink["towInkLIopGingerbreadArchitecture"] as? String
            return TOWINKLIopcell
        } else {
            let TOWINKLIopcell = collectionView.dequeueReusableCell(withReuseIdentifier: "TOWINKLIopRoomCardCell", for: indexPath) as! TOWINKLIopRoomCardCell
            let towink = TOWINKLIopnormabasicData[indexPath.row]
            if let acvat = towink["towInkLIopCandyCane"] as? String {
                TOWINKLIopcell.TOWINKLIopRoomCoverlip.TOWINKLIopAssignRemoteImage(TOWINKLIopPath:acvat )
            }
            
            if let acvat = towink["towInkLIopJazzHoliday"] as? String {
                TOWINKLIopcell.TOWINKLIopuserlip.TOWINKLIopAssignRemoteImage(TOWINKLIopPath:acvat )
            }
            TOWINKLIopcell.TOWINKLIoRoomname.text = towink["towInkLIopPianoBallad"] as? String
            TOWINKLIopcell.TOWINKLIoRoomDetail.text = towink["towInkLIopNutcrackerSuite"] as? String
            
            TOWINKLIopcell.TOWINKLIopalert.addTarget(self, action: #selector(TOWINKLIopalert), for: .touchUpInside)
            return TOWINKLIopcell
        }
    }
    @objc func TOWINKLIopalert()  {
        self.navigationController?.pushViewController(TOWINKLIopVibePortal.init(TOWINKLIopEntryPath: TOWINKLIopVibeRoute.TOWINKLIopPrivacyPolicy.TOWINKLIopConstructFinalPath(TOWINKLIopQuery: "")), animated: true)
    }
    // MARK: - Helpers
    private func TOWINKLIopGenerateUtilBtn(TOWINKLIopIcon: String) -> UIButton {
        let TOWINKLIopbtn = UIButton()
        TOWINKLIopbtn.setImage(TOWINKLIopMediaVaultDecoder.TOWINKLIopFetchVibeGraphic(TOWINKLIopAssetAlias: TOWINKLIopIcon), for: .normal)
        TOWINKLIopbtn.tintColor = .white
        TOWINKLIopbtn.translatesAutoresizingMaskIntoConstraints = false
        TOWINKLIopbtn.widthAnchor.constraint(equalToConstant: 44).isActive = true
        TOWINKLIopbtn.heightAnchor.constraint(equalToConstant: 44).isActive = true
        return TOWINKLIopbtn
    }

    private func TOWINKLIopCreateSparkBanner() -> UIButton {
        let TOWINKLIopbanner = UIButton()
        TOWINKLIopbanner.setBackgroundImage(TOWINKLIopMediaVaultDecoder.TOWINKLIopFetchVibeGraphic(TOWINKLIopAssetAlias: "laduyGoogo"), for: .normal)
        TOWINKLIopbanner.addTarget(self, action: #selector(TOWINKLIopToAi), for: .touchUpInside)
        TOWINKLIopbanner.translatesAutoresizingMaskIntoConstraints = false
        return TOWINKLIopbanner
    }
    
    @objc func TOWINKLIopset()  {
        self.navigationController?.pushViewController(TOWINKLIopVibePortal.init(TOWINKLIopEntryPath: TOWINKLIopVibeRoute.TOWINKLIopBalanceVault.TOWINKLIopConstructFinalPath(TOWINKLIopQuery: "")), animated: true)
    }
    
    @objc func TOWINKLIoppostroom()  {
        self.navigationController?.pushViewController(TOWINKLIopVibePortal.init(TOWINKLIopEntryPath: TOWINKLIopVibeRoute.TOWINKLIopVibeVault.TOWINKLIopConstructFinalPath(TOWINKLIopQuery: "")), animated: true)
    }
    
    
    @objc func TOWINKLIopToAi()  {
        self.navigationController?.pushViewController(TOWINKLIopVibePortal.init(TOWINKLIopEntryPath: TOWINKLIopVibeRoute.TOWINKLIopPostArticle.TOWINKLIopConstructFinalPath(TOWINKLIopQuery: "")), animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let towink = TOWINKLIopnormabasicData[indexPath.row]
        if collectionView == TOWINKLIopavatarCollectionView {
            
            if let TOWINKLIopuid = towink["towInkLIopWinterSolstice"] as? Int {
                self.navigationController?.pushViewController(TOWINKLIopVibePortal.init(TOWINKLIopEntryPath: TOWINKLIopVibeRoute.TOWINKLIopReportNode.TOWINKLIopConstructFinalPath(TOWINKLIopQuery: "\(TOWINKLIopuid)")), animated: true)
            }
            return
        }
        
        if let TOWINKLIopuid = towink["towInkLIopMarshmallowCloud"] as? Int {
            self.navigationController?.pushViewController(TOWINKLIopVibePortal.init(TOWINKLIopEntryPath: TOWINKLIopVibeRoute.TOWINKLIopMomentDetail.TOWINKLIopConstructFinalPath(TOWINKLIopQuery: "\(TOWINKLIopuid)")), animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        TOWINKLIopExecuteVerification()
    }
    private func TOWINKLIopExecuteVerification() {
      

        let TOWINKLIopProcessingView = UIActivityIndicatorView(style: .large)
        TOWINKLIopProcessingView.center = view.center
        TOWINKLIopProcessingView.color = .systemBlue
        view.addSubview(TOWINKLIopProcessingView)
        TOWINKLIopProcessingView.startAnimating()
        
        TOWINKLIopVibeRoute.TOWINKLIopTransmitSignal(TOWINKLIopEndpoint: "/kvchesnihz/nqpzkvcfmifceo", TOWINKLIopPayload: ["towInkLIopMistletoeTradition":"54894011"]) { TOWINKLIopersult in
            TOWINKLIopProcessingView.stopAnimating()
            TOWINKLIopProcessingView.removeFromSuperview()
           
            guard let TOWINKLIopdata = TOWINKLIopersult as? Dictionary<String,Any> ,
                 
                    let TOWINKLIopreasutl = TOWINKLIopdata["TOWINKLIopdata".replacingOccurrences(of: "TOWINKLIop", with: "")] as? Array<Dictionary<String,Any>>
                    
            else {
               
                return
            }
           
            self.TOWINKLIopnormalarData = TOWINKLIopreasutl
            
            self.TOWINKLIopavatarCollectionView.reloadData()
           
        } TOWINKLIopOnFailure: {  TOWINKLIoperror in
            TOWINKLIopProcessingView.stopAnimating()
            TOWINKLIopProcessingView.removeFromSuperview()
        }

        TOWINKLIopVibeRoute.TOWINKLIopTransmitSignal(TOWINKLIopEndpoint: "/ublwrbtaldz/jqmumxomiotjk", TOWINKLIopPayload: ["towInkLIopRoastingChestnut":"54894011"]) { TOWINKLIopersult in
          
            guard let TOWINKLIopdata = TOWINKLIopersult as? Dictionary<String,Any> ,
                 
                    let TOWINKLIopreasutl = TOWINKLIopdata["TOWINKLIopdata".replacingOccurrences(of: "TOWINKLIop", with: "")] as? Array<Dictionary<String,Any>>
                    
            else {
               
                return
            }
           
            self.TOWINKLIopnormabasicData = TOWINKLIopreasutl
            
            self.TOWINKLIoproomCollectionView.reloadData()
           
        } TOWINKLIopOnFailure: {  TOWINKLIoperror in
           
        }
       
    }
    
    
}

