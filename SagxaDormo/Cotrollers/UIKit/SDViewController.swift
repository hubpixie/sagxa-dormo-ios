//
//  SDViewController.swift
//  SaĝaDormo
//
//  Created by venus.janne on 2018/07/03.
//  Copyright © 2018年 venus.janne. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

@objc protocol SDKeyboardDelegate {
    @objc optional func keyboardShow(keyboardFrame: CGRect)
    @objc optional func keyboardHide(keyboardFrame: CGRect)
}

class SDViewController: UIViewController {

    //カレント認証プロバイダー
    static var currentLoginProvider: SDUserManager.LoginProvider = .none
    
    static weak var splashVC: SDSplashScreenViewController?
    static weak var mainVC: SDMainViewController?
    static weak var loginVC: SDLoginViewController?

    var navigationBarBottomMargin: CGFloat  {
        var bottomMargin : CGFloat = 0
        if #available(iOS 11, *) {
            bottomMargin = (UIApplication.shared.keyWindow?.safeAreaInsets.bottom)!
        }
        return bottomMargin
    }
    var seguePrepared: Bool = false
    // 長時間処理インジケータのインスタンス
    var myIndicator: UIActivityIndicatorView!

    weak var keyboardDelegate: SDKeyboardDelegate?
    weak var sourceViewController: SDViewController?
    static var mainViewController: SDViewController?
    static var inquireViewController: SDViewController?

    private let _disposeBag = DisposeBag()
    
    static var appDelegate: AppDelegate?  {
        get {return UIApplication.shared.delegate as? AppDelegate}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Hide the navigation bar on the this view controller
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if self.keyboardDelegate != nil {
            NotificationCenter.default.rx.notification(UIResponder.keyboardWillShowNotification, object: nil)
                .subscribe({ notification in
                    if let element = notification.element {
                        self.keyboardWillShow(element)
                    }
                })
                .disposed(by: self._disposeBag)
            
            NotificationCenter.default.rx.notification(UIResponder.keyboardWillHideNotification, object: nil)
                .subscribe({ notification in
                    if let element = notification.element {
                        self.keyboardWillHide(element)
                    }
                })
                .disposed(by: self._disposeBag)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    /*
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the navigation bar on other view controllers
        //self.navigationController?.setNavigationBarHidden(!self.isNavigationBarHidden, animated: false)
    }
     */
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //clear navigation title
    //
    func clearNavigationItemTitle() {
        self.navigationItem.title = ""
    }
    
    //reset navigation title
    //
    func resetNavigationItemTitle() {
        self.navigationItem.title = "SaĝaDormo"
    }

    @objc func keyboardWillShow(_ notification: Notification) {
        
        let info = notification.userInfo!
        
        let keyboardFrame = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        if let delegate = self.keyboardDelegate {
            delegate.keyboardShow!(keyboardFrame: keyboardFrame)
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        let info = notification.userInfo!
        
        let keyboardFrame = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        if let delegate = self.keyboardDelegate {
            delegate.keyboardHide!(keyboardFrame: keyboardFrame)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    //mark: loadCheck For SaĝaDormo
    class func loadCheckForSD(checkHandler: ((_ loadState: SDUserManager.LoadState, _ error: Error?)->())?) -> Void{
        return
    }
    
    // MARK: check PasscodeSetting
    // 未設定の場合、パスコード入力画面を開く
    func checkPasscodeSetting(checkedHandler: (()->())?) {
    }
    
    // 指定の画面へ遷移する
    //
    func moveNextViewController(vcIdentifier: String) -> UIViewController {
        let storyboard: UIStoryboard = R.storyboard.main()
        let vc = storyboard.instantiateViewController(withIdentifier: vcIdentifier)
        self.navigationController?.show(vc, sender: self)
        
        return vc
    }
}
