//
//  TextFieldTableViewCell.swift
//  Delivery Mobile App
//
//  Created by Seakthong Aing on 6/15/21.
//

import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextFields

protocol TextFieldTableViewCellDelgate: NSObject {
    func didUpdateTextField(_ textField: UITextField, viewModel: BaseViewModel)
    func textFieldDidEndEditing(_ textField: UITextField, viewModel: BaseViewModel)
    func textFieldShouldBeginEditing(_ textField: UITextField, viewModel: BaseViewModel)
}

extension TextFieldTableViewCellDelgate {
    func didUpdateTextField(_ textField: UITextField, viewModel: BaseViewModel) { }
    func textFieldDidEndEditing(_ textField: UITextField, viewModel: BaseViewModel) { }
    func textFieldShouldBeginEditing(_ textField: UITextField, viewModel: BaseViewModel) { }
}

class TextFieldTableViewCell: UITableViewCell, CellProtocol {
    
    @IBOutlet weak var textField: MDCOutlinedTextField!
    
    weak var delegate: TextFieldTableViewCellDelgate?
    
    private var vm: TextFieldViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    private func setupView() {
        selectionStyle = .none
        textField.autocorrectionType = .yes
        textField.autocorrectionType = .no
        if #available(iOS 12.0, *) {
            textField.textContentType = .oneTimeCode
        }
        
        textField.delegate = self
        textField.setOutlineColor(.main, for: .normal)
        textField.setOutlineColor(.main, for: .editing)
        textField.setFloatingLabelColor(.text, for: .editing)
        textField.keyboardType = .numberPad
        textField.leadingViewMode = .always
        textField.sizeToFit()
    }
    
    func configCell(with viewModel: BaseViewModel) {
        guard let vm = viewModel as? TextFieldViewModel else {
            return
        }
        
        self.vm = vm
        
        textField.label.text = vm.placeHolder
        textField.text = vm.value
        textField.isSecureTextEntry = vm.isSecureTextEntry
        textField.leadingView = UIImageView(image: vm.image)
        textField.keyboardType = vm.keyboardType

        if vm.isPrefix {
            textField.text = vm.prefix + vm.value
        }

        if vm.isEditable == false {
            textField.isUserInteractionEnabled = vm.isEditable
            textField.backgroundColor = .lightGray
        }
    }
    
}

extension TextFieldTableViewCell: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //MARK: - Validate Bill Input
        if vm.validateFormInput != nil {
            if let text = textField.text, let textRange = Range(range, in: text) {
                let finalText = text.replacingCharacters(in: textRange, with: string)
                if finalText.utf8.count > vm.validateFormInput?.minLength ?? 0, vm.validateFormInput?.maxLength ?? 0 < finalText.utf8.count {
                    return false
                } else {
                    return true
                }
            } else {
                return true
            }
        } else if vm.keyboardType == .decimalPad {
            // Used for Currency : Format 0.00
            guard let text = textField.text else {
                delegate?.didUpdateTextField(textField, viewModel: vm)
                return true
            }
            
            if text.contains(",") {
                if string == "," {
                    return false
                    
                } else if text.components(separatedBy: ",")[1].count == 2 && range.length != 1 {
                    return false
                }
            }
            
                delegate?.didUpdateTextField(textField, viewModel: vm)
            return true
            
        } else {
            delegate?.didUpdateTextField(textField, viewModel: vm)
            return true
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        delegate?.didUpdateTextField(textField, viewModel: vm)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.textFieldDidEndEditing(textField, viewModel: vm)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        delegate?.textFieldShouldBeginEditing(textField, viewModel: vm)
        return true
    }
}
