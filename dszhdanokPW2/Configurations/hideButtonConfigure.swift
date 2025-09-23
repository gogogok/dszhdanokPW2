//
//  hideButtonConfigure.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 23.09.25.
//

import UIKit

class HideButtonConfiguration {
    static func configureButton(stack: UIStackView, in view: UIView) {
        let buttonOffOnSliders = CustomButton(title: Constants.hideButtonText, stack: stack, mainView: view)
        view.addSubview(buttonOffOnSliders)
        buttonOffOnSliders.pinCenterX(to: view.centerXAnchor)
        buttonOffOnSliders.changeWidth(Constants.buttomHideWidth)
        buttonOffOnSliders.pinTop(to: stack.topAnchor, Constants.buttomHideTop)
    }
}
