//
//  randomColorButtonConfig.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 23.09.25.
//

import UIKit

final class ActionButtonsConfiguration {
    
    enum Constants {
        static let stackOfButtonsTop: CGFloat = 20
        
        static let stackSpacing: CGFloat = 15
        static let randomButtonLable :String =  "Random Background Color"
        
        static let hexButtonLable :String = "Enter HEX Code"
        
        static let stackNumberOfLines: Int = 0
        static let stackButtonLeft: CGFloat = 10
        static let stackButtonRight: CGFloat = -10
        
        static let stackButtonWidth: CGFloat = 100
        static let stackButtonHeight: CGFloat = 60
        static let buttonCreationFont: CGFloat = 14
        
        static let stackRadius: CGFloat = 10
    }
    
    
    static func makeRandomButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("Random Color", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }

    static func makeHexButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("HEX Color", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    static func configureButton(description: UILabel, stack:  UIStackView ,in view: UIView, randomButton : UIButton, HEXButton: UIButton) {
        
        var mainView = view
        var stackST = stack
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        view.addSubview(stack)
        stack.layer.cornerRadius = Constants.stackRadius
        stack.spacing = Constants.stackSpacing
        stack.distribution = .fillEqually
        
        
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
        
        
    }
}

