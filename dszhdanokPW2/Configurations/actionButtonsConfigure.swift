//
//  randomColorButtonConfig.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 23.09.25.
//

        

import UIKit

class ActionButtonsConfiguration {
    
    private static var mainView = UIView()
    private static var stackST = UIStackView()
    
    static func configureButton(description: UILabel, stack:  UIStackView ,in view: UIView) {
        
        mainView = view
        stackST = stack
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        view.addSubview(stack)
        stack.layer.cornerRadius = Constants.stackRadius
        stack.spacing = Constants.stackSpacing
        stack.distribution = .fillEqually
        
        let randomButton = createButton(title: Constants.randomButtonLable, color: .white)
        let HEXButton  = createButton(title: Constants.hexButtonLable, color: .white)
        
        for button in [randomButton, HEXButton] {
            stack.addArrangedSubview(button)
            button.titleLabel?.numberOfLines = Constants.stackNumberOfLines
        }
        
        stack.pinCenterX(to: view.centerXAnchor)
        stack.pinTop(to: description.bottomAnchor, Constants.stackOfButtonsTop)
        stack.pinLeft(to: view.leadingAnchor, Constants.stackButtonLeft)
        stack.pinRight(to: view.trailingAnchor, Constants.stackButtonRight)
        stack.changeWidth(Constants.stackButtonWidth)
        stack.changeHeight(Constants.stackButtonHeight)
        
        randomButton.addTarget(self, action:  #selector(ActionButtonRandom(_ :)), for: .touchUpInside)
        HEXButton.addTarget(self, action: #selector(ActionHEXButton(_ :)), for: .touchUpInside)
        
    }
    
    private static func createButton(title: String, color: UIColor) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.backgroundColor = color
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: Constants.buttonCreationFont, weight: .semibold)
        button.layer.cornerRadius = Constants.buttomHideCornerRadius
        button.clipsToBounds = true
        return button
    }
    
    @objc static private func ActionButtonRandom( _ button: UIButton) {
        button.isEnabled = false
        UIView.animate(withDuration: Constants.durationOfAnimation) {
            mainView.backgroundColor = getRandomColor()
        } completion: { _ in
            button.isEnabled = true
        }
    }
    
    @objc static private func ActionHEXButton( _ button: UIButton) {
        button.isEnabled = false
        UIView.animate(withDuration: Constants.durationOfAnimation) {
            TextFieldConfiguration.configureText(in: mainView, stack: stackST)
        } completion: { _ in
            button.isEnabled = true
        }
    }
    
//    @objc static private func ActionColorPickerButton( _ button: UIButton) {
//        button.isEnabled = false
//        
//        UIView.animate(withDuration: Constants.durationOfAnimation) {
//        //TextFieldConfiguration.configureText()
//            
//        } completion: { _ in
//            button.isEnabled = true
//        }
//    }
    
}
