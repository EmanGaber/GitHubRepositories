//
//  AlertCustom.swift
//  GitHub Repositories
//
//  Created by Eman Gaber on 3/15/20.
//  Copyright © 2020 Eman Gaber. All rights reserved.
//

import Foundation
import CDAlertView

protocol Alertable {
    func showMessage(msg:String,type:CDAlertViewType)
}


extension UIViewController :Alertable {
    
    func showMessage(msg: String, type: CDAlertViewType) {
        DispatchQueue.main.async {
            let alert = CDAlertView(title: "", message: msg, type: type)
            alert.autoHideTime = 2.0 // This will hide alert box after 2.0 seconds

            alert.circleFillColor = #colorLiteral(red: 0.2715061009, green: 0.1524860561, blue: 0.6279309392, alpha: 1)

            alert.hideAnimations = { (center, transform, alpha) in
                transform = .init(rotationAngle: .pi)
                alpha = 0
            }

            alert.hideAnimationDuration = 0.44
            alert.show()
        }
        
    }
}
