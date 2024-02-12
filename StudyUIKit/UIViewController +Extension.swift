//
//  UIViewController +Extension.swift
//  StudyUIKit
//
//  Created by iHRomnik on 12.02.2024.
//

import UIKit

extension UIViewController {
    func show(message : String) {
        
        let alertVC = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default)
        
        alertVC.addAction(okAction)
        present(alertVC, animated: true)
    }
}
