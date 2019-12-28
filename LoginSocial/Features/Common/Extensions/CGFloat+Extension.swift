//
//  CGFloat+Extension.swift
//  LoginSocial
//
//  Created by Nguyen Tran Cong on 12/11/19.
//  Copyright © 2019 Nguyen Tran. All rights reserved.
//

import Foundation
import UIKit

extension CGFloat {
    var adjusted: CGFloat{
        return self * Constant.Screen.ratio
    }
}
