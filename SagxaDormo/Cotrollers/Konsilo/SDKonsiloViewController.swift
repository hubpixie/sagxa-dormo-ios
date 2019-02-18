//
//  SDKonsiloViewController.swift
//  SagxaDormo
//
//  Created by venus.janne on 2018/11/04.
//  Copyright © 2018 com.venuso-janne. All rights reserved.
//

import UIKit
import WebKit

class SDKonsiloViewController: UIViewController {

    private enum KonsiloCellIdentifier: Int {
        case konsiloInfoCell = 0
        
        static var allValues: [String] = ["konsiloInfoCell"]
        static var allNibs: [UINib] = [KonsiloInfoCell.nib]
    }
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            for i in 0 ..< KonsiloCellIdentifier.allValues.count {
                self.collectionView.register(KonsiloCellIdentifier.allNibs[i], forCellWithReuseIdentifier: KonsiloCellIdentifier.allValues[i])
            }
            self.collectionView.dataSource = self
            self.collectionView.delegate = self
        }
    }
    
    private var _konsiloWebView: WKWebView!
    private var _konsiloCell: KonsiloInfoCell!

    
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

// MARK: - UICollectionViewDataSource

extension SDKonsiloViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return KonsiloCellIdentifier.allValues.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell?
        if indexPath.section == KonsiloCellIdentifier.konsiloInfoCell.rawValue {
            let cell_: KonsiloInfoCell = collectionView.dequeueReusableCell(withReuseIdentifier: KonsiloCellIdentifier.allValues[indexPath.section], for: indexPath) as! KonsiloInfoCell
            self._konsiloCell = cell_
            self.setupKonsiloWebView(contentView: cell_.konsiloHtmlContentView)
            cell_.delegate = self
            
            cell = cell_
        }
        
        return cell!
    }
    
    
}

// MARK: - UICollectionViewDelegate

extension SDKonsiloViewController: UICollectionViewDelegate {
    
}

// MARK: - KonsiloInfoCellDelegate

extension SDKonsiloViewController: KonsiloInfoCellDelegate {
    func fonoWebViewDidShow(cell: KonsiloInfoCell) {
        self.performSegue(withIdentifier: R.segue.sdKonsiloViewController.sanoTelefonoSegue.identifier, sender: cell)
    }
}

extension SDKonsiloViewController: WKNavigationDelegate {
    private func setupKonsiloWebView(contentView: UIView) {
        self._konsiloWebView = WKWebView(frame: CGRect(x: 8, y: 0, width: contentView.frame.width, height: contentView.frame.height))
        contentView.addSubview(self._konsiloWebView)
        contentView.adjustViewLayout(itemView: self._konsiloWebView)
        
        self._konsiloWebView.navigationDelegate = self
        self._konsiloWebView.scrollView.isScrollEnabled = false
        
        let htmlFilePath : String! = Bundle.main.path(forResource: R.file.konsiloHtml.name, ofType: R.file.konsiloHtml.pathExtension)?.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
        if let htmlString = try? String(contentsOfFile: htmlFilePath!) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self._konsiloWebView.loadHTMLString(htmlString, baseURL: Bundle.main.bundleURL)
            }
        }
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if webView === self._konsiloWebView {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {[weak self] () in
                guard let weakSelf = self else {return}
                weakSelf._konsiloCell.heightKonsiloHtmlContentViewLC.constant = webView.scrollView.contentSize.height
                
                if let layout: UICollectionViewFlowLayout = weakSelf.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                    layout.itemSize.height =  weakSelf._konsiloCell.heightKonsiloHtmlContentViewLC.constant + 80
                    weakSelf.collectionView.layoutIfNeeded()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                    weakSelf._konsiloCell.fonoButton.isHidden = false
                })
            }
        }
    }

}
