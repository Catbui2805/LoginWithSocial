//
//  GoogleViewController.swift
//  LoginSocial
//
//  Created by Nguyen Tran Cong on 12/22/19.
//  Copyright © 2019 Nguyen Tran. All rights reserved.
//

import UIKit
import GoogleSignIn

class GoogleViewController: UIViewController {

    @IBOutlet weak var btLoginAndLogout: UIButton!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var fullname_: UILabel!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var userId: UILabel!
    @IBOutlet weak var idToken: UILabel!
    @IBOutlet weak var givenName: UILabel!
    @IBOutlet weak var familyName: UILabel!
    @IBOutlet weak var email: UILabel!
    
    var observer: NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self
        setupLayout()
        configNotification()
        
    }
    
    @IBAction func btLoginAndLogoutDidTouch(_ sender: Any) {
        
        guard (getGoogleInfo() != nil) else {
            // MARK:  Action login
            btLoginAndLogout.setTitle(Constant.Strings.login, for: .normal)
            GIDSignIn.sharedInstance()?.signIn()
            
            return
        }
        
        // MARK:  Action log out

        GIDSignIn.sharedInstance()?.signOut()
        UserDefault.removeObject(forKey: Constant.UserDefaultsKey.googleInfo)
        setupLayout()
    }
    
    // MARK:  Get user google info

    func getGoogleInfo() -> GoogleInfo? {
        guard let user = UserDefault.retrieve(object: GoogleInfo.self, fromKey: Constant.UserDefaultsKey.googleInfo) else {
            return nil
        }
        return user
    }
    
    // MARK:  Setup layout

    func setupLayout() {
        
        image.layer.cornerRadius = image.bounds.width / 2
        image.layer.borderWidth = 1.adjusted
        image.layer.borderColor = UIColor.gray.cgColor
        
        
        fullname_.text = getGoogleInfo()?.fullName ?? "full name"
        fullName.text = "Full name: \(getGoogleInfo()?.fullName ?? "")"
        userId.text = "User ID: \(getGoogleInfo()?.userId ?? "")"
        idToken.text = "ID Token: \(getGoogleInfo()?.idToken ?? "")"
        familyName.text = "Family Name: \(getGoogleInfo()?.familyName ?? "")"
        givenName.text = "Given Name: \(getGoogleInfo()?.givenName ?? "")"
        email.text = "Email: \(getGoogleInfo()?.email ?? "")"
        
        if getGoogleInfo() == nil {
            btLoginAndLogout.setTitle(Constant.Strings.login, for: .normal)
        } else {
            btLoginAndLogout.setTitle(Constant.Strings.logout, for: .normal)
        }
        
        guard let url = getGoogleInfo()?.imageUrl else { return }
        guard let data = try? Data(contentsOf: url) else { return }
        self.image.image = UIImage(data: data)
    }
    
    func configNotification() {
        observer = NotificationCenter.default.addObserver(forName: .googleInfo, object: nil, queue: OperationQueue.main) { result in
            if let user = result.object as? GoogleInfo {
                print("===>> user: \(user)")
            }
            self.setupLayout()
        }
    }
    
}
