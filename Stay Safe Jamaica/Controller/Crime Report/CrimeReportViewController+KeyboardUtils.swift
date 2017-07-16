//
//  CrimeReportViewController+KeyboardUtils.swift
//  Stay Safe Jamaica
//
//  Created by Javon Davis on 7/15/17.
//  Copyright © 2017 Stay Safe Jamaica. All rights reserved.
//

import Foundation
import UIKit

extension CrimeReportViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        crimeDescriptionTextView.resignFirstResponder()
    }
    
    func subscribeToKeyboardNotifications() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications() {
        
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
    }
    
    func resetView() {
        view.frame.origin.y = 0
    }
    
    func keyboardWillShow(_ notification:Notification) {
        resetView()
        if crimeDescriptionTextView.isFirstResponder {
            view.frame.origin.y -= getKeyboardHeight(notification) // adjust the view based on keyboard
        }
    }
    
    func keyboardWillHide(_ notification:Notification) {
        resetView()
    }
    
    func getKeyboardHeight(_ notification:Notification) -> CGFloat {
        
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.cgRectValue.height
    }
}
