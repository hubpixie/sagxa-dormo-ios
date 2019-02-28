//
//  SDUsageItemsViewController.swift
//  SagxaDormo
//
//  Created by venus.janne on 2018/11/04.
//  Copyright © 2018 com.venuso-janne. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SDUsageItemsViewController: SDWebViewController {
    @IBOutlet weak var functionView: UIView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var antaûeButton: UIButton! {
        didSet {
            self.antaûeButton.rx.tap
            .subscribe(onNext: { [unowned self] in
                SDUserDefault.shared.currentLoadState = .login
                self.navigationController?.popToViewController(SDViewController.loginVC!, animated: false)
                
            })
            .disposed(by: self._disposeBag)
        }
    }
  
    private var _disposeBag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if  let scrollview: UIScrollView = self.contentView.getSubviewsOf(view: self.contentView).first(where: { (v) -> Bool in
            return v is UIScrollView
        }) as? UIScrollView {
            scrollview.delegate = self
        }
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

extension SDUsageItemsViewController: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView.isAtBottom {
            self.nextButton.isEnabled = true
        }
    }
}
