//
//  GoogleInfo.swift
//  LoginSocial
//
//  Created by Nguyen Tran Cong on 12/22/19.
//  Copyright © 2019 Nguyen Tran. All rights reserved.
//

import Foundation

class GoogleInfo: Codable {
    var userId: String
    var idToken: String
    var fullName: String
    var givenName: String
    var familyName: String
    var email: String
    var imageUrl: URL
    
    init(_ userId: String, _ idToken: String, _ fullName: String, _ givenName: String, _ familyName: String, _ email: String, _ imageUrl: URL) {
        self.userId = userId
        self.idToken = idToken
        self.fullName = fullName
        self.givenName = givenName
        self.familyName = familyName
        self.email = email
        self.imageUrl = imageUrl
    }
}
