//
//  ViewController.swift
//  Scroll View
//
//  Created by student on 05.10.2018.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scrollview: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func registerForKeyboardNotifications(){
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWasShown(_:)),
                                               name: UIResponder.keyboardDidShowNotification,
                                               object: nil
        )
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillBeHidden(_:)),
                                               name: UIResponder.keyboardDidHideNotification,
                                               object: nil
        )
        

        
        
    }
    
    @objc func keyboardWasShown(_ notification: NSNotification){
        guard let info = notification.userInfo,
            let keyboardFrameValue = info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue
            else {return}
        
            let keyboardFrame = keyboardFrameValue.cgRectValue
            let keyboardHeight = keyboardFrame.size.height + 40
        
        let contentInsents = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
        scrollview.contentInset = contentInsents
        scrollview.scrollIndicatorInsets = contentInsents

}
    
    @objc func keyboardWillBeHidden(_ notification: NSNotification){
        let contentInsents = UIEdgeInsets.zero
        scrollview.contentInset = contentInsents
        scrollview.scrollIndicatorInsets = contentInsents
    }

}
