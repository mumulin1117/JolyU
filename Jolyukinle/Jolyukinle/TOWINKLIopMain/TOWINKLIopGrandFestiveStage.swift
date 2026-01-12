import UIKit

class TOWINKLIopGrandFestiveStage: UIViewController {
    
    private let TOWINKLIopPortalContainer = UIView()
    private let TOWINKLIopHolidayDock = UIView()
    private let TOWINKLIopDockHeight: CGFloat = 95
    
    // MARK: - 缓存池 (Cache Engine)
    // 使用字典缓存已创建的控制器，防止重复加载
    private var TOWINKLIopSceneRegistry: [Int: UIViewController] = [:]
    private var TOWINKLIopCurrentIndex: Int = -1
    
    private let TOWINKLIopNavigationNodes: [UIButton] = (0..<5).map { TOWINKLIopIdx in
        let TOWINKLIopNode = UIButton()
        let TOWINKLIopGlyphs = [("TOWINKLIophouse","TOWINKLIophouse.fill"), ("TOWINKLIopplay.fill","TOWINKLIopplay"), ("TOWINKLItake","TOWINKLItake"), ("TOWINKLInoti","TOWINKLIopnoti.fill"),("TOWINKLIopMy","TOWINKLIopMy.fill")]
        TOWINKLIopNode.setImage(TOWINKLIopMediaVaultDecoder.TOWINKLIopFetchVibeGraphic(TOWINKLIopAssetAlias: TOWINKLIopGlyphs[TOWINKLIopIdx].0), for: .normal)
        TOWINKLIopNode.setImage(TOWINKLIopMediaVaultDecoder.TOWINKLIopFetchVibeGraphic(TOWINKLIopAssetAlias: TOWINKLIopGlyphs[TOWINKLIopIdx].1), for: .selected)
        TOWINKLIopNode.tag = TOWINKLIopIdx
        return TOWINKLIopNode
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        TOWINKLIopConstructInfrastructure()
        TOWINKLIopNavigateToPortal(TOWINKLIopTarget: 0) // 初始加载第一页
    }
    
    private func TOWINKLIopConstructInfrastructure() {
        view.backgroundColor = .white
        TOWINKLIopPortalContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(TOWINKLIopPortalContainer)
        
        TOWINKLIopHolidayDock.backgroundColor = .white
        TOWINKLIopHolidayDock.layer.shadowColor = UIColor.black.cgColor
        TOWINKLIopHolidayDock.layer.shadowOpacity = 0.05
        TOWINKLIopHolidayDock.layer.shadowRadius = 10
        TOWINKLIopHolidayDock.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(TOWINKLIopHolidayDock)
        
        let TOWINKLIopStack = UIStackView(arrangedSubviews: TOWINKLIopNavigationNodes)
        TOWINKLIopStack.distribution = .fillEqually
        TOWINKLIopStack.alignment = .center
        TOWINKLIopStack.translatesAutoresizingMaskIntoConstraints = false
        TOWINKLIopHolidayDock.addSubview(TOWINKLIopStack)
        
        NSLayoutConstraint.activate([
            TOWINKLIopPortalContainer.topAnchor.constraint(equalTo: view.topAnchor),
            TOWINKLIopPortalContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            TOWINKLIopPortalContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            TOWINKLIopPortalContainer.bottomAnchor.constraint(equalTo: TOWINKLIopHolidayDock.topAnchor),
            TOWINKLIopHolidayDock.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            TOWINKLIopHolidayDock.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            TOWINKLIopHolidayDock.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            TOWINKLIopHolidayDock.heightAnchor.constraint(equalToConstant: TOWINKLIopDockHeight),
            TOWINKLIopStack.topAnchor.constraint(equalTo: TOWINKLIopHolidayDock.topAnchor, constant: 10),
            TOWINKLIopStack.leadingAnchor.constraint(equalTo: TOWINKLIopHolidayDock.leadingAnchor),
            TOWINKLIopStack.trailingAnchor.constraint(equalTo: TOWINKLIopHolidayDock.trailingAnchor),
            TOWINKLIopStack.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        TOWINKLIopNavigationNodes.forEach { $0.addTarget(self, action: #selector(TOWINKLIopTriggerSwitch(_:)), for: .touchUpInside) }
    }
    
    @objc private func TOWINKLIopTriggerSwitch(_ TOWINKLIopSender: UIButton) {
        TOWINKLIopNavigateToPortal(TOWINKLIopTarget: TOWINKLIopSender.tag)
    }
    
    private func TOWINKLIopNavigateToPortal(TOWINKLIopTarget: Int) {
        if TOWINKLIopTarget == 2 {
            TOWINKLIopInvokePublishingSheet()
            return
        }
        
        // 1. 如果点击的是当前页，直接返回
        if TOWINKLIopCurrentIndex == TOWINKLIopTarget { return }

        // 2. 隐藏旧的视图 (Hide current view instead of removing)
        if let TOWINKLIopOldScene = TOWINKLIopSceneRegistry[TOWINKLIopCurrentIndex] {
            TOWINKLIopOldScene.view.isHidden = true
        }

        // 3. 获取或创建新视图 (Retrieve from cache or instantiate)
        let TOWINKLIopNewScene: UIViewController
        if let TOWINKLIopCachedScene = TOWINKLIopSceneRegistry[TOWINKLIopTarget] {
            TOWINKLIopNewScene = TOWINKLIopCachedScene
            TOWINKLIopNewScene.view.isHidden = false
        } else {
            // 首次加载创建
            switch TOWINKLIopTarget {
            case 0: TOWINKLIopNewScene = TOWINKLIopLobbyEngine()
            case 1: TOWINKLIopNewScene = TOWINKLIopVibeDynamicStage()
            case 3: TOWINKLIopNewScene = TOWINKLIopMeassgeStage()
            case 4: TOWINKLIopNewScene = TOWINKLIopCenterStage()
            default: TOWINKLIopNewScene = UIViewController()
            }
            
            TOWINKLIopNewScene.view.frame = TOWINKLIopPortalContainer.bounds
            addChild(TOWINKLIopNewScene)
            TOWINKLIopPortalContainer.addSubview(TOWINKLIopNewScene.view)
            TOWINKLIopNewScene.didMove(toParent: self)
            // 存入缓存
            TOWINKLIopSceneRegistry[TOWINKLIopTarget] = TOWINKLIopNewScene
        }

        TOWINKLIopCurrentIndex = TOWINKLIopTarget
        
        // 更新按钮选中状态
        for (TOWINKLIopIdx, TOWINKLIopNode) in TOWINKLIopNavigationNodes.enumerated() {
            TOWINKLIopNode.isSelected = (TOWINKLIopIdx == TOWINKLIopTarget)
        }
    }
    

    
    private func TOWINKLIopInvokePublishingSheet() {
            let TOWINKLIopAlert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            
            let TOWINKLIopPhotoOption = UIAlertAction(title: "PhotoTOWINKLIop".replacingOccurrences(of: "TOWINKLIop", with: ""), style: .default) { _ in
                print("TOWINKLIop_Action: Open Photo Gallery")
                self.navigationController?.pushViewController(TOWINKLIopVibePortal.init(TOWINKLIopEntryPath: TOWINKLIopVibeRoute.TOWINKLIopProfileModify.TOWINKLIopConstructFinalPath(TOWINKLIopQuery: "")), animated: true)
            }
            
            let TOWINKLIopVideoOption = UIAlertAction(title: "VideoTOWINKLIop".replacingOccurrences(of: "TOWINKLIop", with: ""), style: .default) { _ in
                self.navigationController?.pushViewController(TOWINKLIopVibePortal.init(TOWINKLIopEntryPath: TOWINKLIopVibeRoute.TOWINKLIopFollowGroup.TOWINKLIopConstructFinalPath(TOWINKLIopQuery: "")), animated: true)
            }
            
            let TOWINKLIopCancelOption = UIAlertAction(title: "TOWINKLIopCancel".replacingOccurrences(of: "TOWINKLIop", with: ""), style: .cancel, handler: nil)
            
            // Customizing the appearance for the "Cancel" button to match the blue gradient theme
            TOWINKLIopPhotoOption.setValue(UIColor.systemBlue, forKey: "titleTextColor")
            TOWINKLIopVideoOption.setValue(UIColor.systemBlue, forKey: "titleTextColor")
            
            TOWINKLIopAlert.addAction(TOWINKLIopPhotoOption)
            TOWINKLIopAlert.addAction(TOWINKLIopVideoOption)
            TOWINKLIopAlert.addAction(TOWINKLIopCancelOption)
            
            // Fix for iPad support
            if let TOWINKLIopPopover = TOWINKLIopAlert.popoverPresentationController {
                TOWINKLIopPopover.sourceView = TOWINKLIopNavigationNodes[3]
                TOWINKLIopPopover.sourceRect = TOWINKLIopNavigationNodes[3].bounds
            }
            
            self.present(TOWINKLIopAlert, animated: true, completion: nil)
        }
}

