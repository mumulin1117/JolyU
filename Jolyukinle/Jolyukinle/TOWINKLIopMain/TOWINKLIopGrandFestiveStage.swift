//
//  TOWINKLIopGrandFestiveStage.swift
//  Jolyukinle
//
//  Created by  on 2026/1/5.
//

import UIKit

class TOWINKLIopGrandFestiveStage: UIViewController {
    
    private let TOWINKLIopPortalContainer = UIView()
    private let TOWINKLIopHolidayDock = UIView()
    private var TOWINKLIopActiveScene: UIViewController?
    private let TOWINKLIopDockHeight: CGFloat = 95
    
    private let TOWINKLIopNavigationNodes: [UIButton] = (0..<5).map { TOWINKLIopIdx in
        let TOWINKLIopNode = UIButton()
        let TOWINKLIopGlyphs = [("TOWINKLIophouse","TOWINKLIophouse.fill"), ("TOWINKLIopplay.fill","TOWINKLIopplay"), ("TOWINKLItake","TOWINKLItake"), ("TOWINKLInoti","TOWINKLIopnoti.fill"),("TOWINKLIopMy","TOWINKLIopMy.fill")]
        TOWINKLIopNode.setImage(TOWINKLIopMediaVaultDecoder.TOWINKLIopFetchVibeGraphic(TOWINKLIopAssetAlias: TOWINKLIopGlyphs[TOWINKLIopIdx].0), for: .normal)
        TOWINKLIopNode.setImage(TOWINKLIopMediaVaultDecoder.TOWINKLIopFetchVibeGraphic(TOWINKLIopAssetAlias: TOWINKLIopGlyphs[TOWINKLIopIdx].1), for: .selected)
        TOWINKLIopNode.tag = TOWINKLIopIdx
        print(TOWINKLIopIdx)
        
        return TOWINKLIopNode
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        TOWINKLIopConstructInfrastructure()
        TOWINKLIopNavigateToPortal(TOWINKLIopTarget: 0)
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
            return // Do not switch the main scene for the popup case
        }
        
        TOWINKLIopActiveScene?.willMove(toParent: nil)
        TOWINKLIopActiveScene?.view.removeFromSuperview()
        TOWINKLIopActiveScene?.removeFromParent()
        
        let TOWINKLIopNewScene: UIViewController
        switch TOWINKLIopTarget {
        case 0: TOWINKLIopNewScene = TOWINKLIopLobbyEngine()
        case 1: TOWINKLIopNewScene = TOWINKLIopVibeDynamicStage()
        case 3: TOWINKLIopNewScene = TOWINKLIopMeassgeStage()
       
        case 4:TOWINKLIopNewScene = TOWINKLIopCenterStage()
        default: TOWINKLIopNewScene = UIViewController()
        }
        
        addChild(TOWINKLIopNewScene)
        TOWINKLIopNewScene.view.frame = TOWINKLIopPortalContainer.bounds
        TOWINKLIopPortalContainer.addSubview(TOWINKLIopNewScene.view)
        TOWINKLIopNewScene.didMove(toParent: self)
        TOWINKLIopActiveScene = TOWINKLIopNewScene
        
        for (TOWINKLIopIdx, TOWINKLIopNode) in TOWINKLIopNavigationNodes.enumerated() {
            if TOWINKLIopIdx == TOWINKLIopTarget {
                TOWINKLIopNode.isSelected = true
            }else{
                TOWINKLIopNode.isSelected = false
            }
//            if TOWINKLIopIdx != 2 {
//                TOWINKLIopNode.is = TOWINKLIopIdx == TOWINKLIopTarget ? UIColor.systemBlue : .systemGray4
//            }
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

