//
//  SDSplashScreenViewController.swift
//  SagxaDormo
//
//  Created by venus.janne on 2018/11/12.
//  Copyright © 2018 com.venuso-janne. All rights reserved.
//

import UIKit

class SDSplashScreenViewController: SDViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        SDViewController.splashVC = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if SDUserDefault.shared.currentLoadState == .main {
           ( self.view.subviews[0] as! UIImageView).isHidden = true
            if SDViewController.mainVC == nil {
                self.performSegue(withIdentifier: R.segue.sdSplashScreenViewController.homeSegue.identifier, sender: self)
            }
        } else {
            SDUserManager.shared.startLoginVC(sender: self)
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue is SDPresentSegue, let mySegue: SDPresentSegue = segue as? SDPresentSegue {
            mySegue.extraHandler = {[weak self]() in
                self?.present(segue.destination, animated: true, completion: nil)
            }
//            mySegue.presentWithBlock() {[weak self]() in
//                self?.present(segue.destination, animated: true, completion: nil)
//            }
        }
        super.prepare(for: segue, sender: sender)
    }
    


}
