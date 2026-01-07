//
//  TOWINKLIopPortalViewController.swift
//  Jolyukinle
//
//  Created by  on 2026/1/5.
//

import UIKit
import SafariServices
    //fore log
class TOWINKLIopPortalViewController: UIViewController {

    private let TOWINKLIopFestiveBackground: UIImageView = {
        let TOWINKLIopView = UIImageView()
        TOWINKLIopView.image = UIImage(named: "TOWINKLIop_Login_Bg")
        TOWINKLIopView.contentMode = .scaleAspectFill
        TOWINKLIopView.translatesAutoresizingMaskIntoConstraints = false
        return TOWINKLIopView
    }()

    private let TOWINKLIopEulaTrigger: UIButton = {
        let TOWINKLIopBtn = UIButton()
        TOWINKLIopBtn.setBackgroundImage(UIImage.init(named: "ELUATOWINKLIop"), for: .normal)
        TOWINKLIopBtn.translatesAutoresizingMaskIntoConstraints = false
        return TOWINKLIopBtn
    }()

    private let TOWINKLIopAppSlogan: UIImageView = {
        let TOWINKLIopLabel = UIImageView.init(image: UIImage.init(named: "Martin Randolph"))
        TOWINKLIopLabel.contentMode = .scaleToFill
        TOWINKLIopLabel.translatesAutoresizingMaskIntoConstraints = false
        return TOWINKLIopLabel
    }()

    private let TOWINKLIopEntryAction: UIButton = {
        let TOWINKLIopBtn = UIButton(type: .system)
        TOWINKLIopBtn.setTitle("Login with email", for: .normal)
        TOWINKLIopBtn.setTitleColor(.white, for: .normal)
        TOWINKLIopBtn.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        TOWINKLIopBtn.layer.cornerRadius = 30
        TOWINKLIopBtn.clipsToBounds = true
        TOWINKLIopBtn.translatesAutoresizingMaskIntoConstraints = false
        return TOWINKLIopBtn
    }()

    private let TOWINKLIopGradientLayer: CAGradientLayer = {
        let TOWINKLIopLayer = CAGradientLayer()
        TOWINKLIopLayer.colors = [UIColor.systemBlue.cgColor, UIColor.systemPurple.cgColor]
        TOWINKLIopLayer.startPoint = CGPoint(x: 0, y: 0.5)
        TOWINKLIopLayer.endPoint = CGPoint(x: 1, y: 0.5)
        return TOWINKLIopLayer
    }()

    private let TOWINKLIopConsentRadio: UIButton = {
        let TOWINKLIopBtn = UIButton(type: .custom)
        TOWINKLIopBtn.setImage(UIImage(named: "TOWINKLcheckmar"), for: .normal)
        TOWINKLIopBtn.setImage(UIImage(named: "TOWINKLcheckmarfill"), for: .selected)
      
        TOWINKLIopBtn.translatesAutoresizingMaskIntoConstraints = false
        return TOWINKLIopBtn
    }()

    private let TOWINKLIopLegalText: UITextView = {
        let TOWINKLIopTV = UITextView()
        TOWINKLIopTV.isEditable = false
        TOWINKLIopTV.isScrollEnabled = false
        TOWINKLIopTV.backgroundColor = .clear
        TOWINKLIopTV.textAlignment = .left
        TOWINKLIopTV.translatesAutoresizingMaskIntoConstraints = false
        return TOWINKLIopTV
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        TOWINKLIopConstructLayout()
        TOWINKLIopBindInteractions()
        TOWINKLIopStylizeLegalLink()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        TOWINKLIopGradientLayer.frame = TOWINKLIopEntryAction.bounds
    }
    
    private let TOWINKLIopNoaccountTitle: UILabel = {
        let TOWINKLIopLabel = UILabel()
        TOWINKLIopLabel.text = "If no account ,we'll create one for you!"
        TOWINKLIopLabel.textColor = .white
        TOWINKLIopLabel.font = .systemFont(ofSize: 12, weight: .regular)
        TOWINKLIopLabel.translatesAutoresizingMaskIntoConstraints = false
        return TOWINKLIopLabel
    }()
    private func TOWINKLIopConstructLayout() {
        view.addSubview(TOWINKLIopFestiveBackground)
        view.addSubview(TOWINKLIopEulaTrigger)
        view.addSubview(TOWINKLIopAppSlogan)
        view.addSubview(TOWINKLIopEntryAction)
        view.addSubview(TOWINKLIopConsentRadio)
        view.addSubview(TOWINKLIopLegalText)
        view.addSubview(TOWINKLIopNoaccountTitle)
        TOWINKLIopEntryAction.layer.insertSublayer(TOWINKLIopGradientLayer, at: 0)

        NSLayoutConstraint.activate([
            TOWINKLIopFestiveBackground.topAnchor.constraint(equalTo: view.topAnchor),
            TOWINKLIopFestiveBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            TOWINKLIopFestiveBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            TOWINKLIopFestiveBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            TOWINKLIopEulaTrigger.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            TOWINKLIopEulaTrigger.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            TOWINKLIopEulaTrigger.widthAnchor.constraint(equalToConstant: 100),
            TOWINKLIopEulaTrigger.heightAnchor.constraint(equalToConstant: 44),

            TOWINKLIopEntryAction.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -140),
            TOWINKLIopEntryAction.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            TOWINKLIopEntryAction.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            TOWINKLIopEntryAction.heightAnchor.constraint(equalToConstant: 60),
            TOWINKLIopNoaccountTitle.topAnchor.constraint(equalTo: TOWINKLIopEntryAction.bottomAnchor, constant: 10),
            TOWINKLIopNoaccountTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            TOWINKLIopAppSlogan.bottomAnchor.constraint(equalTo: TOWINKLIopEntryAction.topAnchor, constant: -40),
            TOWINKLIopAppSlogan.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            TOWINKLIopConsentRadio.leadingAnchor.constraint(equalTo: TOWINKLIopEntryAction.leadingAnchor),
            TOWINKLIopConsentRadio.topAnchor.constraint(equalTo: TOWINKLIopNoaccountTitle.bottomAnchor, constant: 30),
            TOWINKLIopConsentRadio.widthAnchor.constraint(equalToConstant: 25),
            TOWINKLIopConsentRadio.heightAnchor.constraint(equalToConstant: 25),

            TOWINKLIopLegalText.centerYAnchor.constraint(equalTo: TOWINKLIopConsentRadio.centerYAnchor),
            TOWINKLIopLegalText.leadingAnchor.constraint(equalTo: TOWINKLIopConsentRadio.trailingAnchor, constant: 5),
            TOWINKLIopLegalText.trailingAnchor.constraint(equalTo: TOWINKLIopEntryAction.trailingAnchor)
        ])
    }

    private func TOWINKLIopStylizeLegalLink() {
        let TOWINKLIopBaseStr = "Agree to the User Agreement and Privacy Agreement"
        let TOWINKLIopAttrStr = NSMutableAttributedString(string: TOWINKLIopBaseStr)
        
        let TOWINKLIopRangeUser = (TOWINKLIopBaseStr as NSString).range(of: "User Agreement")
        let TOWINKLIopRangePrivacy = (TOWINKLIopBaseStr as NSString).range(of: "Privacy Agreement")
        
        let TOWINKLIopCommonAttr: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont.systemFont(ofSize: 14)
        ]
        TOWINKLIopAttrStr.addAttributes(TOWINKLIopCommonAttr, range: NSMakeRange(0, TOWINKLIopBaseStr.count))
        
        TOWINKLIopAttrStr.addAttribute(.link, value: "TOWINKLIop://user", range: TOWINKLIopRangeUser)
        TOWINKLIopAttrStr.addAttribute(.link, value: "TOWINKLIop://privacy", range: TOWINKLIopRangePrivacy)
        TOWINKLIopAttrStr.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: TOWINKLIopRangeUser)
        TOWINKLIopAttrStr.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: TOWINKLIopRangePrivacy)
        
        TOWINKLIopLegalText.attributedText = TOWINKLIopAttrStr
        TOWINKLIopLegalText.linkTextAttributes = [.foregroundColor: UIColor.white]
        TOWINKLIopLegalText.delegate = self
    }

    private func TOWINKLIopBindInteractions() {
        TOWINKLIopEulaTrigger.addTarget(self, action: #selector(TOWINKLIopHandleEula), for: .touchUpInside)
        TOWINKLIopConsentRadio.addTarget(self, action: #selector(TOWINKLIopToggleStatus), for: .touchUpInside)
        TOWINKLIopEntryAction.addTarget(self, action: #selector(TOWINKLIopProceedAuth), for: .touchUpInside)
    }

    @objc private func TOWINKLIopToggleStatus() {
        TOWINKLIopConsentRadio.isSelected.toggle()
    }

    @objc private func TOWINKLIopHandleEula() {
        self.navigationController?.pushViewController(TOWINKLIopVibePortal.init(TOWINKLIopEntryPath: TOWINKLIopVibeRoute.TOWINKLIoptesrml.TOWINKLIopConstructFinalPath(TOWINKLIopQuery: "")), animated: true)
    }

    @objc private func TOWINKLIopProceedAuth() {
        guard TOWINKLIopConsentRadio.isSelected else {
            TOWINKLIopTriggerShake(TOWINKLIopTarget: TOWINKLIopLegalText)
            return
        }
        
        self.navigationController?.pushViewController(TOWINKLIopAuthEntryController(), animated: true)
    }

//    private func TOWINKLIopRenderWebCore(TOWINKLIopPath: String) {
//        if let TOWINKLIopUrl = URL(string: TOWINKLIopPath) {
//            let TOWINKLIopSafariVC = SFSafariViewController(url: TOWINKLIopUrl)
//            present(TOWINKLIopSafariVC, animated: true)
//        }
//    }

    private func TOWINKLIopTriggerShake(TOWINKLIopTarget: UIView) {
        let TOWINKLIopAnim = CAKeyframeAnimation(keyPath: "transform.translation.x")
        TOWINKLIopAnim.timingFunction = CAMediaTimingFunction(name: .linear)
        TOWINKLIopAnim.duration = 0.6
        TOWINKLIopAnim.values = [-10.0, 10.0, -10.0, 10.0, -5.0, 5.0, 0.0]
        TOWINKLIopTarget.layer.add(TOWINKLIopAnim, forKey: "TOWINKLIop_Shake")
    }
}

extension TOWINKLIopPortalViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        if URL.absoluteString == "TOWINKLIop://user" {
            
            self.navigationController?.pushViewController(TOWINKLIopVibePortal.init(TOWINKLIopEntryPath: TOWINKLIopVibeRoute.TOWINKLIoptesrml.TOWINKLIopConstructFinalPath(TOWINKLIopQuery: "")), animated: true)
//            TOWINKLIopRenderWebCore(TOWINKLIopPath: "https://jolyu.com/terms")
        } else if URL.absoluteString == "TOWINKLIop://privacy" {
            self.navigationController?.pushViewController(TOWINKLIopVibePortal.init(TOWINKLIopEntryPath: TOWINKLIopVibeRoute.TOWINKLIoppri.TOWINKLIopConstructFinalPath(TOWINKLIopQuery: "")), animated: true)
//            TOWINKLIopRenderWebCore(TOWINKLIopPath: "https://jolyu.com/privacy")
        }
        return false
    }
}
