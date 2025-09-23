//
//  sliderConfig.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 23.09.25.
//

import UIKit

class SliderConfiguration {
    static func configureSliders(stack: UIStackView, in view: UIView) {
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        view.addSubview(stack)
        stack.layer.cornerRadius = Constants.stackRadius
        stack.clipsToBounds = true
        
        let sliderRed = CustomSlider(title: Constants.red, min: Constants.sliderMin, max: Constants.sliderMax)
        let sliderBlue = CustomSlider(title: Constants.blue, min: Constants.sliderMin, max: Constants.sliderMax)
        let sliderGreen = CustomSlider(title: Constants.green, min: Constants.sliderMin, max: Constants.sliderMax)
        
        for slider in [sliderRed, sliderBlue, sliderGreen] {
            stack.addArrangedSubview(slider)
        }
        
        stack.pinCenterX(to: view.centerXAnchor)
        stack.pinLeft(to: view.leadingAnchor, Constants.stackLeading)
        stack.pinBottom(to: view.bottomAnchor, Constants.stackBottom)
        
        sliderRed.valueChanged = { [weak view] value in
            view?.backgroundColor =  updateBackGroundColor(sliderRed: sliderRed, sliderGreen: sliderGreen, sliderBlue: sliderBlue)
        }
        
        sliderBlue.valueChanged = { [weak view] value in
            view?.backgroundColor =  updateBackGroundColor(sliderRed: sliderRed, sliderGreen: sliderGreen, sliderBlue: sliderBlue)
        }
        
        sliderGreen.valueChanged = { [weak view] value in
            view?.backgroundColor =  updateBackGroundColor(sliderRed: sliderRed, sliderGreen: sliderGreen, sliderBlue: sliderBlue)
        }
    }
        
}
