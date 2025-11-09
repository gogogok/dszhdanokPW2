//
//  hideButtonConfigure.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 23.09.25.
//

import UIKit

class HideButtonConfiguration {
    
    //MARK: - Constants
    private enum Constants {
        static let buttomHideTop: CGFloat = -50
        static let buttomHideWidth: CGFloat = 250
        
        static let hideButtonText: String = "Hide sliders"
    }
    
    //MARK: - Configure func
    
    static func configureButton(stack: UIStackView, in view: UIView) -> UIButton{
        let buttonOffOnSliders = CustomButton(title: Constants.hideButtonText, stack: stack, mainView: view)
        view.addSubview(buttonOffOnSliders)
        buttonOffOnSliders.pinCenterX(to: view.centerXAnchor)
        buttonOffOnSliders.changeWidth(Constants.buttomHideWidth)
        buttonOffOnSliders.pinTop(to: stack.topAnchor, Constants.buttomHideTop)
        return buttonOffOnSliders
    }
}
