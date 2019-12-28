//
//  FacebookUserInfo.swift
//  LoginSocial
//
//  Created by Nguyen Tran Cong on 12/22/19.
//  Copyright © 2019 Nguyen Tran. All rights reserved.
//

import Foundation
import SwiftyJSON

class FacebookUserInfo: Codable {
    var id: String = ""
    var firstName: String = ""
    var lastName: String = ""
    var gender: String = ""
    var email: String = ""
    var birthday: String = ""
    var picture: PictureModel
    
    init(_ json: JSON) {
        self.id = json[Facebook.Fields.id].stringValue
        self.firstName = json[Facebook.Fields.first_name].stringValue
        self.lastName = json[Facebook.Fields.last_name].stringValue
        self.gender = json[Facebook.Fields.gender].stringValue
        self.email = json[Facebook.Fields.email].stringValue
        self.birthday = json[Facebook.Fields.birthday].stringValue
        self.picture = PictureModel(json["picture"]["data"].self)
    }
}

class PictureModel: Codable {
    private(set) var height: Double = 0.0
    private(set) var width: Double = 0.0
    private(set) var url: String = ""
    
    init(_ json: JSON) {
        self.height = json["height"].doubleValue
        self.width = json["width"].doubleValue
        self.url = json["url"].stringValue
    }
}

