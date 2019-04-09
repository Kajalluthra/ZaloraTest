//
//  UIAlertExtension.swift
//  ZaloraTest
//
//  Created by Kajal on 9/4/19.
//  Copyright © 2019 Kajal. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    //MARK:- Alerts
    func showAlertPopUp(message: String) {
        let alertController = UIAlertController(title: GlobalConstants.AppName, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}


