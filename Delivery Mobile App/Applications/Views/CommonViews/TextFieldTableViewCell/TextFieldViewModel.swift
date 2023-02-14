//
//  TextFieldViewModel.swift
//  Delivery Mobile App
//
//  Created by Seakthong Aing on 6/15/21.
//

import UIKit

class TextFieldViewModel: BaseViewModel {
    let textFieldModel: TextFieldModel
    var indexPath: Any? = nil
    
    init(with textFieldModel: TextFieldModel, indexPath: Any? = nil) {
        self.textFieldModel = textFieldModel
        self.indexPath = indexPath
    }
    
    var image: UIImage? {
        return UIImage(named: textFieldModel.imageName)
    }
    
    var value: String {
        return textFieldModel.value
    }
    
    var placeHolder: String {
        return textFieldModel.placeHolder
    }
    
    var isSecureTextEntry: Bool {
        return textFieldModel.isSecureTextEntry
    }
    
    var keyboardType: UIKeyboardType {
        return textFieldModel.keyboardType
    }
    
    var isSelectedCurrecy: Bool {
        return textFieldModel.isSelectedCurrency
    }
    
    var isSelectedAccount: Bool {
        return textFieldModel.isSelectedAccount
    }
    
    var isPrefix: Bool {
        return textFieldModel.isPrefix
    }
    
    var prefix: String {
        return textFieldModel.prefix
    }
    
    var isScan: Bool {
        return textFieldModel.isScan
    }
    
    var isWarning: Bool {
        return textFieldModel.isWarning
    }
    
    var warning: String {
        return textFieldModel.warning
    }
    
    var isEditable: Bool {
        return textFieldModel.isEditable
    }
    
    var validateFormInput: ValidationModel? {
        return textFieldModel.validateFormInput
    }
}
