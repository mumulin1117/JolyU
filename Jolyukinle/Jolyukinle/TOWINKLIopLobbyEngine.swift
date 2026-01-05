//
//  TOWINKLIopLobbyEngine.swift
//  Jolyukinle
//
//  Created by mumu on 2026/1/5.
//

import UIKit
//home
class TOWINKLIopLobbyEngine: UIViewController {
    
    private let TOWINKLIopScrollPlane = UIScrollView()
    private let TOWINKLIopContentRoot = UIView()
    
    private let TOWINKLIopBrandLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "JOLYU"
        lbl.font = UIFont(name: "AvenirNext-Heavy", size: 36)
        lbl.textColor = UIColor(red: 0.6, green: 0.8, blue: 0.8, alpha: 1.0)
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TOWINKLIopInitializeScene()
    }
    
    private func TOWINKLIopInitializeScene() {
        view.backgroundColor = .white
        TOWINKLIopScrollPlane.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(TOWINKLIopScrollPlane)
        
        TOWINKLIopContentRoot.translatesAutoresizingMaskIntoConstraints = false
        TOWINKLIopScrollPlane.addSubview(TOWINKLIopContentRoot)
        
        let TOWINKLIopConfigBtn = TOWINKLIopGenerateUtilBtn(TOWINKLIopIcon: "gearshape.fill")
        let TOWINKLIopSignalBtn = TOWINKLIopGenerateUtilBtn(TOWINKLIopIcon: "paperplane.fill")
        
        let TOWINKLIopHeaderBox = UIStackView(arrangedSubviews: [TOWINKLIopBrandLabel, UIView(), TOWINKLIopConfigBtn, TOWINKLIopSignalBtn])
        TOWINKLIopHeaderBox.spacing = 15
        TOWINKLIopHeaderBox.alignment = .center
        TOWINKLIopHeaderBox.translatesAutoresizingMaskIntoConstraints = false
        TOWINKLIopContentRoot.addSubview(TOWINKLIopHeaderBox)
        
        let TOWINKLIopAvatars = TOWINKLIopCreateHorizontalShelf()
        TOWINKLIopContentRoot.addSubview(TOWINKLIopAvatars)
        
        let TOWINKLIopAIBanner = TOWINKLIopCreateSparkBanner()
        TOWINKLIopContentRoot.addSubview(TOWINKLIopAIBanner)
        
        let TOWINKLIopRoomTitle = UILabel()
        TOWINKLIopRoomTitle.text = "Chat Room"
        TOWINKLIopRoomTitle.font = .systemFont(ofSize: 24, weight: .bold)
        TOWINKLIopRoomTitle.translatesAutoresizingMaskIntoConstraints = false
        TOWINKLIopContentRoot.addSubview(TOWINKLIopRoomTitle)
        
        let TOWINKLIopRoomShelf = TOWINKLIopCreateRoomGrid()
        TOWINKLIopContentRoot.addSubview(TOWINKLIopRoomShelf)

        NSLayoutConstraint.activate([
            TOWINKLIopScrollPlane.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            TOWINKLIopScrollPlane.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            TOWINKLIopScrollPlane.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            TOWINKLIopScrollPlane.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            TOWINKLIopContentRoot.topAnchor.constraint(equalTo: TOWINKLIopScrollPlane.topAnchor),
            TOWINKLIopContentRoot.leadingAnchor.constraint(equalTo: TOWINKLIopScrollPlane.leadingAnchor),
            TOWINKLIopContentRoot.trailingAnchor.constraint(equalTo: TOWINKLIopScrollPlane.trailingAnchor),
            TOWINKLIopContentRoot.bottomAnchor.constraint(equalTo: TOWINKLIopScrollPlane.bottomAnchor),
            TOWINKLIopContentRoot.widthAnchor.constraint(equalTo: TOWINKLIopScrollPlane.widthAnchor),
            
            TOWINKLIopHeaderBox.topAnchor.constraint(equalTo: TOWINKLIopContentRoot.topAnchor, constant: 10),
            TOWINKLIopHeaderBox.leadingAnchor.constraint(equalTo: TOWINKLIopContentRoot.leadingAnchor, constant: 20),
            TOWINKLIopHeaderBox.trailingAnchor.constraint(equalTo: TOWINKLIopContentRoot.trailingAnchor, constant: -20),
            
            TOWINKLIopAvatars.topAnchor.constraint(equalTo: TOWINKLIopHeaderBox.bottomAnchor, constant: 20),
            TOWINKLIopAvatars.leadingAnchor.constraint(equalTo: TOWINKLIopContentRoot.leadingAnchor),
            TOWINKLIopAvatars.trailingAnchor.constraint(equalTo: TOWINKLIopContentRoot.trailingAnchor),
            TOWINKLIopAvatars.heightAnchor.constraint(equalToConstant: 100),
            
            TOWINKLIopAIBanner.topAnchor.constraint(equalTo: TOWINKLIopAvatars.bottomAnchor, constant: 20),
            TOWINKLIopAIBanner.leadingAnchor.constraint(equalTo: TOWINKLIopContentRoot.leadingAnchor, constant: 20),
            TOWINKLIopAIBanner.trailingAnchor.constraint(equalTo: TOWINKLIopContentRoot.trailingAnchor, constant: -20),
            TOWINKLIopAIBanner.heightAnchor.constraint(equalToConstant: 180),
            
            TOWINKLIopRoomTitle.topAnchor.constraint(equalTo: TOWINKLIopAIBanner.bottomAnchor, constant: 30),
            TOWINKLIopRoomTitle.leadingAnchor.constraint(equalTo: TOWINKLIopContentRoot.leadingAnchor, constant: 20),
            
            TOWINKLIopRoomShelf.topAnchor.constraint(equalTo: TOWINKLIopRoomTitle.bottomAnchor, constant: 15),
            TOWINKLIopRoomShelf.leadingAnchor.constraint(equalTo: TOWINKLIopContentRoot.leadingAnchor),
            TOWINKLIopRoomShelf.trailingAnchor.constraint(equalTo: TOWINKLIopContentRoot.trailingAnchor),
            TOWINKLIopRoomShelf.heightAnchor.constraint(equalToConstant: 320),
            TOWINKLIopRoomShelf.bottomAnchor.constraint(equalTo: TOWINKLIopContentRoot.bottomAnchor, constant: -20)
        ])
    }
    
    private func TOWINKLIopGenerateUtilBtn(TOWINKLIopIcon: String) -> UIButton {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(systemName: TOWINKLIopIcon), for: .normal)
        btn.tintColor = .systemBlue
        btn.backgroundColor = UIColor(white: 0.96, alpha: 1)
        btn.layer.cornerRadius = 22
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.widthAnchor.constraint(equalToConstant: 44).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 44).isActive = true
        return btn
    }
    
    private func TOWINKLIopCreateHorizontalShelf() -> UIView {
        let shelf = UIView()
        shelf.translatesAutoresizingMaskIntoConstraints = false
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 15
        stack.translatesAutoresizingMaskIntoConstraints = false
        shelf.addSubview(stack)
        
        for _ in 0...6 {
            let circle = UIView()
            circle.backgroundColor = .systemGray6
            circle.layer.cornerRadius = 35
            circle.widthAnchor.constraint(equalToConstant: 70).isActive = true
            circle.heightAnchor.constraint(equalToConstant: 70).isActive = true
            stack.addArrangedSubview(circle)
        }
        
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: shelf.leadingAnchor, constant: 20),
            stack.centerYAnchor.constraint(equalTo: shelf.centerYAnchor)
        ])
        return shelf
    }
    
    private func TOWINKLIopCreateSparkBanner() -> UIView {
        let banner = UIView()
        banner.backgroundColor = UIColor(red: 0.95, green: 0.98, blue: 1.0, alpha: 1.0)
        banner.layer.cornerRadius = 25
        banner.translatesAutoresizingMaskIntoConstraints = false
        
        let lbl = UILabel()
        lbl.text = "Chatbot Name >"
        lbl.font = .systemFont(ofSize: 28, weight: .black)
        lbl.textColor = .systemBlue
        lbl.translatesAutoresizingMaskIntoConstraints = false
        banner.addSubview(lbl)
        
        let go = UIButton(type: .system)
        go.setTitle("GO >", for: .normal)
        go.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.2)
        go.setTitleColor(.systemGreen, for: .normal)
        go.layer.cornerRadius = 15
        go.translatesAutoresizingMaskIntoConstraints = false
        banner.addSubview(go)
        
        NSLayoutConstraint.activate([
            lbl.topAnchor.constraint(equalTo: banner.topAnchor, constant: 30),
            lbl.leadingAnchor.constraint(equalTo: banner.leadingAnchor, constant: 20),
            go.bottomAnchor.constraint(equalTo: banner.bottomAnchor, constant: -20),
            go.leadingAnchor.constraint(equalTo: lbl.leadingAnchor),
            go.widthAnchor.constraint(equalToConstant: 80),
            go.heightAnchor.constraint(equalToConstant: 35)
        ])
        return banner
    }
    
    private func TOWINKLIopCreateRoomGrid() -> UIView {
        let grid = UIView()
        grid.translatesAutoresizingMaskIntoConstraints = false
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        grid.addSubview(stack)
        
        for _ in 0...2 {
            let card = UIView()
            card.backgroundColor = .white
            card.layer.cornerRadius = 20
            card.layer.borderWidth = 1
            card.layer.borderColor = UIColor.systemGray6.cgColor
            card.widthAnchor.constraint(equalToConstant: 180).isActive = true
            
            let join = UIButton(type: .system)
            join.setTitle("Join chat", for: .normal)
            join.backgroundColor = .systemBlue
            join.setTitleColor(.white, for: .normal)
            join.layer.cornerRadius = 15
            join.translatesAutoresizingMaskIntoConstraints = false
            card.addSubview(join)
            
            NSLayoutConstraint.activate([
                join.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -15),
                join.centerXAnchor.constraint(equalTo: card.centerXAnchor),
                join.widthAnchor.constraint(equalToConstant: 140),
                join.heightAnchor.constraint(equalToConstant: 35)
            ])
            stack.addArrangedSubview(card)
        }
        
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: grid.leadingAnchor, constant: 20),
            stack.topAnchor.constraint(equalTo: grid.topAnchor),
            stack.bottomAnchor.constraint(equalTo: grid.bottomAnchor)
        ])
        return grid
    }
}
