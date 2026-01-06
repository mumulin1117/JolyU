//
//  TOWINKLIopAuthEntryController.swift
//  Jolyukinle
//
//  Created by  on 2026/1/5.
//

import UIKit

class TOWINKLIopAuthEntryController: UIViewController {

    private let TOWINKLIopFestiveHeroView: UIImageView = {
        let TOWINKLIopImg = UIImageView()
        TOWINKLIopImg.image = UIImage(named: "TOWINKLIop_Login_Hero")
        TOWINKLIopImg.contentMode = .scaleAspectFill
        TOWINKLIopImg.clipsToBounds = true
        TOWINKLIopImg.translatesAutoresizingMaskIntoConstraints = false
        return TOWINKLIopImg
    }()

   
    private let TOWINKLIopHeaderTitle: UILabel = {
        let TOWINKLIopLabel = UILabel()
        TOWINKLIopLabel.text = "Log In"
        TOWINKLIopLabel.textColor = .white
        TOWINKLIopLabel.font = .systemFont(ofSize: 22, weight: .bold)
        TOWINKLIopLabel.translatesAutoresizingMaskIntoConstraints = false
        return TOWINKLIopLabel
    }()

    private let TOWINKLIopInputContainer: UIView = {
        let TOWINKLIopView = UIView()
        TOWINKLIopView.backgroundColor = .white
        TOWINKLIopView.layer.cornerRadius = 35
        TOWINKLIopView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        TOWINKLIopView.translatesAutoresizingMaskIntoConstraints = false
        return TOWINKLIopView
    }()

    private let TOWINKLIopMailCaption: UILabel = {
        let TOWINKLIopLabel = UILabel()
        TOWINKLIopLabel.text = "Email"
        TOWINKLIopLabel.textColor = .black
        TOWINKLIopLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        TOWINKLIopLabel.translatesAutoresizingMaskIntoConstraints = false
        return TOWINKLIopLabel
    }()

    private let TOWINKLIopMailField: UITextField = {
        let TOWINKLIopTf = UITextField()
        TOWINKLIopTf.placeholder = "Enter your email"
        TOWINKLIopTf.backgroundColor = UIColor(white: 0.97, alpha: 1.0)
        TOWINKLIopTf.layer.cornerRadius = 25
        TOWINKLIopTf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        TOWINKLIopTf.leftViewMode = .always
        TOWINKLIopTf.translatesAutoresizingMaskIntoConstraints = false
        return TOWINKLIopTf
    }()

    private let TOWINKLIopSecretCaption: UILabel = {
        let TOWINKLIopLabel = UILabel()
        TOWINKLIopLabel.text = "Password"
        TOWINKLIopLabel.textColor = .black
        TOWINKLIopLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        TOWINKLIopLabel.translatesAutoresizingMaskIntoConstraints = false
        return TOWINKLIopLabel
    }()

    private let TOWINKLIopSecretField: UITextField = {
        let TOWINKLIopTf = UITextField()
        TOWINKLIopTf.isSecureTextEntry = true
        TOWINKLIopTf.backgroundColor = UIColor(white: 0.97, alpha: 1.0)
        TOWINKLIopTf.layer.cornerRadius = 25
        TOWINKLIopTf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        TOWINKLIopTf.leftViewMode = .always
        TOWINKLIopTf.placeholder = "Enter password"
        
        let TOWINKLIopEye = UIButton(type: .custom)
        TOWINKLIopEye.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        TOWINKLIopEye.tintColor = .gray
        TOWINKLIopEye.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        TOWINKLIopTf.rightView = TOWINKLIopEye
        TOWINKLIopTf.rightViewMode = .always
        
        TOWINKLIopTf.translatesAutoresizingMaskIntoConstraints = false
        return TOWINKLIopTf
    }()

    private let TOWINKLIopConfirmAction: UIButton = {
        let TOWINKLIopBtn = UIButton(type: .system)
        TOWINKLIopBtn.setTitle("Confirm", for: .normal)
        TOWINKLIopBtn.setTitleColor(.white, for: .normal)
        TOWINKLIopBtn.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        TOWINKLIopBtn.layer.cornerRadius = 30
        TOWINKLIopBtn.clipsToBounds = true
        TOWINKLIopBtn.backgroundColor = UIColor(red: 0.56, green: 0.3, blue: 1, alpha: 1)
        TOWINKLIopBtn.translatesAutoresizingMaskIntoConstraints = false
        return TOWINKLIopBtn
    }()

    private let TOWINKLIopVisualGradient = CAGradientLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        TOWINKLIopAssembleLayout()
        TOWINKLIopSetupEvents()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        TOWINKLIopVisualGradient.frame = TOWINKLIopConfirmAction.bounds
        TOWINKLIopVisualGradient.colors = [UIColor.systemBlue.cgColor, UIColor.systemPurple.cgColor]
        TOWINKLIopVisualGradient.startPoint = CGPoint(x: 0, y: 0.5)
        TOWINKLIopVisualGradient.endPoint = CGPoint(x: 1, y: 0.5)
    }

    private func TOWINKLIopAssembleLayout() {
        view.backgroundColor = .black
        view.addSubview(TOWINKLIopFestiveHeroView)
       
        view.addSubview(TOWINKLIopHeaderTitle)
        view.addSubview(TOWINKLIopInputContainer)
        
        TOWINKLIopInputContainer.addSubview(TOWINKLIopMailCaption)
        TOWINKLIopInputContainer.addSubview(TOWINKLIopMailField)
        TOWINKLIopInputContainer.addSubview(TOWINKLIopSecretCaption)
        TOWINKLIopInputContainer.addSubview(TOWINKLIopSecretField)
        TOWINKLIopInputContainer.addSubview(TOWINKLIopConfirmAction)
        
        TOWINKLIopConfirmAction.layer.insertSublayer(TOWINKLIopVisualGradient, at: 0)

        NSLayoutConstraint.activate([
            TOWINKLIopFestiveHeroView.topAnchor.constraint(equalTo: view.topAnchor),
            TOWINKLIopFestiveHeroView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            TOWINKLIopFestiveHeroView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            TOWINKLIopFestiveHeroView.heightAnchor.constraint(equalToConstant: 425),

            
            TOWINKLIopHeaderTitle.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 16),
            TOWINKLIopHeaderTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            TOWINKLIopInputContainer.heightAnchor.constraint(equalToConstant: 451),
            TOWINKLIopInputContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            TOWINKLIopInputContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            TOWINKLIopInputContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            TOWINKLIopMailCaption.topAnchor.constraint(equalTo: TOWINKLIopInputContainer.topAnchor, constant: 40),
            TOWINKLIopMailCaption.leadingAnchor.constraint(equalTo: TOWINKLIopInputContainer.leadingAnchor, constant: 30),

            TOWINKLIopMailField.topAnchor.constraint(equalTo: TOWINKLIopMailCaption.bottomAnchor, constant: 15),
            TOWINKLIopMailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            TOWINKLIopMailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            TOWINKLIopMailField.heightAnchor.constraint(equalToConstant: 55),

            TOWINKLIopSecretCaption.topAnchor.constraint(equalTo: TOWINKLIopMailField.bottomAnchor, constant: 25),
            TOWINKLIopSecretCaption.leadingAnchor.constraint(equalTo: TOWINKLIopMailCaption.leadingAnchor),

            TOWINKLIopSecretField.topAnchor.constraint(equalTo: TOWINKLIopSecretCaption.bottomAnchor, constant: 15),
            TOWINKLIopSecretField.leadingAnchor.constraint(equalTo: TOWINKLIopMailField.leadingAnchor),
            TOWINKLIopSecretField.trailingAnchor.constraint(equalTo: TOWINKLIopMailField.trailingAnchor),
            TOWINKLIopSecretField.heightAnchor.constraint(equalToConstant: 55),

            TOWINKLIopConfirmAction.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            TOWINKLIopConfirmAction.leadingAnchor.constraint(equalTo: TOWINKLIopMailField.leadingAnchor),
            TOWINKLIopConfirmAction.trailingAnchor.constraint(equalTo: TOWINKLIopMailField.trailingAnchor),
            TOWINKLIopConfirmAction.heightAnchor.constraint(equalToConstant: 60)
        ])
    }

    private func TOWINKLIopSetupEvents() {
     
        TOWINKLIopConfirmAction.addTarget(self, action: #selector(TOWINKLIopExecuteVerification), for: .touchUpInside)
        
        if let TOWINKLIopEyeBtn = TOWINKLIopSecretField.rightView as? UIButton {
            TOWINKLIopEyeBtn.addTarget(self, action: #selector(TOWINKLIopToggleSecretVisibility), for: .touchUpInside)
        }
    }

    @objc private func TOWINKLIopBackRequest() {
        self.dismiss(animated: true)
    }

    @objc private func TOWINKLIopToggleSecretVisibility(_ sender: UIButton) {
        TOWINKLIopSecretField.isSecureTextEntry.toggle()
        let TOWINKLIopIcon = TOWINKLIopSecretField.isSecureTextEntry ? "eye.slash" : "eye"
        sender.setImage(UIImage(systemName: TOWINKLIopIcon), for: .normal)
    }

    @objc private func TOWINKLIopExecuteVerification() {
        guard let TOWINKLIopEmail = TOWINKLIopMailField.text, !TOWINKLIopEmail.isEmpty,
              let TOWINKLIopPass = TOWINKLIopSecretField.text, TOWINKLIopPass.count >= 6 else {
            TOWINKLIopFeedbackError(TOWINKLIopElement: TOWINKLIopInputContainer)
            return
        }

        let TOWINKLIopProcessingView = UIActivityIndicatorView(style: .large)
        TOWINKLIopProcessingView.center = view.center
        TOWINKLIopProcessingView.color = .systemBlue
        view.addSubview(TOWINKLIopProcessingView)
        TOWINKLIopProcessingView.startAnimating()
        TOWINKLIopConfirmAction.isEnabled = false

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            TOWINKLIopProcessingView.stopAnimating()
            TOWINKLIopProcessingView.removeFromSuperview()
            self.TOWINKLIopConfirmAction.isEnabled = true
            print("TOWINKLIop_Session_Established")
        }
    }

    private func TOWINKLIopFeedbackError(TOWINKLIopElement: UIView) {
        let TOWINKLIopShake = CAKeyframeAnimation(keyPath: "transform.translation.x")
        TOWINKLIopShake.values = [-7, 7, -7, 7, -3, 3, 0]
        TOWINKLIopShake.duration = 0.4
        TOWINKLIopElement.layer.add(TOWINKLIopShake, forKey: "TOWINKLIop_Error_Anim")
    }
}
