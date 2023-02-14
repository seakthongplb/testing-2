//
//  TextFieldModel.swift
//  Delivery Mobile App
//
//  Created by Seakthong Aing on 6/15/21.
//

import UIKit

struct TextFieldModel {
    var placeHolder: String
    var value: String
    var imageName: String
    var isSecureTextEntry: Bool
    var keyboardType: UIKeyboardType
    var isSelectedCurrency: Bool
    var isSelectedAccount: Bool
    var isPrefix: Bool
    var prefix: String
    var isScan: Bool
    var isWarning: Bool
    var warning: String
    var isEditable: Bool
    var validateFormInput: ValidationModel? = nil
    
    init(placeHolder: String = "",
         value: String = "",
         imageName: String = "",
         isSecureTextEntry: Bool = false,
         keyboardType: UIKeyboardType = .numberPad,
         isSelectedCurrency: Bool = false,
         isSelectedAccount: Bool = false,
         isPrefix: Bool = false,
         prefix: String = "",
         isScan: Bool = false,
         isWarning: Bool = false,
         warning: String = "",
         isEditable: Bool = true,
         validateFormInput: ValidationModel? = nil) {
        self.placeHolder = placeHolder
        self.value = value
        self.imageName = imageName
        self.isSecureTextEntry = isSecureTextEntry
        self.keyboardType = keyboardType
        self.isSelectedCurrency = isSelectedCurrency
        self.isSelectedAccount = isSelectedAccount
        self.isPrefix = isPrefix
        self.prefix = prefix
        self.isScan = isScan
        self.isWarning = isWarning
        self.warning = warning
        self.isEditable = isEditable
        self.validateFormInput = validateFormInput
    }
}
