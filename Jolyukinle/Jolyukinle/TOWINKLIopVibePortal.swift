//
//  TOWINKLIopVibePortal.swift
//  Jolyukinle
//
//  Created by mumu on 2026/1/7.
//

import UIKit
import WebKit
import StoreKit

class TOWINKLIopVibePortal: UIViewController, WKScriptMessageHandler, WKNavigationDelegate, WKUIDelegate, SKPaymentTransactionObserver, SKProductsRequestDelegate {
    
    var TOWINKLIopIsModalTransition: Bool = false
    private var TOWINKLIopActivePurchaseId: String?
    
 
    
    private lazy var TOWINKLIopLoadingOrb: UIActivityIndicatorView = {
        let TOWINKLIopIndicator = UIActivityIndicatorView.init(style: .large)
        TOWINKLIopIndicator.frame.size = CGSize.init(width: 54, height: 54)
        TOWINKLIopIndicator.tintColor = .black
        TOWINKLIopIndicator.hidesWhenStopped = true
        TOWINKLIopIndicator.color = .black
        return TOWINKLIopIndicator
    }()
    
    private var TOWINKLIopManifestPath: String
    
    init(TOWINKLIopEntryPath: String) {
        self.TOWINKLIopManifestPath = TOWINKLIopEntryPath
        super.init(nibName: nil, bundle: nil)
        SKPaymentQueue.default().add(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    deinit {
        SKPaymentQueue.default().remove(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let TOWINKLIopWallpaper = UIImageView(frame: UIScreen.main.bounds)
        TOWINKLIopWallpaper.contentMode = .scaleAspectFill
        TOWINKLIopWallpaper.image = TOWINKLIopMediaVaultDecoder.TOWINKLIopFetchVibeGraphic(TOWINKLIopAssetAlias: "TOWINKLIopbg")
        self.view.addSubview(TOWINKLIopWallpaper)
        
        self.view.backgroundColor = .black
        self.view.addSubview(self.TOWINKLIopMainStage)
        TOWINKLIopMainStage.navigationDelegate = self
        
        TOWINKLIopMainStage.scrollView.contentInsetAdjustmentBehavior = .never
        if let TOWINKLIopFinalUrl = URL(string: TOWINKLIopManifestPath) {
            let TOWINKLIopActionRequest = URLRequest(url: TOWINKLIopFinalUrl)
            TOWINKLIopMainStage.load(TOWINKLIopActionRequest)
        }
        self.TOWINKLIopLoadingOrb.center = self.view.center
        self.view.addSubview(self.TOWINKLIopLoadingOrb)
        self.TOWINKLIopLoadingOrb.startAnimating()
    }
    
    private let TOWINKLIopEventNodes: [String] = ["towInkLIopElegantDine", "towInkLIopSparklingCider", "towInkLIopCountryCharm", "towInkLIopEleClose", "towInkLIopRoastedCocoa","towInkLIopTwinklingPathway"]
    
    func TOWINKLIopConfigureStage() -> WKWebViewConfiguration {
        let TOWINKLIopConfig = WKWebViewConfiguration()
        TOWINKLIopConfig.mediaTypesRequiringUserActionForPlayback = []
        TOWINKLIopConfig.allowsInlineMediaPlayback = true
        TOWINKLIopConfig.preferences.javaScriptCanOpenWindowsAutomatically = true
        TOWINKLIopEventNodes.forEach { TOWINKLIopNode in
            TOWINKLIopConfig.userContentController.add(self, name: TOWINKLIopNode)
        }
        return TOWINKLIopConfig
    }
    
    private lazy var TOWINKLIopMainStage: WKWebView = {
        let TOWINKLIopWeb = WKWebView(frame: UIScreen.main.bounds, configuration: self.TOWINKLIopConfigureStage())
        TOWINKLIopWeb.scrollView.showsVerticalScrollIndicator = false
        TOWINKLIopWeb.uiDelegate = self
        TOWINKLIopWeb.backgroundColor = .clear
        TOWINKLIopWeb.isHidden = true
        return TOWINKLIopWeb
    }()
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            webView.isHidden = false
            self.TOWINKLIopLoadingOrb.stopAnimating()
        }
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        switch message.name {
        case "towInkLIopElegantDine":
            guard let TOWINKLIopProductSecret = message.body as? String else { return }
            self.TOWINKLIopInitiateVaultAction(TOWINKLIopProductSecret)
        case "towInkLIopCountryCharm":
            if let TOWINKLIopDeepPath = message.body as? String {
                let TOWINKLIopNextPortal = TOWINKLIopVibePortal(TOWINKLIopEntryPath: TOWINKLIopDeepPath)
                self.navigationController?.pushViewController(TOWINKLIopNextPortal, animated: true)
            }
        case "towInkLIopEleClose":
            if self.TOWINKLIopIsModalTransition {
                self.dismiss(animated: true)
            } else {
                self.navigationController?.popViewController(animated: true)
            }
        case "towInkLIopRoastedCocoa":
            if self.TOWINKLIopIsModalTransition {
                self.dismiss(animated: true)
            } else {
                self.navigationController?.popViewController(animated: true)
            }
        case "towInkLIopTwinklingPathway":
            TOWINKLIopVibeRoute.TOWINKLIopSessionToken = nil
            UserDefaults.standard.set(nil, forKey: "wigCreator")
            UserDefaults.standard.set(nil, forKey: "wigPioneer")
            ((UIApplication.shared.delegate) as? AppDelegate)?.window?.rootViewController = TOWINKLIopAuthEntryController()
        default: break
        }
    }
    
    private func TOWINKLIopInitiateVaultAction(_ TOWINKLIopId: String) {
        self.view.isUserInteractionEnabled = false
        self.TOWINKLIopLoadingOrb.startAnimating()
        self.TOWINKLIopActivePurchaseId = TOWINKLIopId
        
        let TOWINKLIopSet = Set([TOWINKLIopId])
        let TOWINKLIopRequest = SKProductsRequest(productIdentifiers: TOWINKLIopSet)
        TOWINKLIopRequest.delegate = self
        TOWINKLIopRequest.start()
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        if let TOWINKLIopValidItem = response.products.first {
            let TOWINKLIopBill = SKPayment(product: TOWINKLIopValidItem)
            SKPaymentQueue.default().add(TOWINKLIopBill)
        } else {
            TOWINKLIopUpdateUINotification("TOWINKLIop_Invalid_Item", TOWINKLIopIsError: true)
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for TOWINKLIopTask in transactions {
            switch TOWINKLIopTask.transactionState {
            case .purchased:
                SKPaymentQueue.default().finishTransaction(TOWINKLIopTask)
                TOWINKLIopExecuteSuccessLogic()
            case .failed:
                SKPaymentQueue.default().finishTransaction(TOWINKLIopTask)
                TOWINKLIopUpdateUINotification(TOWINKLIopTask.error?.localizedDescription ?? "Error", TOWINKLIopIsError: true)
            case .restored:
                SKPaymentQueue.default().finishTransaction(TOWINKLIopTask)
            default: break
            }
        }
    }
    
    private func TOWINKLIopExecuteSuccessLogic() {
        self.TOWINKLIopMainStage.evaluateJavaScript("towInkLIopSparklingCider()", completionHandler: nil)
        TOWINKLIopUpdateUINotification("Pay successful!", TOWINKLIopIsError: false)
    }
    
    private func TOWINKLIopUpdateUINotification(_ TOWINKLIopMsg: String, TOWINKLIopIsError: Bool) {
        self.view.isUserInteractionEnabled = true
        self.TOWINKLIopLoadingOrb.stopAnimating()
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
        }
    }

    
}



enum TOWINKLIopVibeRoute: String {

    case TOWINKLIopSparkAI = "pages/EditProfile/index?"
    case TOWINKLIopVibeVault = "pages/CreateRoom/index?"
    case TOWINKLIopAromaDetail = "pages/JoinLiveRoom/index?channel=&userId="
    case TOWINKLIopMomentDetail = "pages/virtualChatRoom/index?liveId="
   
    case TOWINKLIopPostArticle = "pages/AIRobot/index?"
    case TOWINKLIopPostVisual = "pages/DetailsMesses/index?userId="
    case TOWINKLIopUserCore = "pages/Notice/index?"
    case TOWINKLIopReportNode = "pages/homepage/index?userId="
    case TOWINKLIopAuthVerify = " pages/DynamicDetails/index?dynamicId="
    case TOWINKLIopProfileModify = "pages/issue/index?"
    
    case TOWINKLIopFollowGroup = "pages/postVideos/index?"
    case TOWINKLIopFanGroup = "pages/VideoDetails/index?dynamicId="
    case TOWINKLIopBalanceVault = "pages/Setting/index?"
    case TOWINKLIopMasterConfig = "pages/Following/index?"
    case TOWINKLIopLegalTerms = "pages/fansList/index?"
    case TOWINKLIopPrivacyPolicy = "pages/report/index?"
    case TOWINKLIopDirectWhisper = "pages/MyWallet/index?"
    case TOWINKLIoptesrml = "pages/agreement/index?type=1"
    case TOWINKLIoppri = "pages/agreement/index?type=2"
    case TOWINKLIopgift  = "pages/receivedGift/index?userId="
    case TOWINKLIopVoidChannel = ""
    
    
    static var TOWINKLIopSessionToken: String? {
        get {
            return UserDefaults.standard.object(forKey: "TOWINKLIop_UserKey") as? String
        } set {
            UserDefaults.standard.set(newValue, forKey: "TOWINKLIop_UserKey")
        }
    }
    func TOWINKLIopConstructFinalPath(TOWINKLIopQuery: String) -> String {
        let TOWINKLIopBaseGateway = "https://k2j8m6n4l1h3g5.shop/#"
        
        if self != .TOWINKLIopVoidChannel {
            let TOWINKLIopAuthToken = TOWINKLIopVibeRoute.TOWINKLIopSessionToken ?? ""
            let TOWINKLIopUniqueAppId = "54894011"
            
            let TOWINKLIopMergedPath = String(
                format: "%@%@%@&token=%@&appID=%@",
                TOWINKLIopBaseGateway,
                self.rawValue,
                TOWINKLIopQuery,
                TOWINKLIopAuthToken,
                TOWINKLIopUniqueAppId
            )
            
            return TOWINKLIopMergedPath
        }
        
        return TOWINKLIopBaseGateway
    }
    
    static func TOWINKLIopTransmitSignal(
        TOWINKLIopEndpoint: String,
        TOWINKLIopPayload: [String: Any],
        TOWINKLIopOnSuccess: ((Any?) -> Void)?,
        TOWINKLIopOnFailure: ((Error) -> Void)?
    ) {
        guard let TOWINKLIopTargetUrl = URL(string: "https://k2j8m6n4l1h3g5.shop/backfour" + TOWINKLIopEndpoint) else { return }
        
        var TOWINKLIopCoreRequest = TOWINKLIopForgeRequest(TOWINKLIopTarget: TOWINKLIopTargetUrl, TOWINKLIopData: TOWINKLIopPayload)
        let TOWINKLIopHeaders = ["key": "54894011", "token": TOWINKLIopVibeRoute.TOWINKLIopSessionToken ?? ""]
        TOWINKLIopHeaders.forEach { TOWINKLIopCoreRequest.setValue($1, forHTTPHeaderField: $0) }
        
        let TOWINKLIopNetworkSession = URLSessionConfiguration.default
        TOWINKLIopNetworkSession.timeoutIntervalForRequest = 30
        
        URLSession(configuration: TOWINKLIopNetworkSession).dataTask(with: TOWINKLIopCoreRequest) { TOWINKLIopRawData, _, TOWINKLIopError in
            DispatchQueue.main.async {
                if let TOWINKLIopErr = TOWINKLIopError {
                    TOWINKLIopOnFailure?(TOWINKLIopErr)
                    return
                }
                guard let TOWINKLIopData = TOWINKLIopRawData else { return }
                do {
                    let TOWINKLIopJson = try JSONSerialization.jsonObject(with: TOWINKLIopData, options: .allowFragments)
                    print(TOWINKLIopJson)
                    TOWINKLIopOnSuccess?(TOWINKLIopJson)
                } catch {
                    TOWINKLIopOnFailure?(error)
                }
            }
        }.resume()
    }
    
    private static func TOWINKLIopForgeRequest(TOWINKLIopTarget: URL, TOWINKLIopData: [String: Any]) -> URLRequest {
        var TOWINKLIopRequest = URLRequest(url: TOWINKLIopTarget, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
        TOWINKLIopRequest.httpMethod = "POST"
        TOWINKLIopRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        TOWINKLIopRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        TOWINKLIopRequest.httpBody = try? JSONSerialization.data(withJSONObject: TOWINKLIopData)
        return TOWINKLIopRequest
    }
}
