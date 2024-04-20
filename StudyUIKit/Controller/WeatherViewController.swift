//
//  ViewController.swift
//  StudyUIKit
//
//  Created by iHRomnik on 06.02.2024.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var cityImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityImage.image = UIImage(named: "City/eye")
        
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
                    
                    
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
            
            
            @objc func keyboardWillShow(notification: Notification) {
                guard let kbSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {return}
                let insets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.size.height, right: 0.0)
                scrollView.contentInset = insets
            }
            
            @objc func keyboardWillHide(notification: Notification) {
                let insets = UIEdgeInsets.zero
                scrollView.contentInset = insets
            }
            
            @objc func hideKeyboard() {
                self.scrollView?.endEditing(true)
            }

    @IBAction func tapButton(_ sender: UIButton) {
        guard let login = loginTextField.text,
              let password = passwordTextField.text,
              login == "",
              password == "" else {
            show(message: "Error password")
            return
        }
        
        performSegue(withIdentifier: "Login", sender: nil)
        
    }
    
}

