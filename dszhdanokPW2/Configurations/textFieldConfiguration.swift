//
//  textFieldConfiguration.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 23.09.25.
//

import UIKit

class TextFieldConfiguration {
    
    private static var mainView: UIView?
    
    private enum Constants {
        static let textFieldText: String = "Enter HEX code"
        static let textApply: String = "Apply"
        static let textClose: String = "Close"
        
        static let textrLeding: CGFloat = 20
        static let textrTrailing: CGFloat = -20
        static let textValueTop: CGFloat = 20
        static let textValueFont: CGFloat = 10
        static let textValueRight: CGFloat = -20
        static let textValueWidth: CGFloat = 350
        static let buttonValueWidth: CGFloat = 170
        
        static let closeButtonLeft: CGFloat = 10
        static let closeButtonRight: CGFloat = -20
        
        static let emptyString: String = ""
        static let textFieldError: String = "Текст не введен или неверное значение HEX "
        
        static let pattern = "^#[0-9A-Fa-f]{0,6}$"
        
        static let durationOfAnimation: CGFloat = 0.5
        
        static let buttonHiddenAlfaOn: CGFloat = 0
        static let buttonHiddenAlfaOff: CGFloat = 1
    }
    
    static func configureText(in view: UIView, stack: UIStackView, textField: UITextField?, button: UIButton?, closeButton: UIButton?) {
                     
        guard let textField, let button, let closeButton else { return }
        
        view.addSubview(textField)
        view.addSubview(button)
        view.addSubview(closeButton)
        
        mainView = view
        textField.placeholder = Constants.textFieldText
        textField.borderStyle = .roundedRect
        button.backgroundColor = .white
        textField.pinTop(to: stack.bottomAnchor, Constants.textValueFont)
        textField.pinCenterX(to: view.centerXAnchor)
        textField.changeWidth(Constants.textValueWidth)
        textField.pinLeft(to: view.leadingAnchor, Constants.textrLeding)
        textField.pinRight(to: view.trailingAnchor, Constants.textValueRight)
        
        button.setTitle(Constants.textApply, for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.pinTop(to: textField.bottomAnchor)
        button.pinLeft(to: view.leadingAnchor, Constants.textrLeding)
        button.changeWidth(Constants.buttonValueWidth)
        
        closeButton.setTitle(Constants.textClose, for: .normal)
        closeButton.backgroundColor = .systemBlue
        closeButton.setTitleColor(.white, for: .normal)
        closeButton.pinTop(to: textField.bottomAnchor)
        closeButton.pinLeft(to: button.trailingAnchor, Constants.closeButtonLeft)
        closeButton.pinRight(to: view.trailingAnchor, Constants.closeButtonRight)
        closeButton.changeWidth(Constants.buttonValueWidth)
    
        
         
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)


        
    }
    
}
