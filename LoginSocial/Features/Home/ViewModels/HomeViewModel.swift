//
//  HomeViewModel.swift
//  LoginSocial
//
//  Created by Nguyen Tran Cong on 12/12/19.
//  Copyright © 2019 Nguyen Tran. All rights reserved.
//

import Foundation

class HomeViewModel {
    private var socials: [HomeModel]?
    
    init(_ socials: [HomeModel]) {
        self.socials = socials
    }
    
    func update(_ socials: [HomeModel]){
        self.socials = socials
    }
    
    func getItem(_ index: Int) -> HomeModel? {
        return socials?[index]
    }
    
    func numberOfObject() -> Int {
        return socials?.count ?? 0
    }
}
