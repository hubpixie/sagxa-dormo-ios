//
//  KonsiloInfoCell.swift
//  SagxaDormo
//
//  Created by venus.janne on 2019/02/18.
//  Copyright © 2019 com.venuso-janne. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol KonsiloInfoCellDelegate {
    func fonoWebViewDidShow(cell: KonsiloInfoCell)
}
class KonsiloInfoCell: UICollectionViewCell {
    @IBOutlet weak var unuaView: UIView!
    @IBOutlet weak var duaView: UIView!
    @IBOutlet weak var fonoButton: UIButton! {
        didSet {
            self.fonoButton.rx.tap
                .subscribe(onNext: { [unowned self] in
                    self.delegate?.fonoWebViewDidShow(cell: self)
                })
                .disposed(by: self._disposeBag)
        }
    }
    @IBOutlet weak var heightKonsiloHtmlContentViewLC: NSLayoutConstraint!
    @IBOutlet weak var konsiloHtmlContentView: UIView!
    
    var isUnaViewHidden: Bool = false {
        didSet {
            let delta: CGFloat = self.hidesContainerViewByVertically(containerView: self.unuaView, hidden:isUnaViewHidden)
            self.unuaView.isHidden = isUnaViewHidden
            if isUnaViewHidden {
                self.deltaCellHeight += delta
            }
        }
    }
    var isDuaViewHidden: Bool = false {
        didSet {
           let delta: CGFloat = self.hidesContainerViewByVertically(containerView: self.duaView, hidden:isDuaViewHidden)
            self.duaView.isHidden = isDuaViewHidden
            if isDuaViewHidden {
                self.deltaCellHeight += delta
            }
        }
    }

    var delegate: KonsiloInfoCellDelegate?
    var deltaCellHeight: CGFloat = 0
    private(set) var rawHeight: CGFloat = 595
    private var _hiddenContainerViewLCDic: [String: NSLayoutConstraint] = [:]
    private let _disposeBag = DisposeBag()

    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //heightKonsiloHtmlContentViewLC.constant = 200
        
    }

    private func hidesContainerViewByVertically(containerView: UIView, hidden: Bool) -> CGFloat  {
        var height: CGFloat = 0
        let key: String = containerView.description
        let height_: CGFloat = self._hiddenContainerViewLCDic[key]?.constant ?? 0
        
        if let constraint: NSLayoutConstraint = containerView.constraints.first(where: { (cs) -> Bool in
            return cs.firstAttribute == .height
        }) {
            height = constraint.constant
            if hidden {
                constraint.constant = 0
                constraint.isActive = !hidden
            } else {
                constraint.constant = (height_ > height ? height_ : height)
                constraint.isActive = hidden
            }
        }
        return height
    }
}
