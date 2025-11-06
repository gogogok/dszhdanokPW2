//
//  sliderConfig.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 23.09.25.
//

import UIKit

class SliderConfiguration {
    
    private enum Constants {
        static let stackRadius: CGFloat = 10
        static let stackBottom: CGFloat = 250
        static let stackLeading: CGFloat = 20
        static let viewBottom: CGFloat = 20
    }
    
    static func configureSliders(stack: UIStackView, in view: UIView,  sliderRed: CustomSlider, sliderBlue: CustomSlider, sliderGreen: CustomSlider) {
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        view.addSubview(stack)
        stack.layer.cornerRadius = Constants.stackRadius
        stack.clipsToBounds = true
        
        
        for slider in [sliderRed, sliderBlue, sliderGreen] {
            stack.addArrangedSubview(slider)
        }
        
        stack.pinCenterX(to: view.centerXAnchor)
        stack.pinLeft(to: view.leadingAnchor, Constants.stackLeading)
        stack.pinBottom(to: view.bottomAnchor, Constants.stackBottom)
    
    }
        
}
