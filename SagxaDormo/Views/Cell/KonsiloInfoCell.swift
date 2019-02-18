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

    var delegate: KonsiloInfoCellDelegate?
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
    }

}
