//
//  SDHistorioViewController.swift
//  SagxaDormo
//
//  Created by venus.janne on 2018/11/04.
//  Copyright © 2018 com.venuso-janne. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SDHistorioViewController: UIViewController {

    @IBOutlet weak var close1Button: UIButton! {
        didSet {
            self.close1Button.rx.tap
                .subscribe(onNext: { [unowned self] _ in
                    print("close1Button - tap")
                    DispatchQueue.main.async {
                        self.view.removeFromSuperview()
                        self.removeFromParent()
                        //self.dismiss(animated: false, completion: nil)
                    }
                })
                .disposed(by: self._disposeBag)
            
        }
    }
    @IBOutlet weak var close2Button: UIButton! {
        didSet {
            self.close2Button.rx.tap
                .subscribe(onNext: { [unowned self] in
                    DispatchQueue.main.async {
                        //UIApplication.shared.keyWindow?.rootViewController?.view.addSubview(self.view)
                        //UIApplication.shared.keyWindow?.rootViewController?.addChild(self)
                        self.view.removeFromSuperview()
                        self.removeFromParent()
                    }
                })
                .disposed(by: self._disposeBag)
            
        }
    }

    private var _disposeBag: DisposeBag = DisposeBag()

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

}
