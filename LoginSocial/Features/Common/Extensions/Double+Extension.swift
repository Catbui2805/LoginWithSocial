//
//  Double+Extension.swift
//  LoginSocial
//
//  Created by Nguyen Tran Cong on 12/12/19.
//  Copyright © 2019 Nguyen Tran. All rights reserved.
//

import Foundation
import UIKit

extension Double {
    var adjusted: CGFloat {
        return CGFloat(self) * Constant.Screen.ratio
    }
}
