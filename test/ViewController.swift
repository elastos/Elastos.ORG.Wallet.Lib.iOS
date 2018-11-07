//
//  ViewController.swift
//  test
//
//  Created by mengxk on 2018/11/3.
//  Copyright © 2018 Elastos. All rights reserved.
//

import UIKit

import ElastosWalletKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    let mnemonic = ElastosWalletKit.GenerateMnemonic(language: "english", words: "")
    
    var seed = Data()
    let seedLen = ElastosWalletKit.GetSeedFromMnemonic(seed: &seed,
                                                       mnemonic: mnemonic!, language: "english", words: "",
                                                       mnemonicPassword: "")
    
    let privKey = ElastosWalletKit.GetSinglePrivateKey(seed: seed, seedLen: seedLen)
    
    let pubKey = ElastosWalletKit.GetSinglePublicKey(seed: seed, seedLen: seedLen)
    
    
    let a = 0
  }


}

