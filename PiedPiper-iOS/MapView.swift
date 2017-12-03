//
//  MapView.swift
//  PiedPiper-iOS
//
//  Created by Rahul Ajmera on 12/2/17.
//  Copyright © 2017 Pranav Bokey. All rights reserved.
//

import UIKit
import GoogleMaps

class MapView: UIView {
    
//    // Labels
//    var emailUnderlineLabel = UILabel()
//    var passUnderlineLabel = UILabel()
//
//    //Image Views
//    var logoImgView = UIImageView()
//
//    //Text Fields
//
//    var emailTF = UITextField()
//    var passwordTF = UITextField()
//
//    //Buttons
//    var loginBtn = UIButton()
//    var signUpBtn = UIButton()
//    var forgotPasswordBtn = UIButton()
//
    
//
//    func configureImageViews() {
//        logoImgView.image = MWConstants.logo
//        logoImgView.contentMode = .scaleAspectFit
//    }
//
//    func configureTextFields() {
//        // Setting text field item properties
//        emailTF.layer.cornerRadius = 10.0
//        //emailTF.layer.borderWidth = 1
//
//        passwordTF.layer.cornerRadius = 10.0
//        //passwordTF.layer.borderWidth = 1
//
//        // Setting text properties
//        emailTF.keyboardType = UIKeyboardType.emailAddress
//        emailTF.returnKeyType = UIReturnKeyType.next
//        emailTF.attributedPlaceholder = NSAttributedString(string: "Enter Email", attributes: [NSForegroundColorAttributeName: UIColor.lightText])
//        emailTF.font = UIFont(name: "Avenir-Medium", size: 15.0)
//        emailTF.textColor = UIColor.white
//
//        passwordTF.returnKeyType = UIReturnKeyType.done
//        passwordTF.attributedPlaceholder = NSAttributedString(string: "Enter Password", attributes: [NSForegroundColorAttributeName: UIColor.lightText])
//        passwordTF.font = UIFont(name: "Avenir-Medium", size: 15.0)
//        passwordTF.textColor = UIColor.white
//        passwordTF.isSecureTextEntry = true
//    }
//
//
//    func configureLabels(){
//
//        emailUnderlineLabel.textColor = UIColor.white
//        passUnderlineLabel.textColor = UIColor.white
//
//        emailUnderlineLabel.text = emailUnderlineLabel.setUnderline()
//        passUnderlineLabel.text = passUnderlineLabel.setUnderline()
//    }
//
//
//
//    func textFieldDidBeginEditing(_ textField : UITextField)
//    {
//        emailTF.autocorrectionType = .no
//        emailTF.autocapitalizationType = .none
//        emailTF.spellCheckingType = .no
//    }
//
//    func configureButtons() {
//
//
//        loginBtn.setTitle("Login", for: UIControlState())
//        loginBtn.setTitleColor(UIColor.white, for: UIControlState())
//        loginBtn.backgroundColor = UIColor.clear
//        loginBtn.layer.cornerRadius = 20.0
//        loginBtn.layer.borderColor = UIColor.lightText.cgColor
//        loginBtn.layer.borderWidth = 1
//
//
//        signUpBtn.setTitle("Need to Sign Up?", for: UIControlState())
//        signUpBtn.setTitleColor(UIColor.lightText, for: UIControlState())
//        signUpBtn.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 12.0)
//
//        forgotPasswordBtn.setTitle("Forgot Password?", for: UIControlState())
//        forgotPasswordBtn.setTitleColor(UIColor.lightText, for: UIControlState())
//        forgotPasswordBtn.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 12.0)
//
//    }
//
    
    
//    func configureView() {
//
//        let gradient = CAGradientLayer()
//        gradient.frame = self.bounds
//        gradient.colors = [MWConstants.colors.loginDarkGradient.cgColor, MWConstants.colors.loginLightGradient.cgColor]
//        self.layer.insertSublayer(gradient, at: 0)
//
//        configureImageViews()
//        configureTextFields()
//        configureButtons()
//        textFieldDidBeginEditing(emailTF)
//        configureLabels()
//
//        //Auto Layout
//        let viewsDict = [
//            "title"  :   logoImgView,
//            "emTF"  :   emailTF,
//            "psTF"  :   passwordTF,
//            "login" :   loginBtn,
//            "signup":   signUpBtn,
//            "forgotPw": forgotPasswordBtn,
//            "elabel": emailUnderlineLabel,
//            "plabel": passUnderlineLabel
//            ] as [String : UIView]
//
//        self.prepareViewsForAutoLayout(viewsDict)
//
//
//        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("V:|-40-[title]-60-[emTF]-1-[elabel]-15-[psTF]-1-[plabel]-40-[login]-10-[forgotPw]-70-[signup]-10-|", views: viewsDict))
//        //
//        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|[title]|", views: viewsDict))
//
//        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-\(String(describing: MWConstants.loginFieldsOffset))-[emTF]-\(String(describing: MWConstants.loginFieldsOffset))-|", views: viewsDict as [String : AnyObject]))
//
//        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-\(String(describing: MWConstants.loginFieldsOffset))-[elabel]-\(String(describing: MWConstants.loginFieldsOffset))-|", views: viewsDict as [String : AnyObject]))
//        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-\(String(describing: MWConstants.loginFieldsOffset))-[plabel]-\(String(describing: MWConstants.loginFieldsOffset))-|", views: viewsDict as [String : AnyObject]))
//
//
//
//        //         self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-30-[title]-30-|", views: viewsDict as [String : AnyObject]))
//
//        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-\(String(describing: MWConstants.loginFieldsOffset))-[psTF]-\(String(describing: MWConstants.loginFieldsOffset))-|", views: viewsDict as [String : AnyObject]))
//
//        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-\(String(describing: MWConstants.loginFieldsOffset))-[login]-\(String(describing: MWConstants.loginFieldsOffset))-|", views: viewsDict as [String : AnyObject]))
//
//        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-\(String(describing: MWConstants.loginFieldsOffset))-[signup]-\(String(describing: MWConstants.loginFieldsOffset))-|", views: viewsDict as [String : AnyObject]))
//
//        self.addConstraints(NSLayoutConstraint.constraintsWithSimpleFormat("H:|-\(String(describing: MWConstants.loginFieldsOffset))-[forgotPw]-\(String(describing: MWConstants.loginFieldsOffset))-|", views: viewsDict as [String : AnyObject]))
//
//    }
    
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        configureView()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
}
