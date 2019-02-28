//
//  SDSanoTelefonoViewController.swift
//  SagxaDormo
//
//  Created by venus.janne on 2019/02/17.
//  Copyright © 2019 com.venuso-janne. All rights reserved.
//

import UIKit
import WebKit
import RxSwift
import RxCocoa

class SDSanoTelefonoViewController: SDViewController {
    @IBOutlet weak var rightBarButtonItem: UIBarButtonItem! {
        didSet {
            self.rightBarButtonItem.rx.tap
                .subscribe(onNext: { [unowned self] in
                    self.navigationController?.popViewController(animated: true)
                })
                .disposed(by: self._disposeBag)
        }
    }
    @IBOutlet weak var fonoButton: UIButton!
    @IBOutlet weak var fonoEnhavoView: UIView!
    @IBOutlet weak var fonoTempoView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var heightfonoEnhavoViewLC: NSLayoutConstraint!
    @IBOutlet weak var heightfonoTempoViewLC: NSLayoutConstraint!

    private var _fonoEnhavoWebView: WKWebView!
    private var _fonoTempoWebView: WKWebView!
    private let _disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.fonoButton.isHidden = true
        self.setupFonoEnhavoWebView()
        self.setupFonoTempoWebView()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    private func setupFonoEnhavoWebView() {
        self._fonoEnhavoWebView = WKWebView(frame: CGRect(x: 8, y: 0, width: self.fonoEnhavoView.frame.width, height: self.fonoEnhavoView.frame.height))
        self.fonoEnhavoView.addSubview(self._fonoEnhavoWebView)
        self.fonoEnhavoView.adjustViewLayout(itemView: self._fonoEnhavoWebView)
        
        self._fonoEnhavoWebView.navigationDelegate = self
        self._fonoEnhavoWebView.scrollView.isScrollEnabled = false
        
        let htmlFilePath : String! = Bundle.main.path(forResource: "web1", ofType: "html")?.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
        if let htmlString = try? String(contentsOfFile: htmlFilePath!) {
            self._fonoEnhavoWebView.loadHTMLString(htmlString, baseURL: Bundle.main.bundleURL)
        }
    }
    
    private func setupFonoTempoWebView() {
        self._fonoTempoWebView = WKWebView(frame: CGRect(x: 8, y: 0, width: self.fonoEnhavoView.frame.width, height: self.fonoTempoView.frame.height))
        self.fonoTempoView.addSubview(self._fonoTempoWebView)
        self.fonoTempoView.adjustViewLayout(itemView: self._fonoTempoWebView)
        
        self._fonoTempoWebView.navigationDelegate = self
        self._fonoTempoWebView.scrollView.isScrollEnabled = false
        
        let htmlFilePath : String! = Bundle.main.path(forResource: "web2", ofType: "html")?.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
        if let htmlString = try? String(contentsOfFile: htmlFilePath!) {
            self._fonoTempoWebView.loadHTMLString(htmlString, baseURL: Bundle.main.bundleURL)
        }
    }
}

extension SDSanoTelefonoViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if webView === self._fonoEnhavoWebView {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {[weak self] () in
                guard let weakSelf = self else {return}
                weakSelf.heightfonoEnhavoViewLC.constant = webView.scrollView.contentSize.height
                
                weakSelf.scrollView.contentSize.height = weakSelf.heightfonoEnhavoViewLC.constant + weakSelf.heightfonoTempoViewLC.constant + 40
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                    weakSelf.fonoButton.isHidden = false
                })
            }
        }
        if webView === self._fonoTempoWebView {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {[weak self] () in
                guard let weakSelf = self else {return}
                weakSelf.heightfonoTempoViewLC.constant = webView.scrollView.contentSize.height

                weakSelf.scrollView.contentSize.height = weakSelf.heightfonoEnhavoViewLC.constant + weakSelf.heightfonoTempoViewLC.constant + 40
            }
        }
    }
}
