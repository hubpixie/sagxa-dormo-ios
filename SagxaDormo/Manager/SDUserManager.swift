//
//  SDUserManager.swift
//  SagxaDormo
//
//  Created by venus.janne on 2019/02/15.
//  Copyright © 2019 com.venuso-janne. All rights reserved.
//

import UIKit

class SDUserManager {
    static let shared: SDUserManager = SDUserManager()
    /* 画面起動の状態 */
    enum LoadState: Int {
        case login
        case usageItems
        case selectSensor
        case main
        case dummy
    }
    
    /* ログイン手段のプロバイダ */
    enum LoginProvider {
        case email
        case facebook
        case google
        case twitter
        case none
    }

    
    func startLoginVC(sender: SDViewController) {
        if let vc: UINavigationController = R.storyboard.login().instantiateInitialViewController() as? UINavigationController {
            vc.navigationBar.isHidden = true
            sender.present(vc, animated: true, completion: nil)
        }
        
    }
}
