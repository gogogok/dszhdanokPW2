//
//  randomColorButtonConfig.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 23.09.25.
//

        

import UIKit

class ActionButtonsConfiguration {
    static func configureButton(description: UILabel, stack:  UIStackView ,in view: UIView) {
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        view.addSubview(stack)
        stack.layer.cornerRadius = Constants.stackRadius
        stack.spacing = 15
        stack.distribution = .fillEqually
        
        let randomButton = createButton(title: "Random Background Color", color: .white)
        let HEXButton  = createButton(title: "Enter HEX Code", color: .white)
        let colorPicker = createButton(title: "Choose in color picker", color: .white)
        
        
        for button in [randomButton, HEXButton, colorPicker] {
            stack.addArrangedSubview(button)
            button.titleLabel?.numberOfLines = 0
        }
        
        stack.pinCenterX(to: view.centerXAnchor)
        stack.pinTop(to: description.bottomAnchor, Constants.stackOfButtonsTop)
        stack.pinLeft(to: view.leadingAnchor, 10)
        stack.pinRight(to: view.trailingAnchor, -10)
        stack.changeWidth(100)
        stack.changeHeight(60)
        
        randomButton.addTarget(self, action:  #selector(ActionButtonRandom(_ :)), for: .touchUpInside)
        
        
    }
    
    private static func createButton(title: String, color: UIColor) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.backgroundColor = color
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        return button
    }
    
    @objc static private func ActionButtonRandom( _ button: UIButton) {
        guard let view = button.superview?.superview else { return }
        button.isEnabled = false
        
        UIView.animate(withDuration: Constants.durationOfAnimation) {
            view.backgroundColor = getRandomColor()
            
        } completion: { _ in
            button.isEnabled = true
        }
    }
    
    @objc static private func ActionHEXButton( _ button: UIButton) {
        guard let view = button.superview?.superview else { return }
        button.isEnabled = false
        
        UIView.animate(withDuration: Constants.durationOfAnimation) {
            //внедрение логики
            
        } completion: { _ in
            button.isEnabled = true
        }
    }
    
    @objc static private func ActionColorPickerButton( _ button: UIButton) {
        guard let view = button.superview?.superview else { return }
        button.isEnabled = false
        
        UIView.animate(withDuration: Constants.durationOfAnimation) {
            //внедрение логики
            
        } completion: { _ in
            button.isEnabled = true
        }
    }
}
