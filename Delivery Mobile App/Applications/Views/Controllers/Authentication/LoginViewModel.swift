//
//  LoginViewModel.swift
//  Delivery Mobile App
//
//  Created by Seakthong Aing on 6/15/21.
//

import UIKit

enum LoginIndexPath: Int, CaseIterable {
    case header
    case phoneNumber
    case password
    case forgotPassword
    case signin
    case or
    case signup
    case driverSignin
}

struct LoginModel {
    var phoneNumber: String
    var password: String
}


class LoginViewModel: BaseViewModel {
    
    var isLoginAsCustomer: Bool
    var loginModel = LoginModel(phoneNumber: "", password: "")
    
    init(isLoginAsCustomer: Bool) {
        self.isLoginAsCustomer = isLoginAsCustomer
    }
    
    var allCases: [LoginIndexPath] {
        get {
            isLoginAsCustomer
                ? [.header, .phoneNumber, .password, .forgotPassword, .signin, .or, .signup, .driverSignin]
                : [.header, .phoneNumber, .password, .forgotPassword, .signin]
        }
    }
    
    func values(with indexPath: LoginIndexPath) -> BaseViewModel {
        switch indexPath {
        case .header:
            return isLoginAsCustomer
                ? HeaderViewModel(
                    title: "welcome_label".localized,
                    narrative: "login_as_customer_narrative_label".localized,
                    image: UIImage(named: "ic-customer"),
                    imageHeight: 200)
                : HeaderViewModel(
                    title: "welcome_label".localized,
                    narrative: "login_as_driver_narrative_label".localized,
                    image: UIImage(named: "svg-driver"),
                    imageHeight: 250)
        case .phoneNumber:
            return TextFieldViewModel(
                with: TextFieldModel(
                    placeHolder: "phone_number_placeholder".localized,
                    value: loginModel.phoneNumber,
                    imageName: "ic-phone",
                    keyboardType: .phonePad),
                indexPath: LoginIndexPath.phoneNumber)
        case .password:
            return TextFieldViewModel(
                with: TextFieldModel(
                    placeHolder: "password_placeholder".localized,
                    value: loginModel.password,
                    imageName: "ic-password",
                    isSecureTextEntry: true,
                    keyboardType: .default),
                indexPath: LoginIndexPath.password)
        case .forgotPassword:
            return TextFieldViewModel(
                with: TextFieldModel(
                    placeHolder: "forgot_password_label".localized),
                indexPath: LoginIndexPath.phoneNumber)
        case .signin:
            return TextFieldViewModel(
                with: TextFieldModel(
                    placeHolder: "sign_in_label"),
                indexPath: LoginIndexPath.phoneNumber)
        case .or:
            return TextFieldViewModel(
                with: TextFieldModel(
                    placeHolder: "or_label"),
                indexPath: LoginIndexPath.phoneNumber)
        case .signup:
            return TextFieldViewModel(
                with: TextFieldModel(
                    placeHolder: "signup_label"),
                indexPath: LoginIndexPath.phoneNumber)
        case .driverSignin:
            return TextFieldViewModel(
                with: TextFieldModel(
                    placeHolder: "login_as_driver_label"),
                indexPath: LoginIndexPath.phoneNumber)
        }
    }
}
