//
//  Constant.swift
//  LoginSocial
//
//  Created by Nguyen Tran Cong on 12/11/19.
//  Copyright © 2019 Nguyen Tran. All rights reserved.
//

import Foundation
import UIKit

enum Constant {
    enum Screen {
        static let screenWidth = UIScreen.main.bounds.width
        static let screenHeight = UIScreen.main.bounds.height
        static let ratio: CGFloat = screenWidth / 375
    }
    enum Fonts {
        
    }
    enum Strings {
        static let hello = NSLocalizedString("hello", comment: "")
        static let content = NSLocalizedString("content", comment: "")
        static let facebook = NSLocalizedString("facebook", comment: "")
        static let google = NSLocalizedString("google", comment: "")
        static let logout = NSLocalizedString("logout", comment: "")
        static let login = NSLocalizedString("login", comment: "")
    }
    enum Colors {
        
    }
    
    enum UserDefaultsKey {
        static let facebookInfo = "facebookInfo"
        static let googleInfo = "googleInfo"
    }
}

enum Facebook {
    enum Permissions {
        static let publicProfile = "public_profile"
        static let email = "email"
        static let userBirthday = "user_birthday"
        static let userGender = "user_gender"
        static let all = Facebook.Permissions.publicProfile + ", " +
            Facebook.Permissions.userBirthday + ", " +
            Facebook.Permissions.email + ", " +
            Facebook.Permissions.userGender
    }
    
    enum Fields {
        static let id = "id"
        static let birthday = "birthday"
        static let picture = "picture.type(large)"
        static let first_name = "first_name"
        static let last_name = "last_name"
        static let gender = "gender"
        static let email = "email"
        static let all = Facebook.Fields.birthday + ", " +
            Facebook.Fields.picture + ", " +
            Facebook.Fields.first_name + ", " +
            Facebook.Fields.last_name + ", " +
            Facebook.Fields.gender + ", " +
            Facebook.Fields.email
    }
}

enum Google {
    static let CLIENT_ID = "866936412507-u2499ia29a9hhejnij1aj4u3ashs23pp.apps.googleusercontent.com"
    enum Permissions {
    
    }
    
    enum Fields {
        
    }
}
