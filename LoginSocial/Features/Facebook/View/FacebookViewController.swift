//
//  FacebookViewController.swift
//  LoginSocial
//
//  Created by Nguyen Tran Cong on 12/21/19.
//  Copyright © 2019 Nguyen Tran. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import SwiftyJSON

class FacebookViewController: UIViewController {
    
    @IBOutlet weak var btLoginAndLogout: UIButton!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var birthday: UILabel!
    @IBOutlet weak var email: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    // MARK:  Action login facebook
    
    @IBAction func btLoginAndLogoutDidTouch(_ sender: UIButton) {
        // MARK:  Request permission facebook
        if UserDefault.retrieve(object: FacebookUserInfo.self, fromKey: Constant.UserDefaultsKey.facebookInfo) != nil {
            // MARK:  Log out action

            let loginManager = LoginManager()
            loginManager.logOut()
            
            let alertController = UIAlertController(title: Constant.Strings.logout, message: Constant.Strings.logout, style: .alert) { _ in
                self.fullName.text = "Full name"
                self.email.text = "Email"
                self.gender.text = "Gender"
                self.birthday.text = "Birthday"
                self.image.image = UIImage(named: "")
                UserDefault.removeObject(forKey: Constant.UserDefaultsKey.facebookInfo)
                self.btLoginAndLogout.setTitle(Constant.Strings.login, for: .normal)
            }
            present(alertController, animated: true, completion: nil)
            
        } else {
            // MARK:  Login action request

            let loginManager: LoginManager = LoginManager()
            loginManager.logIn(permissions: [Facebook.Permissions.all], from: self) { (result, error) in
                if error != nil {
                    loginManager.logOut()
                } else if (result?.isCancelled)! {
                } else {
                    self.getUserInfoFromFacebook()
                    self.btLoginAndLogout.setTitle(Constant.Strings.logout, for: .normal)
                }
            }
        }
    }
}

extension FacebookViewController {
    func setupLayout() {
        
        image.layer.cornerRadius = image.bounds.width / 2
        image.layer.borderWidth = 1.adjusted
        image.layer.borderColor = UIColor.gray.cgColor
        
        btLoginAndLogout.setTitle(Constant.Strings.login, for: .normal)
        if let user = UserDefault.retrieve(object: FacebookUserInfo.self, fromKey: Constant.UserDefaultsKey.facebookInfo) {
            
            btLoginAndLogout.setTitle(Constant.Strings.logout, for: .normal)
            self.fullName.text = "\(user.lastName) \(user.firstName)"
            self.email.text = user.email
            self.gender.text = user.gender
            self.birthday.text = user.birthday
            
            guard let url = URL(string: user.picture.url) else { return }
            guard let data = try? Data(contentsOf: url) else { return }
            self.image.image = UIImage(data: data)
        } else {
            btLoginAndLogout.setTitle(Constant.Strings.login, for: .normal)
        }
    }
}

extension FacebookViewController {
    func getUserInfoFromFacebook() {
        let accessToken = AccessToken.current
        let param = ["fields": Facebook.Fields.all]
        let graphRequest: GraphRequest = GraphRequest(graphPath: "me", parameters: param, tokenString: accessToken?.tokenString, version: "v2.11", httpMethod: HTTPMethod(rawValue: "GET"))
        graphRequest.start(completionHandler: { (_, result, error) -> Void in
            if error != nil {
                return
            }
            if let result = result {
                let json = JSON(result)
                let userInfo = FacebookUserInfo(json)
                UserDefault.save(customObject: userInfo, inKey: Constant.UserDefaultsKey.facebookInfo)
                if let user = UserDefault.retrieve(object: FacebookUserInfo.self, fromKey: Constant.UserDefaultsKey.facebookInfo) {
                    self.fullName.text = "\(user.lastName) \(user.firstName)"
                    self.email.text = user.email
                    self.gender.text = user.gender
                    self.birthday.text = user.birthday
                    
                    guard let url = URL(string: user.picture.url) else { return }
                    guard let data = try? Data(contentsOf: url) else { return }
                    self.image.image = UIImage(data: data)
                }
            }
        })
    }
}
