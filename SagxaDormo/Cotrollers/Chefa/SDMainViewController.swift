//
//  ViewController.swift
//  SaĝaDormo
//
//  Created by venus.janne on 2018/10/08.
//  Copyright © 2018 com.venuso-janne. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SDMainViewController: SDViewController {
    @IBOutlet weak var openHistorioButton: UIButton! {
        didSet {
            self.openHistorioButton.rx.tap
                .subscribe(onNext: { _ in
                    DispatchQueue.main.async {
                        if let vc: SDHistorioViewController = R.storyboard.history.historioVC() {
                            UIApplication.shared.keyWindow?.addSubview(vc.view)
                            UIApplication.shared.keyWindow?.rootViewController?.addChild(vc)
                            //self.present(vc, animated: false, completion: nil)
                        }
                    }
                })
                .disposed(by: self._disposeBag)
            
        }
    }
    
    var viewModel: HogeViewModel!
    private let _disposeBag = DisposeBag()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        SDViewController.mainVC = self
        SDUserDefault.shared.currentLoadState = .main
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
    }
}
/*
 
 viewModel = HogeViewModel()
 
 viewModel.helloWorldSubject
 .subscribe(onNext: { [weak self] value in
 print("value = \(value)")
 })
 .disposed(by: disposeBag)
 
 viewModel.updateItem()
 */


