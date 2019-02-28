//
//  SDPreferojViewController.swift
//  SagxaDormo
//
//  Created by venus.janne on 2019/02/16.
//  Copyright © 2019 com.venuso-janne. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SDPreferojViewController: SDViewController {

    @IBOutlet private weak var logoutButton: UIButton! {
        didSet {
            self.logoutButton.rx.tap
                .subscribe(onNext: { [unowned self] in
                    SDUserDefault.shared.currentLoadState = .login
                    self.navigationController?.dismiss(animated: true, completion: nil)
                    SDUserManager.shared.startLoginVC(sender: SDViewController.mainVC!)
                })
                .disposed(by: self._disposeBag)
            
        }
    }
    private let _disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    // Manage self view
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        guard let touch:UITouch = touches.first else
        {
            return;
        }
        if touch.view == self.view
        {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
