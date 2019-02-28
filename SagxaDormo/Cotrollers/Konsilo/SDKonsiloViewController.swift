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
    
    @IBOutlet weak var collectionContainerView: UIView!
    
    private var collectionView: UICollectionView! {
        didSet {
            let cellSize = CGSize(width:self.collectionContainerView.frame.width - 16, height: 400)
            
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical //.horizontal
            layout.itemSize = cellSize
            layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
            layout.minimumLineSpacing = 1.0
            layout.minimumInteritemSpacing = 1.0
            self.collectionView.setCollectionViewLayout(layout, animated: true)
            self.collectionView.backgroundColor = UIColor.clear
            self.collectionContainerView.addSubview(self.collectionView)
            self.collectionContainerView.adjustViewLayout(itemView: self.collectionView)
            
            for i in 0 ..< KonsiloCellIdentifier.allValues.count {
                self.collectionView.register(KonsiloCellIdentifier.allNibs[i], forCellWithReuseIdentifier: KonsiloCellIdentifier.allValues[i])
            }

        }
    }
    
    private var _konsiloWebView: WKWebView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.collectionView?.removeFromSuperview()
        self.collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.collectionContainerView.frame.width, height: self.collectionContainerView.frame.height), collectionViewLayout: UICollectionViewFlowLayout())
        
        if self.collectionView.dataSource == nil {
            self.collectionView.dataSource = self
            self.collectionView.delegate = self
        } else {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
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

            //cell_.isUnaViewHidden = false
            cell_.isDuaViewHidden = true
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

/*
extension SDKonsiloViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout: UICollectionViewFlowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize.height = self.view.frame.height
        
        return layout.itemSize
        
    }
}
*/

// MARK: - KonsiloInfoCellDelegate

extension SDKonsiloViewController: KonsiloInfoCellDelegate {
    func fonoWebViewDidShow(cell: KonsiloInfoCell) {
        //self.performSegue(withIdentifier: R.segue.sdKonsiloViewController.sanoTelefonoSegue.identifier, sender: cell)
        SDUserDefault.shared.currentLoadState = .login

        self.tabBarController?.dismiss(animated: false, completion: nil)
       // UIApplication.shared.delegate?.window??.rootViewController = SDViewController.splashVC
//        self.tabBarController?.navigationController?.popToViewController(SDViewController.splashVC!, animated: false)
        //SDViewController.splashVC?.dismiss(animated: true, completion: nil)
        
    }
}

extension SDKonsiloViewController: WKNavigationDelegate {
    private func setupKonsiloWebView(contentView: UIView) {
        self._konsiloWebView = WKWebView(frame: CGRect(x: 8, y: 0, width: contentView.frame.width, height: contentView.frame.height))
//        for subview in contentView.subviews {
//            subview.removeFromSuperview()
//        }
        
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
                let indexPath: IndexPath = IndexPath(item: 0, section: 0)
                
                if let cell: KonsiloInfoCell = self?.collectionView.cellForItem(at: indexPath) as? KonsiloInfoCell , let layout: UICollectionViewFlowLayout = weakSelf.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                    let oldHeight: CGFloat = cell.heightKonsiloHtmlContentViewLC.constant
                    cell.heightKonsiloHtmlContentViewLC.constant = webView.scrollView.contentSize.height
                    
                    layout.itemSize.height = cell.rawHeight + webView.scrollView.contentSize.height - oldHeight - cell.deltaCellHeight
                    //weakSelf._konsiloCell.frame = frame

                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                        cell.fonoButton.isHidden = false
                        cell.layoutIfNeeded()
                    })
                }
            }
        }
    }

}
