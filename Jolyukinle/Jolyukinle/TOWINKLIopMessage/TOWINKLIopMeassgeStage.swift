//
//  TOWINKLIopMeassgeStage.swift
//  Jolyukinle
//
//  Created by mumu on 2026/1/6.
//
import UIKit

class TOWINKLIopMeassgeStage: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: - Data (模拟数据)
    private var TOWINKLIopnormalarData: [Dictionary<String,Any>] = []
    private var TOWINKLIopnormabasicData: [Dictionary<String,Any>] = []
    // MARK: - UI Components
    
    private let TOWINKLIopBigContainer: UIView = {
        let TOWINKLIopview = UIView()
        TOWINKLIopview.backgroundColor = UIColor.white
        TOWINKLIopview.layer.cornerRadius = 35
        TOWINKLIopview.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        TOWINKLIopview.translatesAutoresizingMaskIntoConstraints = false
        return TOWINKLIopview
    }()
    
    private let TOWINKLIopInputContainer: UIView = {
        let TOWINKLIopview = UIView()
        TOWINKLIopview.backgroundColor = UIColor(red: 0.56, green: 0.8, blue: 0.84, alpha: 1)
        TOWINKLIopview.layer.cornerRadius = 35
        TOWINKLIopview.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        TOWINKLIopview.translatesAutoresizingMaskIntoConstraints = false
        return TOWINKLIopview
    }()
    
  
    
    // 横向滚动的用户栏 (Top Shelf)
    private lazy var TOWINKLIopavatarCollectionView: UICollectionView = {
        let TOWINKLIoplayout = UICollectionViewFlowLayout()
        TOWINKLIoplayout.scrollDirection = .horizontal
        TOWINKLIoplayout.itemSize = CGSize(width: 70, height: 74)
        TOWINKLIoplayout.minimumInteritemSpacing = 15
        TOWINKLIoplayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        let TOWINKLIopcv = UICollectionView(frame: .zero, collectionViewLayout: TOWINKLIoplayout)
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
        let TOWINKLIoplayout = UICollectionViewFlowLayout()
        TOWINKLIoplayout.scrollDirection = .vertical
        TOWINKLIoplayout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 78) // 增加高度以容纳按钮
        TOWINKLIoplayout.minimumLineSpacing = 10
        TOWINKLIoplayout.minimumInteritemSpacing = 10
        TOWINKLIoplayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        let TOWINKLIopcv = UICollectionView(frame: .zero, collectionViewLayout: TOWINKLIoplayout)
        TOWINKLIopcv.backgroundColor = .clear
        TOWINKLIopcv.showsHorizontalScrollIndicator = false
        TOWINKLIopcv.delegate = self
        TOWINKLIopcv.dataSource = self
        TOWINKLIopcv.register(TOWINKLIopMeassgecell.self, forCellWithReuseIdentifier: "TOWINKLIopMeassgecell")
        TOWINKLIopcv.translatesAutoresizingMaskIntoConstraints = false
        return TOWINKLIopcv
    }()

    private let TOWINKLIopBrandLabel: UIImageView = {
        let TOWINKLIoplbl = UIImageView(image: TOWINKLIopMediaVaultDecoder.TOWINKLIopFetchVibeGraphic(TOWINKLIopAssetAlias: "joiyaubdimeaasgel"))
        TOWINKLIoplbl.contentMode = .scaleAspectFit
        return TOWINKLIoplbl
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImageView = UIImageView(image: TOWINKLIopMediaVaultDecoder.TOWINKLIopFetchVibeGraphic(TOWINKLIopAssetAlias: "TOWINKLIopbg"))
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.frame = view.bounds
        view.addSubview(backgroundImageView)
        view.addSubview(TOWINKLIopBigContainer)
        view.addSubview(TOWINKLIopInputContainer)
        
        
        TOWINKLIopInitializeScene()
    }
    @objc func TOWINKLIopset()  {
        self.navigationController?.pushViewController(TOWINKLIopVibePortal.init(TOWINKLIopEntryPath: TOWINKLIopVibeRoute.TOWINKLIopBalanceVault.TOWINKLIopConstructFinalPath(TOWINKLIopQuery: "")), animated: true)
    }
    private func TOWINKLIopInitializeScene() {
       
        // Header
        let configBtn = TOWINKLIopGenerateUtilBtn(TOWINKLIopIcon: "TOWINKLIopgearshape")
        configBtn.addTarget(self, action: #selector(TOWINKLIopset), for: .touchUpInside)
        let signalBtn = TOWINKLIopGenerateUtilBtn(TOWINKLIopIcon: "appNOIVon")
        let headerBox = UIStackView(arrangedSubviews: [TOWINKLIopBrandLabel, UIView(), configBtn, signalBtn])
        headerBox.spacing = 15
        headerBox.alignment = .center
        headerBox.translatesAutoresizingMaskIntoConstraints = false
        TOWINKLIopInputContainer.addSubview(headerBox)
        
        TOWINKLIopBigContainer.addSubview(TOWINKLIopavatarCollectionView)
        
      
        let TOWINKLIoproomTitle = UILabel()
        TOWINKLIoproomTitle.text = "Friend"
        TOWINKLIoproomTitle.textColor = UIColor(red: 0.01, green: 0.4, blue: 0.68, alpha: 1)
        TOWINKLIoproomTitle.font = .systemFont(ofSize: 22, weight: .bold)
        TOWINKLIoproomTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(TOWINKLIoproomTitle)
        view.addSubview(TOWINKLIopBaseoldby)
        view.addSubview(TOWINKLIopshiftg)
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
            TOWINKLIoproomTitle.topAnchor.constraint(equalTo: TOWINKLIopBigContainer.bottomAnchor, constant: 16),
            TOWINKLIoproomTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            TOWINKLIopBaseoldby.topAnchor.constraint(equalTo: TOWINKLIoproomTitle.bottomAnchor, constant: 30),
            TOWINKLIopBaseoldby.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            TOWINKLIopshiftg.topAnchor.constraint(equalTo: TOWINKLIopBaseoldby.bottomAnchor, constant: 30),
            TOWINKLIopshiftg.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            // Room Collection Constraints
            TOWINKLIopmesageCollectionView.topAnchor.constraint(equalTo: TOWINKLIoproomTitle.bottomAnchor, constant: 15),
            TOWINKLIopmesageCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            TOWINKLIopmesageCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            TOWINKLIopmesageCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
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
            let TOWINKLIopcell = collectionView.dequeueReusableCell(withReuseIdentifier: "TOWINKLIopMeassgecell", for: indexPath) as! TOWINKLIopMeassgecell
            // 这里可以根据 TOWINKLIopnormabasicData[indexPath.item] 刷新 cell 内容
            return TOWINKLIopcell
        }
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
       
        TOWINKLIopbanner.translatesAutoresizingMaskIntoConstraints = false
        return TOWINKLIopbanner
    }
    
    private let TOWINKLIopBaseoldby: UIImageView = {
        let TOWINKLIopIv = UIImageView(image: TOWINKLIopMediaVaultDecoder.TOWINKLIopFetchVibeGraphic(TOWINKLIopAssetAlias: "TOWINKLIopoldby"))
        TOWINKLIopIv.contentMode = .scaleAspectFill
        TOWINKLIopIv.translatesAutoresizingMaskIntoConstraints = false
        return TOWINKLIopIv
    }()
    
    private lazy var TOWINKLIopshiftg: UILabel = {
        let TOWINKLIopValTag = UILabel()
        TOWINKLIopValTag.text = "TOWINKLIopNo information dataTOWINKLIop".replacingOccurrences(of: "TOWINKLIop", with: "")
        TOWINKLIopValTag.font = .systemFont(ofSize: 20, weight: .bold)
        TOWINKLIopValTag.textColor = UIColor(red: 0.01, green: 0.4, blue: 0.68, alpha: 1)
        TOWINKLIopValTag.translatesAutoresizingMaskIntoConstraints = false
        return TOWINKLIopValTag
    }()
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == TOWINKLIopavatarCollectionView {
            let towink = TOWINKLIopnormalarData[indexPath.row]
            if let TOWINKLIopuid = towink["towInkLIopWinterSolstice"] as? Int {
                self.navigationController?.pushViewController(TOWINKLIopVibePortal.init(TOWINKLIopEntryPath: TOWINKLIopVibeRoute.TOWINKLIopReportNode.TOWINKLIopConstructFinalPath(TOWINKLIopQuery: "\(TOWINKLIopuid)")), animated: true)
            }
            return
        }
        let towink = TOWINKLIopnormabasicData[indexPath.row]
        if let TOWINKLIopuid = towink[""] as? Int {
            self.navigationController?.pushViewController(TOWINKLIopVibePortal.init(TOWINKLIopEntryPath: TOWINKLIopVibeRoute.TOWINKLIopPostVisual.TOWINKLIopConstructFinalPath(TOWINKLIopQuery: "\(TOWINKLIopuid)")), animated: true)
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
            self.TOWINKLIopnormalarData.removeAll()
            TOWINKLIopreasutl.forEach({ lsoaf in
                self.TOWINKLIopnormalarData.append(lsoaf)
           })
            self.TOWINKLIopnormalarData = TOWINKLIopreasutl
            
            self.TOWINKLIopavatarCollectionView.reloadData()
           
        } TOWINKLIopOnFailure: {  TOWINKLIoperror in
            TOWINKLIopProcessingView.stopAnimating()
            TOWINKLIopProcessingView.removeFromSuperview()
        }

        TOWINKLIopVibeRoute.TOWINKLIopTransmitSignal(TOWINKLIopEndpoint: "/jqxpwngnqmz/cwozvmtrplgb", TOWINKLIopPayload: ["towInkLIopBokehEffect":"54894011"]) { TOWINKLIopersult in
          
            guard let TOWINKLIopdata = TOWINKLIopersult as? Dictionary<String,Any> ,
                 
                    var TOWINKLIopreasutl = TOWINKLIopdata["TOWINKLIopdata".replacingOccurrences(of: "TOWINKLIop", with: "")] as? Array<Dictionary<String,Any>>
                    
            else {
               
                return
            }
           
            
            
            
            self.TOWINKLIopnormabasicData = TOWINKLIopreasutl
            
            if self.TOWINKLIopnormabasicData.count == 0{
                self.TOWINKLIopBaseoldby.isHidden = false
                self.TOWINKLIopshiftg.isHidden = false
            }else{
                self.TOWINKLIopBaseoldby.isHidden = true
                self.TOWINKLIopshiftg.isHidden = true
            }
            self.TOWINKLIopmesageCollectionView.reloadData()
           
        } TOWINKLIopOnFailure: {  TOWINKLIoperror in
           
        }
       
    }
    
}



extension UIImageView {
    
    func TOWINKLIopAssignRemoteImage(TOWINKLIopPath: String, TOWINKLIopPlaceholder: String? = nil) {
        if let TOWINKLIopDraftName = TOWINKLIopPlaceholder {
            self.image = TOWINKLIopMediaVaultDecoder.TOWINKLIopFetchVibeGraphic(TOWINKLIopAssetAlias: TOWINKLIopDraftName)
        }
        
        TOWINKLIopImageEngine.TOWINKLIopSharedLoader.TOWINKLIopFetchResource(from: TOWINKLIopPath) { [weak self] TOWINKLIopResult in
            guard let TOWINKLIopSelf = self else { return }
            if let TOWINKLIopValidImage = TOWINKLIopResult {
                UIView.transition(with: TOWINKLIopSelf, duration: 0.3, options: .transitionCrossDissolve) {
                    TOWINKLIopSelf.image = TOWINKLIopValidImage
                }
            }
        }
    }
}



class TOWINKLIopImageEngine {
    
    static let TOWINKLIopSharedLoader = TOWINKLIopImageEngine()
    private let TOWINKLIopImageCache = NSCache<AnyObject, AnyObject>()
    
    func TOWINKLIopFetchResource(from TOWINKLIopUrlStr: String, TOWINKLIopCompletion: @escaping (UIImage?) -> Void) {
        guard let TOWINKLIopTargetUrl = URL(string: TOWINKLIopUrlStr) else {
            TOWINKLIopCompletion(nil)
            return
        }
        
        if let TOWINKLIopCachedData = TOWINKLIopImageCache.object(forKey: TOWINKLIopUrlStr as AnyObject) as? UIImage {
            TOWINKLIopCompletion(TOWINKLIopCachedData)
            return
        }
        
        let TOWINKLIopTask = URLSession.shared.dataTask(with: TOWINKLIopTargetUrl) { TOWINKLIopData, TOWINKLIopResponse, TOWINKLIopError in
            guard let TOWINKLIopRawData = TOWINKLIopData,
                  let TOWINKLIopFinalImage = UIImage(data: TOWINKLIopRawData),
                  TOWINKLIopError == nil else {
                DispatchQueue.main.async { TOWINKLIopCompletion(nil) }
                return
            }
            
            self.TOWINKLIopImageCache.setObject(TOWINKLIopFinalImage, forKey: TOWINKLIopUrlStr as AnyObject)
            DispatchQueue.main.async { TOWINKLIopCompletion(TOWINKLIopFinalImage) }
        }
        TOWINKLIopTask.resume()
    }
    
    
}
