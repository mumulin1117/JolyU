
import UIKit



class TOWINKLIopCenterStage: UIViewController {
    
    private let TOWINKLIopBaseVisualBackground: UIImageView = {
        let TOWINKLIopIv = UIImageView(image: TOWINKLIopMediaVaultDecoder.TOWINKLIopFetchVibeGraphic(TOWINKLIopAssetAlias: "TOWINKLIopbg"))
        TOWINKLIopIv.contentMode = .scaleAspectFill
        return TOWINKLIopIv
    }()
    
    private let TOWINKLIopUpperDeckContainer: UIView = {
        let TOWINKLIopV = UIView()
        TOWINKLIopV.backgroundColor = .white
        TOWINKLIopV.layer.cornerRadius = 35
        TOWINKLIopV.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        TOWINKLIopV.translatesAutoresizingMaskIntoConstraints = false
        return TOWINKLIopV
    }()
    
    private let TOWINKLIopSkylineHeader: UIView = {
        let TOWINKLIopV = UIView()
        TOWINKLIopV.backgroundColor = UIColor(red: 0.56, green: 0.8, blue: 0.84, alpha: 1)
        TOWINKLIopV.layer.cornerRadius = 35
        TOWINKLIopV.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        TOWINKLIopV.translatesAutoresizingMaskIntoConstraints = false
        return TOWINKLIopV
    }()
    
    private let TOWINKLIopPersonaProfileFrame: UIImageView = {
        let TOWINKLIopIv = UIImageView()
        TOWINKLIopIv.layer.cornerRadius = 37
        TOWINKLIopIv.layer.borderWidth = 4
        TOWINKLIopIv.layer.borderColor = UIColor.white.cgColor
        TOWINKLIopIv.clipsToBounds = true
        TOWINKLIopIv.backgroundColor = .systemGray5
        TOWINKLIopIv.contentMode = .scaleAspectFill
        TOWINKLIopIv.image = TOWINKLIopMediaVaultDecoder.TOWINKLIopFetchVibeGraphic(TOWINKLIopAssetAlias: "appNOIVon")
        TOWINKLIopIv.translatesAutoresizingMaskIntoConstraints = false
        return TOWINKLIopIv
    }()

    private lazy var TOWINKLIopPersonaModifyTrigger: UIButton = {
        let TOWINKLIopBtn = UIButton(type: .system)
        TOWINKLIopBtn.setTitle("✎ Edit", for: .normal)
        TOWINKLIopBtn.setTitleColor(.white, for: .normal)
        TOWINKLIopBtn.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
        TOWINKLIopBtn.layer.cornerRadius = 11
        TOWINKLIopBtn.clipsToBounds = true
        TOWINKLIopBtn.translatesAutoresizingMaskIntoConstraints = false
        TOWINKLIopBtn.addTarget(self, action: #selector(TOWINKLIopedit), for: .touchUpInside)
        return TOWINKLIopBtn
    }()
    @objc func TOWINKLIopedit()  {
        self.navigationController?.pushViewController(TOWINKLIopVibePortal.init(TOWINKLIopEntryPath: TOWINKLIopVibeRoute.TOWINKLIopSparkAI.TOWINKLIopConstructFinalPath(TOWINKLIopQuery: "")), animated: true)
    }
    private let TOWINKLIopMetricMetricsStack: UIStackView = {
        let TOWINKLIopStack = UIStackView()
        TOWINKLIopStack.axis = .horizontal
        TOWINKLIopStack.distribution = .equalSpacing
        TOWINKLIopStack.alignment = .center
        TOWINKLIopStack.spacing = 15
        TOWINKLIopStack.translatesAutoresizingMaskIntoConstraints = false
        return TOWINKLIopStack
    }()
    
    private var TOWINKLIopCurrentGalleryState: TOWINKLIopFeedCategory = .TOWINKLIopMomentMode
    
    private let TOWINKLIopPerspectiveSwitcher: UISegmentedControl = {
        let TOWINKLIopItems = ["MomentTOWINKLIop".replacingOccurrences(of: "TOWINKLIop", with: ""), "TOWINKLIopVideo".replacingOccurrences(of: "TOWINKLIop", with: "")]
        let TOWINKLIopSc = UISegmentedControl(items: TOWINKLIopItems)
        TOWINKLIopSc.selectedSegmentIndex = 0
        TOWINKLIopSc.selectedSegmentTintColor = .clear
        TOWINKLIopSc.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        TOWINKLIopSc.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        let TOWINKLIopNormAttr: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 18, weight: .bold), .foregroundColor: UIColor.lightGray]
        let TOWINKLIopSelAttr: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 22, weight: .bold), .foregroundColor: UIColor(red: 0.01, green: 0.4, blue: 0.68, alpha: 1)]
        TOWINKLIopSc.setTitleTextAttributes(TOWINKLIopNormAttr, for: .normal)
        TOWINKLIopSc.setTitleTextAttributes(TOWINKLIopSelAttr, for: .selected)
        TOWINKLIopSc.translatesAutoresizingMaskIntoConstraints = false
        return TOWINKLIopSc
    }()

    private let TOWINKLIopIdentLogo: UIImageView = {
        let TOWINKLIopIv = UIImageView(image: TOWINKLIopMediaVaultDecoder.TOWINKLIopFetchVibeGraphic(TOWINKLIopAssetAlias: "joiyaubdipersonnaesgel"))
        TOWINKLIopIv.contentMode = .scaleAspectFit
        return TOWINKLIopIv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        TOWINKLIopArchitectScene()
    }
    
    private func TOWINKLIopArchitectScene() {
        TOWINKLIopBaseVisualBackground.frame = view.bounds
        view.addSubview(TOWINKLIopBaseVisualBackground)
        view.addSubview(TOWINKLIopUpperDeckContainer)
        
        TOWINKLIopUpperDeckContainer.addSubview(TOWINKLIopSkylineHeader)
        TOWINKLIopUpperDeckContainer.addSubview(TOWINKLIopPersonaProfileFrame)
        TOWINKLIopUpperDeckContainer.addSubview(TOWINKLIopPersonaModifyTrigger)
        TOWINKLIopUpperDeckContainer.addSubview(TOWINKLIopMetricMetricsStack)
        
        view.addSubview(TOWINKLIopPerspectiveSwitcher)
        view.addSubview(TOWINKLIopBaseoldby)
        view.addSubview(TOWINKLIopshiftg)
        TOWINKLIopDecorateModifyTrigger()
        TOWINKLIopAssembleIdentityLayer()
        TOWINKLIopPopulateMetrics()
        TOWINKLIopApplyLayoutConstraints()
        
       
    }
    
    private func TOWINKLIopDecorateModifyTrigger() {
        let TOWINKLIopGrad = CAGradientLayer()
        TOWINKLIopGrad.colors = [UIColor.systemBlue.cgColor, UIColor.systemPurple.cgColor]
        TOWINKLIopGrad.startPoint = CGPoint(x: 0, y: 0.5)
        TOWINKLIopGrad.endPoint = CGPoint(x: 1, y: 0.5)
        TOWINKLIopGrad.frame = CGRect(x: 0, y: 0, width: 60, height: 22)
        TOWINKLIopPersonaModifyTrigger.layer.insertSublayer(TOWINKLIopGrad, at: 0)
    }
    @objc func TOWINKLIopset()  {
        self.navigationController?.pushViewController(TOWINKLIopVibePortal.init(TOWINKLIopEntryPath: TOWINKLIopVibeRoute.TOWINKLIopBalanceVault.TOWINKLIopConstructFinalPath(TOWINKLIopQuery: "")), animated: true)
    }
    @objc func TOWINKLIoblanceeruiyt()  {
        self.navigationController?.pushViewController(TOWINKLIopVibePortal.init(TOWINKLIopEntryPath: TOWINKLIopVibeRoute.TOWINKLIopDirectWhisper.TOWINKLIopConstructFinalPath(TOWINKLIopQuery: "")), animated: true)
    }
    
    
    
   
    
    
    private func TOWINKLIopAssembleIdentityLayer() {
        let TOWINKLIopOptionBtn = TOWINKLIopGenerateActionNode(TOWINKLIopSymbol: "TOWINKLIopgearshape")
        TOWINKLIopOptionBtn.addTarget(self, action: #selector(TOWINKLIopset), for: .touchUpInside)
        let TOWINKLIopCommBtn = TOWINKLIopGenerateActionNode(TOWINKLIopSymbol: "TOWINKLIoppapdimoad")
        TOWINKLIopCommBtn.addTarget(self, action: #selector(TOWINKLIoblanceeruiyt), for: .touchUpInside)
        let TOWINKLIopTopBar = UIStackView(arrangedSubviews: [TOWINKLIopIdentLogo, UIView(), TOWINKLIopOptionBtn, TOWINKLIopCommBtn])
        TOWINKLIopTopBar.spacing = 15
        TOWINKLIopTopBar.alignment = .center
        TOWINKLIopTopBar.translatesAutoresizingMaskIntoConstraints = false
        TOWINKLIopSkylineHeader.addSubview(TOWINKLIopTopBar)
        
        NSLayoutConstraint.activate([
            TOWINKLIopTopBar.bottomAnchor.constraint(equalTo: TOWINKLIopSkylineHeader.bottomAnchor, constant: -16),
            TOWINKLIopTopBar.leadingAnchor.constraint(equalTo: TOWINKLIopSkylineHeader.leadingAnchor, constant: 20),
            TOWINKLIopTopBar.trailingAnchor.constraint(equalTo: TOWINKLIopSkylineHeader.trailingAnchor, constant: -20)
        ])
    }
    
    private func TOWINKLIopPopulateMetrics() {
        TOWINKLIopMetricMetricsStack.addArrangedSubview(TOWINKLIopCraftMetricNode(TOWINKLIopVal: "0", TOWINKLIopTitle: "TOWINKLIopGifts".replacingOccurrences(of: "TOWINKLIop", with: ""), TOWINKLIopindex: 99))
        TOWINKLIopMetricMetricsStack.addArrangedSubview(TOWINKLIopCraftSplitter())
        TOWINKLIopMetricMetricsStack.addArrangedSubview(TOWINKLIopCraftMetricNode(TOWINKLIopVal: "0", TOWINKLIopTitle: "TOWINKLIopFollowers".replacingOccurrences(of: "TOWINKLIop", with: ""), TOWINKLIopindex: 999))
        TOWINKLIopMetricMetricsStack.addArrangedSubview(TOWINKLIopCraftSplitter())
        TOWINKLIopMetricMetricsStack.addArrangedSubview(TOWINKLIopCraftMetricNode(TOWINKLIopVal: "0", TOWINKLIopTitle: "TOWINKLIopFollowing".replacingOccurrences(of: "TOWINKLIop", with: ""), TOWINKLIopindex: 9999))
    }

    private func TOWINKLIopApplyLayoutConstraints() {
        NSLayoutConstraint.activate([
            TOWINKLIopUpperDeckContainer.topAnchor.constraint(equalTo: view.topAnchor),
            TOWINKLIopUpperDeckContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            TOWINKLIopUpperDeckContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            TOWINKLIopUpperDeckContainer.heightAnchor.constraint(equalToConstant: 204),
            
            TOWINKLIopSkylineHeader.topAnchor.constraint(equalTo: TOWINKLIopUpperDeckContainer.topAnchor),
            TOWINKLIopSkylineHeader.leadingAnchor.constraint(equalTo: TOWINKLIopUpperDeckContainer.leadingAnchor),
            TOWINKLIopSkylineHeader.trailingAnchor.constraint(equalTo: TOWINKLIopUpperDeckContainer.trailingAnchor),
            TOWINKLIopSkylineHeader.heightAnchor.constraint(equalToConstant: 110),
            
            TOWINKLIopPersonaProfileFrame.topAnchor.constraint(equalTo: TOWINKLIopSkylineHeader.bottomAnchor, constant: 15),
            TOWINKLIopPersonaProfileFrame.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            TOWINKLIopPersonaProfileFrame.widthAnchor.constraint(equalToConstant: 74),
            TOWINKLIopPersonaProfileFrame.heightAnchor.constraint(equalToConstant: 74),

            TOWINKLIopPersonaModifyTrigger.centerXAnchor.constraint(equalTo: TOWINKLIopPersonaProfileFrame.centerXAnchor),
            TOWINKLIopPersonaModifyTrigger.topAnchor.constraint(equalTo: TOWINKLIopPersonaProfileFrame.bottomAnchor, constant: -11),
            TOWINKLIopPersonaModifyTrigger.widthAnchor.constraint(equalToConstant: 60),
            TOWINKLIopPersonaModifyTrigger.heightAnchor.constraint(equalToConstant: 22),
            
            TOWINKLIopMetricMetricsStack.centerYAnchor.constraint(equalTo: TOWINKLIopPersonaProfileFrame.centerYAnchor),
            TOWINKLIopMetricMetricsStack.leadingAnchor.constraint(equalTo: TOWINKLIopPersonaProfileFrame.trailingAnchor, constant: 15),
            TOWINKLIopMetricMetricsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
            TOWINKLIopPerspectiveSwitcher.topAnchor.constraint(equalTo: TOWINKLIopUpperDeckContainer.bottomAnchor, constant: 30),
            TOWINKLIopPerspectiveSwitcher.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            TOWINKLIopPerspectiveSwitcher.widthAnchor.constraint(equalToConstant: 220),
            TOWINKLIopPerspectiveSwitcher.heightAnchor.constraint(equalToConstant: 35),
            
            TOWINKLIopBaseoldby.topAnchor.constraint(equalTo: TOWINKLIopPerspectiveSwitcher.bottomAnchor, constant: 30),
            TOWINKLIopBaseoldby.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            TOWINKLIopshiftg.topAnchor.constraint(equalTo: TOWINKLIopBaseoldby.bottomAnchor, constant: 30),
            TOWINKLIopshiftg.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
    }

    private func TOWINKLIopGenerateActionNode(TOWINKLIopSymbol: String) -> UIButton {
        let TOWINKLIopBtn = UIButton()
        TOWINKLIopBtn.setImage(TOWINKLIopMediaVaultDecoder.TOWINKLIopFetchVibeGraphic(TOWINKLIopAssetAlias: TOWINKLIopSymbol), for: .normal)
        TOWINKLIopBtn.tintColor = .white
        TOWINKLIopBtn.translatesAutoresizingMaskIntoConstraints = false
        TOWINKLIopBtn.widthAnchor.constraint(equalToConstant: 44).isActive = true
        TOWINKLIopBtn.heightAnchor.constraint(equalToConstant: 44).isActive = true
        return TOWINKLIopBtn
    }

    private func TOWINKLIopCraftMetricNode(TOWINKLIopVal: String, TOWINKLIopTitle: String,TOWINKLIopindex:Int) -> UIView {
        let TOWINKLIopBox = UIView()
        TOWINKLIopBox.tag = TOWINKLIopindex
        let TOWINKLIopValTag = UILabel()
        TOWINKLIopValTag.text = TOWINKLIopVal
        TOWINKLIopValTag.font = .systemFont(ofSize: 20, weight: .bold)
        TOWINKLIopValTag.textColor = UIColor(red: 0.01, green: 0.4, blue: 0.68, alpha: 1)
        TOWINKLIopValTag.translatesAutoresizingMaskIntoConstraints = false
        
        let TOWINKLIopTitleTag = UILabel()
        TOWINKLIopTitleTag.text = TOWINKLIopTitle
        TOWINKLIopTitleTag.font = .systemFont(ofSize: 12, weight: .regular)
        TOWINKLIopTitleTag.textColor = UIColor(red: 0.01, green: 0.4, blue: 0.68, alpha: 1)
        TOWINKLIopTitleTag.translatesAutoresizingMaskIntoConstraints = false
        
        TOWINKLIopBox.addSubview(TOWINKLIopValTag)
        TOWINKLIopBox.addSubview(TOWINKLIopTitleTag)
        TOWINKLIopBox.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(TOWINKLIoblance(touchVire:))))
        NSLayoutConstraint.activate([
            TOWINKLIopValTag.topAnchor.constraint(equalTo: TOWINKLIopBox.topAnchor),
            TOWINKLIopValTag.centerXAnchor.constraint(equalTo: TOWINKLIopBox.centerXAnchor),
            TOWINKLIopTitleTag.topAnchor.constraint(equalTo: TOWINKLIopValTag.bottomAnchor, constant: 2),
            TOWINKLIopTitleTag.centerXAnchor.constraint(equalTo: TOWINKLIopBox.centerXAnchor),
            TOWINKLIopTitleTag.bottomAnchor.constraint(equalTo: TOWINKLIopBox.bottomAnchor)
        ])
        return TOWINKLIopBox
    }
    
    @objc func TOWINKLIoblance(touchVire:UITapGestureRecognizer)  {
        if touchVire.view?.tag == 99 {
            self.navigationController?.pushViewController(TOWINKLIopVibePortal.init(TOWINKLIopEntryPath: TOWINKLIopVibeRoute.TOWINKLIopgift.TOWINKLIopConstructFinalPath(TOWINKLIopQuery: "")), animated: true)
        }
        
        if touchVire.view?.tag == 999 {
            self.navigationController?.pushViewController(TOWINKLIopVibePortal.init(TOWINKLIopEntryPath: TOWINKLIopVibeRoute.TOWINKLIopLegalTerms.TOWINKLIopConstructFinalPath(TOWINKLIopQuery: "")), animated: true)
        }
        
        if touchVire.view?.tag == 9999 {
            self.navigationController?.pushViewController(TOWINKLIopVibePortal.init(TOWINKLIopEntryPath: TOWINKLIopVibeRoute.TOWINKLIopMasterConfig.TOWINKLIopConstructFinalPath(TOWINKLIopQuery: "")), animated: true)
        }
       
    }
    
    
    private func TOWINKLIopCraftSplitter() -> UIView {
        let TOWINKLIopLine = UIView()
        TOWINKLIopLine.backgroundColor = .systemGray5
        TOWINKLIopLine.widthAnchor.constraint(equalToConstant: 1).isActive = true
        TOWINKLIopLine.heightAnchor.constraint(equalToConstant: 25).isActive = true
        return TOWINKLIopLine
    }
    
    private let TOWINKLIopBaseoldby: UIImageView = {
        let TOWINKLIopIv = UIImageView(image: TOWINKLIopMediaVaultDecoder.TOWINKLIopFetchVibeGraphic(TOWINKLIopAssetAlias: "TOWINKLIopoldby"))
        TOWINKLIopIv.contentMode = .scaleAspectFill
        TOWINKLIopIv.translatesAutoresizingMaskIntoConstraints = false
        return TOWINKLIopIv
    }()
    
    private lazy var TOWINKLIopshiftg: UILabel = {
        let TOWINKLIopValTag = UILabel()
        TOWINKLIopValTag.text = "No TOWINKLIoppost data".replacingOccurrences(of: "TOWINKLIop", with: "")
        TOWINKLIopValTag.font = .systemFont(ofSize: 20, weight: .bold)
        TOWINKLIopValTag.textColor = UIColor(red: 0.01, green: 0.4, blue: 0.68, alpha: 1)
        TOWINKLIopValTag.translatesAutoresizingMaskIntoConstraints = false
        return TOWINKLIopValTag
    }()

}

