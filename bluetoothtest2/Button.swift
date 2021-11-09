//
//  Button.swift
//  bluetoothtest2
//
//  Created by 세진시스템 on 2021/09/14.
//

import UIKit

class Button: UIButton {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    
        self.layer.cornerRadius = 0.5 * self.bounds.size.width
    }
}
