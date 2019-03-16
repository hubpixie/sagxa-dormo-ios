//
//  SDProfiloRedaktiloViewController.swift
//  SagxaDormo
//
//  Created by venus.janne on 2018/11/04.
//  Copyright © 2018 com.venuso-janne. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SDProfiloRedaktiloViewController: SDViewController {

    @IBOutlet private weak var messageLabel: UILabel!
    @IBOutlet private weak var nicknameTextField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwdTextField: UITextField!
    @IBOutlet private weak var zipcodeTextField: UITextField! {
        didSet {
            self.addDoneButtonOnKeyboard(textField: self.zipcodeTextField)
        }
    }

    @IBOutlet private weak var registerButton: UIButton! {
        didSet {
            self.registerButton.rx.tap.bind {
                self.registerButtonTap()
            }.disposed(by: self._disposeBag)
            
        }
    }
    @IBOutlet private weak var homeButton: UIButton! {
        didSet {
            self.homeButton.rx.tap
                .subscribe(onNext: { [unowned self] in
                    SDUserDefault.shared.currentLoadState = .main
                    self.navigationController?.dismiss(animated: true, completion: nil)
                    SDViewController.splashVC?.performSegue(withIdentifier: R.segue.sdSplashScreenViewController.homeSegue.identifier, sender: self)
                })
                .disposed(by: self._disposeBag)

        }
    }
    private let _fooViewModel = FooViewModel()
    private let _disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        self.myIndicator = UIActivityIndicatorView.setupIndicator(parentView: self.view)
//        self.myIndicator.adjustToPosition(frame: self.registerButton.frame)
//        self.myIndicator.startAnimatingEx(sender: nil)
        fetchAndShowDataToView()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    private func fetchAndShowDataToView() {
        self._fooViewModel.doGetUser { [unowned self] (status, user) in
            self.nicknameTextField.text = ""
            self.emailTextField.text = ""
            self.passwdTextField.text = ""
            if status == 0 {
                if let user = user {
                    self.nicknameTextField.text = user.nickname
                    self.emailTextField.text = user.email
                    self.passwdTextField.text = user.password
                    
                    self.registerButton.setTitle(R.string.localeMisc.profiloRedaktiloRegisterButtonUpdateTitle(), for: .normal)
                } else {
                    self.registerButton.setTitle(R.string.localeMisc.profiloRedaktiloRegisterButtonAddTitle(), for: .normal)
                }
            }
        }
    }
    
    private func registerButtonTap () {
        if let title = self.registerButton.title(for: .normal), title == R.string.localeMisc.profiloRedaktiloRegisterButtonUpdateTitle() {
            let param: UserParam = UserParam(nickname: self.nicknameTextField.text, email: self.emailTextField.text)
            self._fooViewModel.doUpdateUser(param: param) { [unowned self] (successFlg) in
                if successFlg {
                    self.messageLabel.text = R.string.localeMisc.profiloRedaktiloRegisterButtonUpdateSuccessMessage()
                } else {
                    self.messageLabel.text = R.string.localeMisc.profiloRedaktiloRegisterButtonUpdateFailMessage(-111)
                }
            }
        } else {
            let param: User = User(nickname: self.nicknameTextField.text!, email: self.emailTextField.text, password: self.passwdTextField.text)
            self._fooViewModel.doRegisterUser(param: param) { [unowned self] (successFlg) in
                if successFlg {
                    self.messageLabel.text = R.string.localeMisc.profiloRedaktiloRegisterButtonAddSuccessMessage()
                } else {
                    self.messageLabel.text = R.string.localeMisc.profiloRedaktiloRegisterButtonAddFailMessage(-222)
                }
            }

        }
    }
}


extension SDProfiloRedaktiloViewController {
    func addDoneButtonOnKeyboard(textField: UITextField)
    {
        let doneToolbar: UIToolbar = UIToolbar()
       // doneToolbar.barStyle = .default
        
        let flexSpaceItem: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.doneButtonAction))
        doneItem.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12.0)], for: .normal)
        let fixedSpaceItem: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: self, action: nil)

        let items = [flexSpaceItem, doneItem, fixedSpaceItem]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        textField.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction()
    {
        self.zipcodeTextField.resignFirstResponder()
    }
}

