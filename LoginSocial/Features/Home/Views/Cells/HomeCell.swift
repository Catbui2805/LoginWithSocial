//
//  HomeCell.swift
//  LoginSocial
//
//  Created by Nguyen Tran Cong on 12/11/19.
//  Copyright © 2019 Nguyen Tran. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var btLogin: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }
    
    func setupLayout() {
        viewCell.backgroundColor = .white
        viewCell.layer.cornerRadius = 6.adjusted
        
        btLogin.layer.cornerRadius = 6.adjusted
        btLogin.layer.borderWidth = 1.adjusted
        btLogin.layer.borderColor = UIColor.blue.cgColor
        btLogin.backgroundColor = .blue
    }
    
    func configCell(_ item: HomeModel?) {
        btLogin.setTitle(item?.title ?? "", for: .normal)
        btLogin.setTitleColor(.white, for: .normal)
    }
}
