//
//  HomeModel.swift
//  LoginSocial
//
//  Created by Nguyen Tran Cong on 12/12/19.
//  Copyright © 2019 Nguyen Tran. All rights reserved.
//

import Foundation

class HomeModel {
    var id: Int
    var title: String
    var desc: String
    
    init(_ id: Int, _ title: String, _ desc: String) {
        self.id = id
        self.title = title
        self.desc = desc
    }
}
