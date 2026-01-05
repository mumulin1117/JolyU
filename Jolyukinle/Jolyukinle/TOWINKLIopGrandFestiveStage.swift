//
//  TOWINKLIopGrandFestiveStage.swift
//  Jolyukinle
//
//  Created by mumu on 2026/1/5.
//

import UIKit

class TOWINKLIopGrandFestiveStage: UIViewController {
    
    private let TOWINKLIopPortalContainer = UIView()
    private let TOWINKLIopHolidayDock = UIView()
    private var TOWINKLIopActiveScene: UIViewController?
    private let TOWINKLIopDockHeight: CGFloat = 95
    
    private let TOWINKLIopNavigationNodes: [UIButton] = (0..<5).map { TOWINKLIopIdx in
        let TOWINKLIopNode = UIButton()
        let TOWINKLIopGlyphs = [("TOWINKLIophouse","TOWINKLIophouse.fill"), ("",""), ("TOWINKLItake","TOWINKLItake"), ("TOWINKLInoti","TOWINKLIopnoti.fill"),("TOWINKLIopMy","TOWINKLIopMy.fill")]
        TOWINKLIopNode.setImage(UIImage(systemName: TOWINKLIopGlyphs[TOWINKLIopIdx].0), for: .normal)
        TOWINKLIopNode.setImage(UIImage(systemName: TOWINKLIopGlyphs[TOWINKLIopIdx].1), for: .selected)
        TOWINKLIopNode.tag = TOWINKLIopIdx
        
        if TOWINKLIopIdx == 2 {
            TOWINKLIopNode.backgroundColor = .systemBlue
            TOWINKLIopNode.layer.cornerRadius = 30
            TOWINKLIopNode.layer.shadowColor = UIColor.systemBlue.cgColor
            TOWINKLIopNode.layer.shadowOpacity = 0.3
            TOWINKLIopNode.layer.shadowOffset = CGSize(width: 0, height: 4)
        }
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
        TOWINKLIopActiveScene?.willMove(toParent: nil)
        TOWINKLIopActiveScene?.view.removeFromSuperview()
        TOWINKLIopActiveScene?.removeFromParent()
        
        let TOWINKLIopNewScene: UIViewController
        switch TOWINKLIopTarget {
        case 0: TOWINKLIopNewScene = TOWINKLIopLobbyEngine()
        default: TOWINKLIopNewScene = UIViewController()
        }
        
        addChild(TOWINKLIopNewScene)
        TOWINKLIopNewScene.view.frame = TOWINKLIopPortalContainer.bounds
        TOWINKLIopPortalContainer.addSubview(TOWINKLIopNewScene.view)
        TOWINKLIopNewScene.didMove(toParent: self)
        TOWINKLIopActiveScene = TOWINKLIopNewScene
        
        for (TOWINKLIopIdx, TOWINKLIopNode) in TOWINKLIopNavigationNodes.enumerated() {
            if TOWINKLIopIdx != 2 {
                TOWINKLIopNode.tintColor = TOWINKLIopIdx == TOWINKLIopTarget ? UIColor.systemBlue : .systemGray4
            }
        }
    }
}

