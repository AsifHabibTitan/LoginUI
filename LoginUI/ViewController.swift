//
//  ViewController.swift
//  LoginUI
//
//  Created by Asif Habib on 20/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var phoneNumberOutlet: UITextField!
    @IBAction func continueButton(_ sender: UIButton) {
    }
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var phoneNumberWrapper: CustomView!
    @IBOutlet weak var imageContainer: UIView!
    @IBOutlet weak var code: UILabel!
 
    @IBOutlet weak var continueButtonOutlet: UIButton!
    @IBOutlet weak var phoneIcon: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageContainer.layer.cornerRadius = 35
        
        phoneNumberOutlet.borderStyle = .none
        
        
        phoneNumberOutlet.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        phoneNumberOutlet.resignFirstResponder()
        UIView.animate(withDuration: 1/3) {
            self.view.layoutIfNeeded()
        }
    }
    


}
extension ViewController: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
//        textField.resignFirstResponder()
        print("text field begin editing")
        print(phoneNumberWrapper.constraints)
        var constraints = [NSLayoutConstraint]()
        // to move text field above
        
        constraints.append(NSLayoutConstraint(item: phoneNumberWrapper!, attribute: .top, relatedBy: .equal, toItem: phoneNumberWrapper.superview, attribute: .bottom, multiplier: 0.35, constant: 0))
        // to hide green background
        imageContainer.alpha = 0
        // to change phoneIconPosition
        
        constraints.append(NSLayoutConstraint(item: imageContainer!, attribute: .top, relatedBy: .equal, toItem: imageContainer.superview, attribute: .bottom, multiplier: 0.07, constant: 0))
        // to change text position
        constraints.append(NSLayoutConstraint(item: label!, attribute: .top, relatedBy: .equal, toItem: label.superview, attribute: .bottom, multiplier: 0.205, constant: 0))
        constraints.append(NSLayoutConstraint(item: continueButtonOutlet!, attribute: .top, relatedBy: .equal, toItem: continueButtonOutlet.superview, attribute: .bottom, multiplier: 0.569, constant: 0))
//        NSLayoutConstraint.deactivate(phoneNumberWrapper.constraints)
        NSLayoutConstraint.activate(constraints)
        UIView.animate(withDuration: 1/3) {
            self.view.layoutIfNeeded()
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("end Editing")
        var constraints = [NSLayoutConstraint]()
        constraints.append(NSLayoutConstraint(item: phoneNumberWrapper!, attribute: .top, relatedBy: .equal, toItem: phoneNumberWrapper.superview, attribute: .bottom, multiplier: 0.67, constant: 0))
        // to hide green background
        imageContainer.alpha = 1
        // to change phoneIconPosition
        
        constraints.append(NSLayoutConstraint(item: imageContainer!, attribute: .top, relatedBy: .equal, toItem: imageContainer.superview, attribute: .bottom, multiplier: 0.313, constant: 0))
        // to change text position
        constraints.append(NSLayoutConstraint(item: label!, attribute: .top, relatedBy: .equal, toItem: label.superview, attribute: .bottom, multiplier: 0.139, constant: 0))
        constraints.append(NSLayoutConstraint(item: continueButtonOutlet!, attribute: .top, relatedBy: .equal, toItem: continueButtonOutlet.superview, attribute: .bottom, multiplier: 0.89, constant: 0))
//        NSLayoutConstraint.deactivate(phoneNumberWrapper.constraints)
        NSLayoutConstraint.activate(constraints)
    }
}
