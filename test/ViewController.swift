//
//  ViewController.swift
//  test
//
//  Created by mengxk on 2018/11/3.
//  Copyright © 2018 Elastos. All rights reserved.
//

import UIKit

import ElastosSdkKeypair

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    var mnemonic = ElastosKeypair.GenerateMnemonic(language: "english", words: "")
    mnemonic = "hobby theme load okay village inhale garlic box cement draft patrol net"
    
    var seed = Data()
    let seedLen = ElastosKeypair.GetSeedFromMnemonic(seed: &seed,
                                                       mnemonic: mnemonic, language: "english", words: "",
                                                       mnemonicPassword: "")
    
    let seedStr = seed.hexEncodedString()
    
    
    let privKey = ElastosKeypair.GetSinglePrivateKey(seed: seed, seedLen: seedLen)!
    
    let pubKey = ElastosKeypair.GetSinglePublicKey(seed: seed, seedLen: seedLen)
    
    //let pubKeyVerify = ElastosKeypair.GetPublicKeyFromPrivateKey(privateKey: privKey)
    
    let address = ElastosKeypair.GetAddress(publicKey: pubKey)
    
    
    let txStr = "{\"Transactions\":[{\"Fee\":100,\"UTXOInputs\":[{\"index\":1,\"txid\":\"0bed4adf9be2a503d7f077db31a42b2d740db73d75fc3813166e6e5be304ca13\",\"privateKey\":\"1fc3ebc259dd12d444184da98e8447943926d026526fd8dd5d558a9353fd3bbc\",\"address\":\"EbAATdrW7gaomFY3SAy81rokqwqKA3EXbT\"}],\"Outputs\":[{\"amount\":10000,\"address\":\"EMHc9JSpxKWbTMf8gQDcWm7Tz1C5nQNA8Z\"},{\"amount\":48735988890,\"address\":\"EbAATdrW7gaomFY3SAy81rokqwqKA3EXbT\"}]}]}"
    
    let signedData = ElastosKeypair.GenerateRawTransaction(transaction: txStr)
    
    //ElastosKeypair.GetSignedSigners(transaction: <#T##String#>, outLen: &<#T##Int32#>)
    
    let originText = "Hello World!!!"
    let cipherText = ElastosKeypair.EciesEncrypt(publicKey: pubKey!, plainText: originText)
    let plainText = ElastosKeypair.EciesDecrypt(privateKey: privKey, cipherText: cipherText!)
    assert(originText == plainText)
    
    let a = 0
  }


}

extension Data {
  func hexEncodedString() -> String {
    return map { String(format: "%02hhX", $0) }.joined()
  }
}
