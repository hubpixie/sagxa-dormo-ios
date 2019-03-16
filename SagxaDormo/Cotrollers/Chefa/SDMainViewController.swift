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
    private let _disposeBag = DisposeBag()
    
    var viewModel: HogeViewModel!
    

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


