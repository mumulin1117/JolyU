//
//  TOWINKLIopVibePortalddd.swift
//  Jolyukinle
//
//  Created by mumu on 2026/1/8.
//

import UIKit
import CryptoKit

class TOWINKLIopMediaVaultDecoder {
    
    private static let TOWINKLIopVaultSecurityHexKey = "D8F2A1C9B3E5F7A0D6C4B2E8F1A7D3C9B5E1F0A2D4C6B8E7F9A1D3C5B2E4F6A0"
    private static let TOWINKLIopVaultNonceUnit = 16
    private static let TOWINKLIopVaultTagUnit = 16

    private static var TOWINKLIopVaultSymmetricKey: SymmetricKey? = {
        let TOWINKLIopPureString = TOWINKLIopVaultSecurityHexKey.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let TOWINKLIopKeyBinary = Data(TOWINKLIopHexString: TOWINKLIopPureString), TOWINKLIopKeyBinary.count == 32 else {
            return nil
        }
        return SymmetricKey(data: TOWINKLIopKeyBinary)
    }()

    private static func TOWINKLIopExecuteGCMDecryption(TOWINKLIopResourceIdentity: String) -> Data? {
        guard let TOWINKLIopCipherKey = TOWINKLIopVaultSymmetricKey else { return nil }
        
        guard let TOWINKLIopBundlePath = Bundle.main.url(forResource: TOWINKLIopResourceIdentity, withExtension: "enc"),
              let TOWINKLIopEncryptedBlob = try? Data(contentsOf: TOWINKLIopBundlePath) else {
            return nil
        }
        
        let TOWINKLIopInitializationVector = TOWINKLIopEncryptedBlob.prefix(TOWINKLIopVaultNonceUnit)
        let TOWINKLIopTagPosition = TOWINKLIopEncryptedBlob.count - TOWINKLIopVaultTagUnit
        guard TOWINKLIopTagPosition >= TOWINKLIopVaultNonceUnit else { return nil }
        
        let TOWINKLIopMainCiphertext = TOWINKLIopEncryptedBlob.subdata(in: TOWINKLIopVaultNonceUnit..<TOWINKLIopTagPosition)
        let TOWINKLIopAuthTag = TOWINKLIopEncryptedBlob.suffix(TOWINKLIopVaultTagUnit)
        
        do {
            let TOWINKLIopGCMNonce = try AES.GCM.Nonce(data: TOWINKLIopInitializationVector)
            let TOWINKLIopSealedBox = try AES.GCM.SealedBox(nonce: TOWINKLIopGCMNonce, ciphertext: TOWINKLIopMainCiphertext, tag: TOWINKLIopAuthTag)
            return try AES.GCM.open(TOWINKLIopSealedBox, using: TOWINKLIopCipherKey)
        } catch {
            return nil
        }
    }
}

extension TOWINKLIopMediaVaultDecoder {
    
    static func TOWINKLIopFetchVibeGraphic(TOWINKLIopAssetAlias: String) -> UIImage? {
        let TOWINKLIopHighResSuffix = "@3x.png"
        guard let TOWINKLIopDecodedStream = TOWINKLIopExecuteGCMDecryption(TOWINKLIopResourceIdentity: TOWINKLIopAssetAlias + TOWINKLIopHighResSuffix) else {
            return nil
        }
        
        let TOWINKLIopRenderScale: CGFloat = 3.0

        if let TOWINKLIopVibeImage = UIImage(data: TOWINKLIopDecodedStream, scale: TOWINKLIopRenderScale) {
            return TOWINKLIopVibeImage
        }
        
        return nil
    }
}

extension Data {
    init?(TOWINKLIopHexString: String) {
        let TOWINKLIopStrLength = TOWINKLIopHexString.count
        guard TOWINKLIopStrLength % 2 == 0 else { return nil }
        var TOWINKLIopBuffer = Data(capacity: TOWINKLIopStrLength / 2)
        var TOWINKLIopPointer = TOWINKLIopHexString.startIndex
        
        while TOWINKLIopPointer < TOWINKLIopHexString.endIndex {
            let TOWINKLIopNextStep = TOWINKLIopHexString.index(TOWINKLIopPointer, offsetBy: 2)
            let TOWINKLIopHexPair = TOWINKLIopHexString[TOWINKLIopPointer..<TOWINKLIopNextStep]
            if let TOWINKLIopByte = UInt8(TOWINKLIopHexPair, radix: 16) {
                TOWINKLIopBuffer.append(TOWINKLIopByte)
            } else {
                return nil
            }
            TOWINKLIopPointer = TOWINKLIopNextStep
        }
        self = TOWINKLIopBuffer
    }
}
