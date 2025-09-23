//
//  textFieldConfiguration.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 23.09.25.
//

import UIKit

class TextFieldConfiguration {
    
    private static var textField: UITextField?
    private static var mainView: UIView?
    private static var button: UIButton?
    private static var closeButton: UIButton?
    
    static func configureText(in view: UIView, stack: UIStackView) {
        
        
        textField = UITextField()
        button = UIButton(type: .system)
        closeButton = UIButton(type: .system)
        
        guard let textField = textField,
                      let button = button,
                      let closeButton = closeButton else { return }
                               
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
        textField.pinRight(to: view.trailingAnchor, Constants.textValueTop)
        
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

        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        closeButton.addTarget(self, action: #selector(hideView), for: .touchUpInside)
        
    }
    
    @objc static func buttonTapped() {
        guard let textField = textField,
                  let button = button,
                  let closeButton = closeButton else {
                return
            }
        
        guard let text = textField.text, (!text.isEmpty && isValidFormat(text: textField.text!)) else {
            textField.text = Constants.emptyString
            textField.placeholder = Constants.textFieldError
                return
            }
        guard let color = UIColor(hex: text) else { return}
        mainView?.backgroundColor = color
        }
    
    @objc static func hideView() {
        guard let textField = textField,
                  let button = button,
                  let closeButton = closeButton else {
                return
            }
        textField.resignFirstResponder()
        UIView.animate(withDuration: Constants.durationOfAnimation) {
            textField.alpha = Constants.buttonHiddenAlfaOn
            button.alpha = Constants.buttonHiddenAlfaOn
                closeButton.alpha = Constants.buttonHiddenAlfaOn
            } completion: { _ in
                textField.removeFromSuperview()
                button.removeFromSuperview()
                closeButton.removeFromSuperview()
            }
        self.textField = nil
        self.button = nil
        self.closeButton = nil
    }
    
    private static func isValidFormat(text: String) -> Bool {
        return text.range(of: Constants.pattern, options: .regularExpression) != nil
    }
}
