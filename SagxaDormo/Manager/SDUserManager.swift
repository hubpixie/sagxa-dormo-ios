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
    
    
    func startLoginVC(sender: SDViewController) {
        if let vc: UINavigationController = R.storyboard.login().instantiateInitialViewController() as? UINavigationController {
            vc.navigationBar.isHidden = true
            sender.present(vc, animated: true, completion: nil)
        }
        
    }
}
